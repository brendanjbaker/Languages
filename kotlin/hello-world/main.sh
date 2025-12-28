#!/usr/bin/env bash

kotlinc Program.kt -include-runtime -d program.jar
java -jar program.jar
