#!/bin/bash

display_help() {
    echo "Użycie: $0 [OPCJA]"
    echo "Dostępne opcje:"
    echo "  --date, -d           Wyświetla dzisiejszą datę."
    echo "  --logs [liczba], -l  Tworzy podaną liczbę plików logów. Domyślnie 100."
    echo "  --init, -i           Klonuje całe repozytorium do katalogu bieżącego i ustawia ścieżkę w zmiennej PATH."
    echo "  --error [liczba], -e [liczba]"
    echo "                        Tworzy podaną liczbę plików błędów. Domyślnie 100."
    echo "  --help, -h           Wyświetla pomoc."
}

if [[ "$1" == "--help" || "$1" == "-h" || "$1" == "-" ]]; then
    display_help
elif [[ "$1" == "--date" || "$1" == "-d" ]]; then
    date +"Dzisiaj jest %Y-%m-%d"
elif [[ "$1" == "--logs" || "$1" == "-l" ]]; then
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
elif [[ "$1" == "--init" || "$1" == "-i" ]]; then
    # Pobieranie bieżącej ścieżki
    current_path=$(pwd)
    # Klonowanie repozytorium do bieżącego katalogu
    git clone https://example.com/repo.git "$current_path/repo"
    # Dodanie katalogu z repozytorium do zmiennej środowiskowej PATH
    echo "export PATH=\"$current_path/repo:\$PATH\"" >> ~/.bashrc
    echo "Zaktualizowano zmienną środowiskową PATH. Zrestartuj terminal, aby wprowadzić zmiany."
elif [[ "$1" == "--error" || "$1" == "-e" ]]; then
    if [[ -n "$2" && "$2" =~ ^[0-9]+$ ]]; then
        num_errors="$2"
    else
        num_errors=100
    fi
    
    mkdir -p errorx
    
    for ((i=1; i<=$num_errors; i++)); do
        error_file="errorx/error$i.txt"
        echo "Error message $i" > "$error_file"
    done
else
    echo "Niepoprawne użycie."
    display_help
fi
