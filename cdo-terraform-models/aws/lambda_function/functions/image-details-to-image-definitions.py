"""
https://docs.aws.amazon.com/lambda/latest/dg/python-handler.html
https://docs.aws.amazon.com/codepipeline/latest/userguide/actions-invoke-lambda-function.html
https://docs.aws.amazon.com/codepipeline/latest/APIReference/API_JobDetails.html -> https://docs.aws.amazon.com/codepipeline/latest/APIReference/API_JobData.html
"""
import json
import boto3
import zipfile
import tempfile

code_pipeline = boto3.client('codepipeline')
s3 = boto3.client('s3')


def lambda_handler(event, context) -> bool:
    """
    Generates imagedefinitions.json from imageDetails.json

    :param event: an event object passed through Lambda function caller
    :param context: a context object passed through Lambda function caller
    :return: a bool representing the execution completeness
    """
    print(f"EVENT: {event}\n\nCONTEXT: {context}")

    job_id = event['CodePipeline.job']['id']
    bucket_name = event['CodePipeline.job']['data']['inputArtifacts'][0]['location']['s3Location']['bucketName']
    object_key = event['CodePipeline.job']['data']['inputArtifacts'][0]['location']['s3Location']['objectKey']
    output_name = event['CodePipeline.job']['data']['outputArtifacts'][0]['location']['s3Location']['bucketName']
    output_key = event['CodePipeline.job']['data']['outputArtifacts'][0]['location']['s3Location']['objectKey']

    with tempfile.NamedTemporaryFile() as named_temporary_file:
        s3.download_file(bucket_name, object_key, named_temporary_file.name)
        with zipfile.ZipFile(named_temporary_file.name, 'r') as named_temporary_zip:
            image_detail_data = named_temporary_zip.read('imageDetail.json')
            image_detail = json.loads(image_detail_data)
            image_uri = image_detail['ImageURI'].split('@')[0]
            image_tag = image_detail['ImageTags'][0]
            repository_name = image_detail['RepositoryName']
            image = f"{image_uri}:{image_tag}"
            definition = [{'name': repository_name, 'imageUri': image}]

            with open('/tmp/imagedefinitions.json', 'w') as image_definitions_file:
                json.dump(definition, image_definitions_file)

            zipfile.ZipFile('/tmp/imagedefinitions.zip', mode='w').write("/tmp/imagedefinitions.json")
            s3.upload_file('/tmp/imagedefinitions.zip', output_name, output_key)
            code_pipeline.put_job_success_result(jobId=job_id)
    return True
