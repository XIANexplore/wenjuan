@echo off
echo Starting Tduck Backend...
cd tduck-platform\tduck-platform
call mvn clean install -DskipTests
cd tduck-api
call mvn spring-boot:run
pause
