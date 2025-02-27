FROM docker.elastic.co/logstash/logstash:8.5.3
USER root
COPY logstash.conf /usr/share/logstash/pipeline/
CMD ["logstash", "-f", "/usr/share/logstash/pipeline/logstash.conf"]