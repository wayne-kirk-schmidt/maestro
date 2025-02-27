FROM confluentinc/cp-kafka:latest
USER root
COPY hardening.sh /opt/hardening.sh
RUN chmod +x /opt/hardening.sh && /opt/hardening.sh
RUN mkdir -p /opt/kafka/configs
COPY server.properties /opt/kafka/configs/server.properties
CMD ["/etc/confluent/docker/run"]