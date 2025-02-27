FROM confluentinc/cp-kafka:latest
USER root
RUN mkdir -p /opt/kafka/configs
COPY server.properties /opt/kafka/configs/server.properties
CMD ["/etc/confluent/docker/run"]