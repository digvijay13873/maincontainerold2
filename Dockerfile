FROM apache/airflow:2.1.0
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt
COPY . /tmp/

# Document the exposed port and start server
EXPOSE 8080
