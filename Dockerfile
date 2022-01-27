FROM apache/airflow:2.1.0
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
COPY . /tmp/
# Document the exposed port and start server
EXPOSE 8080
RUN apt-get install dos2unix
RUN dos2unix /usr/local/bin/app/server/server.sh

# Set the server startup script as executable
RUN  ["chmod", "+x", "/usr/local/bin/app/server/server.sh"]
ENTRYPOINT [ "/usr/local/bin/app/server/server.sh" ]
