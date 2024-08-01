FROM odoo:16

USER root

COPY requirements.txt /

RUN pip3 install -r /requirements.txt
RUN chown -R odoo:odoo /var/lib/odoo

#COPY config/odoo.conf /etc/odoo/odoo.conf
#COPY addons_odoov16 /mnt/extra-addons

USER odoo

CMD ["odoo", "-i", "amazon_s3_storage", "--http-port", "80"]
