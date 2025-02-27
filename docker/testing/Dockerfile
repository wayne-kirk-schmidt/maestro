FROM ppodgorsek/robot-framework:latest
USER root
COPY hardening.sh /opt/hardening.sh
RUN chmod +x /opt/hardening.sh && /opt/hardening.sh
CMD ["robot", "-d", "/opt/robotframework/reports", "/opt/robotframework/tests"]