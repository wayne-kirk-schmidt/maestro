FROM idoitsystems/idoit-open:latest
USER root
COPY hardening.sh /opt/hardening.sh
RUN chmod +x /opt/hardening.sh && /opt/hardening.sh
CMD ["apache2-foreground"]