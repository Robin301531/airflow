#!/bin/bash
echo "Initializing Airflow DB..."
airflow db init

echo "Creating Airflow admin user..."
airflow users create \
    --username admin \
    --password admin \
    --firstname Admin \
    --lastname User \
    --role Admin \
    --email admin@example.com || true

echo "Starting Airflow webserver with SequentialExecutor..."
exec airflow webserver
