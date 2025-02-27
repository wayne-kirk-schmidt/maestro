FROM confluentinc/cp-zookeeper:latest
USER root
COPY hardening.sh /opt/hardening.sh
RUN chmod +x /opt/hardening.sh && /opt/hardening.sh
CMD ["/etc/confluent/docker/run"]