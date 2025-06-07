FROM apache/airflow:2.9.0

USER root
RUN apt-get update && apt-get install -y curl nano && apt-get clean

COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt

COPY dags /opt/airflow/dags
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER airflow
ENTRYPOINT ["/entrypoint.sh"]
