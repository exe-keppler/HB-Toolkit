#!/bin/bash

# Aj

# Función para realizar escaneos con Nmap
function nmap_scan() {
    read -p "Introduce la dirección IP: " IP
    echo "1. Escaneo completo, TCP, detección de versión"
    echo "2. Escaneo completo, scripts por defecto, detección de versión"
    echo "3. Escaneo de vulnerabilidades"
    read -p "Tipo de escaneo Nmap: " nmap_opcion

    case $nmap_opcion in
        1) nmap -p- -sT -sV -A $IP;;
        2) nmap -p- -sC -sV $IP --open;;
        3) nmap -p- --script=vuln $IP;;
        *) echo "Opción no válida";;
    esac
}

# Función para realizar escaneos con WPScan
function wpscan() {
    read -p "Introduce la URL: " URL
    echo "1. Enumerar plugins, temas y usuarios"
    echo "2. Fuerza bruta de usuarios"
    read -p "Tipo de escaneo WPScan: " wpscan_opcion

    case $wpscan_opcion in
        1) wpscan --url $URL --disable-tls-checks --enumerate p --enumerate t --enumerate u;;
        2) wpscan --url $URL --disable-tls-checks -U users -P /usr/share/wordlists/rockyou.txt;;
        *) echo "Opción no válida";;
    esac
}

# Función para realizar escaneos con Nikto
function nikto_scan() {
    read -p "Introduce la dirección IP: " IP
    nikto --host $IP -ssl -evasion 1
}

# Función para realizar escaneos con dnsrecon
function dnsrecon_scan() {
    read -p "Introduce el dominio: " dominio
    dnsrecon -d $dominio
}

# Función para realizar búsquedas con gobuster
function gobuster_scan() {
    read -p "Introduce la URL: " URL
    echo "1. Buscar directorios"
    echo "2. Buscar archivos"
    read -p "Tipo de búsqueda: " gobuster_opcion

    case $gobuster_opcion in
        1) gobuster dir -u $URL -w /opt/SecLists/Discovery/Web-Content/raft-medium-directories.txt -k -t 30;;
        2) gobuster dir -u $URL -w /opt/SecLists/Discovery/Web-Content/raft-medium-files.txt -k -t 30;;
        *) echo "Opción no válida";;
    esac
}

# Función para realizar escaneos con wfuzz
function wfuzz_scan() {
    read -p "Introduce la URL: " URL
    wfuzz -C -Z -w /opt/SecLists/Fuzzing/XSS/XSS-BruteLogic.txt --hc 404 "$URL"
}

# Función para extraer IPs de un archivo
function extract_ips() {
    read -p "Introduce el nombre del archivo: " archivo
    grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' $archivo
}

echo "🚀 OSCP Toolkit 🚀"

while true; do
    echo "Selecciona una opción:"
    echo "1. Nmap Scans"
    echo "2. WPScan"
    echo "3. Nikto"
    echo "4. dnsrecon"
    echo "5. gobuster"
    echo "6. wfuzz"
    echo "7. Extraer IPs de un archivo"
    echo "8. Salir"
    read -p "Opción: " opcion

    case $opcion in
        1) nmap_scan;;
        2) wpscan;;
        3) nikto_scan;;
        4) dnsrecon_scan;;
        5) gobuster_scan;;
        6) wfuzz_scan;;
        7) extract_ips;;
        8) break;;
        *) echo "Opción no válida";;
    esac
done

