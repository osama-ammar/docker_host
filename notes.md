Airflow is a workflow management system that defines tasks and and their dependencies as code,
  executes those tasks on a regular schedule, and distributes task execution across worker processes.
  Airflow offers an excellent UI that displays the states of currently active and past tasks, 
  shows diagnostic information about task execution, and allows the user to manually manage the execution and state of tasks.
 - what happens when we run airflow ..... DAGs directory will be scanned to see tasks to be run ()
 - the included tasks will be run as configured in dags files (ml-model-dag.py in my case)
 - in my case this task will run daily as long as docker container is runnning 
 - to see the details of the task .. in airflow ui , click on the task .. click logs and you will see details


we will need these at the samme directory:
- docker file : The Dockerfile ensures that the required dependencies are baked into the image itself. This means every container started from the image will already have all the dependencies installed.
- docker compose file: If you only use docker-compose.yaml and point to the base Airflow image (apache/airflow), it will not include extra libraries like scikit-learn. This is why you're getting errors like ModuleNotFoundError: No module named 'sklearn'

Note
======
- in the last run , the webserver was not running , I foun that port is used by abother process that i don/t know in this computer --> i get this process from task manager and ended it  , then rerun air flow again and it worked
- check logs in docker desktop to findout problems

- to know running apps that uses specific port  ...run this in cmd [netstat -aon | findstr :8080]
- most problem s I face are due to used ports by other applications .... so I changed port in docker compose file ....details of ports:
  """
      ports:
        - 8081:8080
  """
  8081 (Host Port):

      This is the port on your host machine (your computer) that will be used to access the service running inside the container.
      In this case, when you navigate to http://localhost:8081 on your browser, the request is forwarded to the container.

  8080 (Container Port):

      This is the port inside the Docker container that the service (Airflow webserver) listens to.
      The Airflow 




























