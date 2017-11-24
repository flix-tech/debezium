#!/usr/bin/env bash
VERSION=0.7.0-flixtech-`date +%Y%m%d-%H%M`

pushd support/checkstyle
mvn versions:set -DnewVersion=$VERSION
mvn clean install -DskipTests -DskipITs 

popd
mvn versions:set -DnewVersion=$VERSION
mvn clean install -DskipTests -DskipITs

pushd debezium-connect-mysql
mvn dependency:copy-dependencies

popd
