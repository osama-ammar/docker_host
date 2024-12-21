Airflow is a WMS that defines tasks and and their dependencies as code,
  executes those tasks on a regular schedule, and distributes task execution across worker processes.
  Airflow offers an excellent UI that displays the states of currently active and past tasks, 
  shows diagnostic information about task execution, and allows the user to manually manage the execution and state of tasks.



we will need rhese at the samme directory:
- docker file : The Dockerfile ensures that the required dependencies are baked into the image itself. This means every container started from the image will already have all the dependencies installed.
- docker compose file: If you only use docker-compose.yaml and point to the base Airflow image (apache/airflow), it will not include extra libraries like scikit-learn. This is why you're getting errors like ModuleNotFoundError: No module named 'sklearn'

Note
======
in the last run , the webserver was not running , I foun that port is used by abother process that i don/t know in this computer --> i get this process from task manager and ended it  , then rerun air flow again and it worked






























