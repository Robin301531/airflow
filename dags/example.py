# dags/hello_airflow.py
from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG(dag_id="hello_airflow", start_date=datetime(2023, 1, 1), schedule_interval="@daily", catchup=False) as dag:
    task = BashOperator(task_id="print_hello", bash_command="echo 'Hello, Airflow!'")
