#!/bin/bash

display_help() {
    echo "Użycie: $0 [OPCJA]"
    echo "Dostępne opcje:"
    echo "  --date           Wyświetla dzisiejszą datę."
    echo "  --logs [liczba]  Tworzy podaną liczbę plików logów. Domyślnie 100."
    echo "  --init           Klonuje całe repozytorium do katalogu bieżącego i ustawia ścieżkę w zmiennej PATH."
    echo "  --help, -h       Wyświetla pomoc."
}

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    display_help
elif [[ "$1" == "--date" ]]; then
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
elif [[ "$1" == "--init" ]]; then
    # Pobieranie bieżącej ścieżki
    current_path=$(pwd)
    # Klonowanie repozytorium do bieżącego katalogu
    git clone https://example.com/repo.git "$current_path/repo"
    # Dodanie katalogu z repozytorium do zmiennej środowiskowej PATH
    echo "export PATH=\"$current_path/repo:\$PATH\"" >> ~/.bashrc
    echo "Zaktualizowano zmienną środowiskową PATH. Zrestartuj terminal, aby wprowadzić zmiany."
else
    echo "Niepoprawne użycie."
    display_help
fi
