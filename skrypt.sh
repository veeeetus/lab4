#!/bin/bash

display_help() {
    echo "Użycie: $0 [OPCJA]"
    echo "Dostępne opcje:"
    echo "  --date           Wyświetla dzisiejszą datę."
    echo "  --logs [liczba]  Tworzy podaną liczbę plików logów. Domyślnie 100."
    echo "  --help           Wyświetla pomoc."
}

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
elif [[ "$1" == "--help" ]]; then
    display_help
else
    echo "Niepoprawne użycie."
    display_help
fi