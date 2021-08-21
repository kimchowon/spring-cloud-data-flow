#!/bin/bash
 
# variables
DB_URL='jdbc:mysql://localhost:3306/task'
DB_USERNAME='batch_user'
DB_PASSWORD='batch_user'
DB_DRIVER='org.mariadb.jdbc.Driver'
 
# run SCDF in background
java -jar spring-cloud-dataflow-server-2.7.0.jar \
--spring.datasource.url=$DB_URL \
--spring.datasource.username=$DB_USERNAME \
--spring.datasource.password=$DB_PASSWORD \
--spring.datasource.driver-class-name=$DB_DRIVER \
--spring.cloud.dataflow.features.streams-enabled=false \
--spring.flyway.enabled=false
 
exit 0
