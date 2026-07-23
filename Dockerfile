FROM ubuntu:22.04

# تثبيت الأدوات الأساسية وتجاوز فحص المفاتيح المعقد لتفادي حظر الشبكة
RUN apt-get update && apt-get install -y curl apt-transport-https gnupg2
RUN curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl -fsSL https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2022.list | tee /etc/apt/sources.list.d/mssql-server-2022.list

# التثبيت المباشر للـ SQL Server
RUN apt-get update && apt-get install -y mssql-server

ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=Dodo2009
ENV MSSQL_MEMORY_LIMIT_MB=200

EXPOSE 1433

CMD ["/opt/mssql/bin/sqlservr"]
