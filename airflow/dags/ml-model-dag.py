from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
import os

# Import the train_model function
from train_model import train_model

"""
In Airflow, a DAG – or a Directed Acyclic Graph – 
is a collection of all the tasks you want to run, organized in a way that reflects their relationships and dependencies

to run airflow , you should use linux || WSL2 || airflow docker( which I will use here)
I will start docker engine and pull airflow docker image 


"""


# this task will start from the folwing date
default_args = {
    'owner': 'osama',
    'start_date': datetime(2024, 11, 3),
}


#the following task will be run daily , catchup=False: Disables catch-up, which means Airflow will not run past scheduled tasks if it has missed any due to downtime.
with DAG('ml_model_training_dag', default_args=default_args, schedule_interval='@daily', catchup=False) as dag:
    
    # Task to train the model
    # PythonOperator: allows you to define a task that runs a Python callable (function or method) when the task is triggered.
    train_task = PythonOperator(task_id='train_model',python_callable=train_model,)

    # Specify task dependencies if needed
    train_task
    
    
    
    