@echo off
echo Importing database...
mysql -u root -p tduck < tduck-platform\tduck-platform\docker\init-db\tduck-v4.sql
echo Database import completed.
pause
