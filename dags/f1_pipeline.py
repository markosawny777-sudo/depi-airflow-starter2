from datetime import datetime
from airflow.sdk import DAG
from airflow.providers.standard.operators.bash import BashOperator

DBT_DIR = "/opt/airflow/T/f1_dbt"

with DAG(
    dag_id="f1_pipeline",
    start_date=datetime(2026, 1, 1),
    schedule=None,
    catchup=False,
    tags=["f1", "dbt"],
) as dag:

    extract_load = BashOperator(
        task_id="extract_load",
        bash_command="cd /opt/airflow/EL && python main.py",
    )

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command=f"cd {DBT_DIR} && dbt run --profiles-dir {DBT_DIR}",
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command=f"cd {DBT_DIR} && dbt test --profiles-dir {DBT_DIR}",
    )

    extract_load >> dbt_run >> dbt_test
