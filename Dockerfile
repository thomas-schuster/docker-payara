FROM payara/server-full:latest

USER payara
RUN wget --no-verbose https://jdbc.postgresql.org/download/postgresql-42.2.5.jar && mv postgresql-42.2.5.jar /opt/payara/appserver/glassfish/lib