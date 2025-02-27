FROM zammad/zammad:latest
USER root
COPY hardening.sh /opt/hardening.sh
RUN chmod +x /opt/hardening.sh && /opt/hardening.sh
CMD ["/docker-entrypoint.sh"]