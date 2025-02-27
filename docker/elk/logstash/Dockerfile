FROM docker.elastic.co/logstash/logstash:8.5.3
USER root
COPY hardening.sh /opt/hardening.sh
RUN chmod +x /opt/hardening.sh && /opt/hardening.sh
COPY logstash.conf /usr/share/logstash/pipeline/
CMD ["logstash", "-f", "/usr/share/logstash/pipeline/logstash.conf"]