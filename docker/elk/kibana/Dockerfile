FROM docker.elastic.co/kibana/kibana:8.5.3
USER kibana
COPY hardening.sh /opt/hardening.sh
RUN chmod +x /opt/hardening.sh && /opt/hardening.sh
CMD ["/usr/local/bin/kibana-docker"]