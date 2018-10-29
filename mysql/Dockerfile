FROM mysql

# Copy initialize scripts of database to a container directory
# This scripts will be initialize in first time of the container is builded
COPY docker/mysql/scripts/. /docker-entrypoint-initdb.d