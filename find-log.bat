@echo off
for /f %%i in ('docker compose -f docker-compose.cicd.yaml ps -q woodpecker-server') do (
    docker inspect --format "{{range .Config.Env}}{{println .}}{{end}}" %%i | findstr /B "WOODPECKER_HOST="
)