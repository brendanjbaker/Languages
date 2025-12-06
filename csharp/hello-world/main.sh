#!/usr/bin/env bash

dotnet build -c Release > /dev/null

exec bin/Release/*/Program
