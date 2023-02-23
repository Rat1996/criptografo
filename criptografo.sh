#!/bin/bash

echo "Bem-vindo ao script de criptografia!"

while true; do
    read -p "Deseja criptografar ou descriptografar um arquivo? [c/d]: " choice
    case $choice in
        c)
            read -p "Digite o caminho do arquivo que deseja criptografar: " file
            read -s -p "Digite uma senha forte: " password
            echo
            openssl aes-256-cbc -salt -in "$file" -out "${file}.encrypted" -pass "pass:$password"
            echo "Arquivo criptografado com sucesso!"
            break
            ;;
        d)
            read -p "Digite o caminho do arquivo que deseja descriptografar: " file
            read -s -p "Digite a senha: " password
            echo
            openssl aes-256-cbc -d -salt -in "$file" -out "${file%.encrypted}" -pass "pass:$password"
            echo "Arquivo descriptografado com sucesso!"
            break
            ;;
        *)
            echo "Opção inválida, tente novamente."
            ;;
    esac
done
