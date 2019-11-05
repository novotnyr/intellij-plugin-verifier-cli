#!/bin/sh
[ "${JAVA_HOME}" ] || { echo "JAVA_HOME must be set"; exit 1; }

[ "${VERIFIER_HOME}" ] || VERIFIER_HOME=~/Applications/intellij-plugin-verifier

if [ -z "$IDE_PATHS" ]
then
	II_2019_2="/Applications/IntelliJ IDEA.app/contents"
	IDE_PATHS="${II_2019_2}"
fi

DISTRIBUTION_DIR="./build/distributions"
# --------

has_exactly_one_file() {
	DIR="$1"
	COUNT=$( find "$DIR" -type f | wc -l | tr -d '[:blank:]' )
	if [ "$COUNT" -eq 1 ]
	then
		return 0
	else
		return 1
	fi
}

if ! has_exactly_one_file "${DISTRIBUTION_DIR}"
then
	echo "Too many plugin releases. Cleanup the distribution folder"
	exit 1
fi

java -jar "${VERIFIER_HOME}/verifier-all.jar" check-plugin "${DISTRIBUTION_DIR}"/* "${IDE_PATHS}"
