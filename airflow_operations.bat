@echo off
:: to setup airflow docker[https://medium.com/@garc1a0scar/how-to-start-with-apache-airflow-in-docker-windows-902674ad1bbe]
:: install docker desktop , run this script with this file exist (https://airflow.apache.org/docs/apache-airflow/2.0.2/docker-compose.yaml)
:: make this dir :%USERPROFILE%\docker\airflow" then 
:: Step 1: Create directories for Airflow
echo Creating Airflow directories...
D:\Code_store\docker_host\airflow
set "AIRFLOW_DIR=D:\Code_store\docker_host\airflow"
@REM mkdir "%AIRFLOW_DIR%\dags"
@REM mkdir "%AIRFLOW_DIR%\plugins"
@REM mkdir "%AIRFLOW_DIR%\logs"

:: Step 2: Check for docker-compose.yaml file
echo Checking for docker-compose.yaml file...
set "COMPOSE_FILE_PATH=%AIRFLOW_DIR%\docker-compose.yaml"
if not exist "%COMPOSE_FILE_PATH%" (
    echo Please make sure docker-compose.yaml is in %AIRFLOW_DIR%
    pause
    exit /b
)

:: Step 3: Navigate to Airflow directory
cd /d "%AIRFLOW_DIR%"

:: Step 4: Initialize Airflow with Docker Compose
echo Initializing Airflow database...
docker-compose up airflow-init

:: Step 5:This command starts the Airflow containers (webserver, scheduler, etc.) in detached mode.
echo Starting Airflow services...
docker-compose up -d

echo Airflow setup completed. You can access the Airflow web interface at http://localhost:8081/home or better enter from docker desktop
echo Use username 'airflow' and password 'airflow' to log in.

:: Step 6: Provide final instructions
echo.
echo To stop all Airflow services, you can use the command:
echo docker-compose down
echo.

pause
