# Atlassian Jira-Software Docker

## Run

### Create directories

```bash
mkdir -p /tmp/jira-app /tmp/jira-psql
```

## Start Postgresql

```bash
docker rm jira-db
docker run \
--name jira-db \
-e POSTGRES_USER=jira \
-e POSTGRES_DB=jira \
-e POSTGRES_PASSWORD=test123 \
-p 5432:5432 \
-v /tmp/jira-psql:/var/lib/postgresql/data \
docker.io/postgres:9.6
```

## Start Jira

```bash
docker rm jira-app
docker run \
--name jira-app \
-e HOSTNAME=localhost \
-e SCHEMA=http \
-e PORT=8080 \
-p 8080:8080 \
-v /tmp/jira-app:/var/lib/jira \
--link jira-db:jira-db \
docker.io/bborbe/atlassian-jira-software:7.8.1-1.2.0
```

## Setup Jira

Open [http://localhost:8080](http://localhost:8080)

Database-Setup:

* Host: jira-db
* Port 5432
* Database: jira
* User: jira
* Pass: test123

## Version Schema

JIRAVERISON-BUILDVERSION

7.8.1-1.2.0 = Jira-Software 7.8.1 and Buildscripts 1.2.0
