#!/bin/bash

if [[ "$1" == "--date" ]]; then
    date +"Dzisiaj jest %Y-%m-%d"
else
    echo "Użycie: $0 --date"
fi