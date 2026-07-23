FROM ubuntu:22.04

# تثبيت الأدوات الأساسية والـ SQL Server
RUN apt-get update && apt-get install -y wget gnupg2 apt-transport-https curl
RUN wget -qO- https://microsoft.com | gpg --dearmor > /usr/share/keyrings/microsoft.gpg
RUN echo "deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/microsoft.gpg] https://microsoft.com jammy main" > /etc/apt/sources.list.d/mssql-server.list
RUN apt-get update && apt-get install -y mssql-server

ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=Dodo2009
ENV MSSQL_MEMORY_LIMIT_MB=200

EXPOSE 1433

CMD ["/opt/mssql/bin/sqlservr"]
