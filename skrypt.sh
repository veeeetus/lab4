#!/bin/bash

if [[ "$1" == "--date" ]]; then
    date +"Dzisiaj jest %Y-%m-%d"
elif [[ "$1" == "--logs" ]]; then
    if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
        num_logs="$2"
    else
        num_logs=100
    fi
    
    for ((i=1; i<=$num_logs; i++)); do
        log_file="log$i.txt"
        echo "Plik logowy: $log_file" > "$log_file"
        echo "Utworzony przez: $0" >> "$log_file"
        echo "Data utworzenia: $(date +"%Y-%m-%d %T")" >> "$log_file"
    done
else
    case "$1" in
        --date)
            date +"Dzisiaj jest %Y-%m-%d"
            ;;
        --logs)
            num_logs=100
            for ((i=1; i<=$num_logs; i++)); do
                log_file="log$i.txt"
                echo "Plik logowy: $log_file" > "$log_file"
                echo "Utworzony przez: $0" >> "$log_file"
                echo "Data utworzenia: $(date +"%Y-%m-%d %T")" >> "$log_file"
            done
            ;;
        *)
            echo "Użycie: $0 --date"
            echo "lub"
            echo "Użycie: $0 --logs [liczba_plików]"
            ;;
    esac
fi