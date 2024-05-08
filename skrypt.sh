#!/bin/bash

if [[ "$1" == "--date" ]]; then
    date +"Dzisiaj jest %Y-%m-%d"
elif [[ "$1" == "--logs" ]]; then
    for ((i=1; i<=100; i++)); do
        log_file="log$i.txt"
        echo "Plik logowy: $log_file" > "$log_file"
        echo "Utworzony przez: $0" >> "$log_file"
        echo "Data utworzenia: $(date +"%Y-%m-%d %T")" >> "$log_file"
    done
else
    echo "Użycie: $0 --date"
    echo "lub"
    echo "Użycie: $0 --logs"
fi