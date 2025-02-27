FROM docker.elastic.co/elasticsearch/elasticsearch:8.5.3
USER elasticsearch
COPY hardening.sh /opt/hardening.sh
RUN chmod +x /opt/hardening.sh && /opt/hardening.sh
CMD ["/usr/local/bin/docker-entrypoint.sh", "elasticsearch"]