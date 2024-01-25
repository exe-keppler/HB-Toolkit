# OSCP Toolkit

## Descripción
`oscp_toolkit.sh` es un script de Bash diseñado para automatizar y facilitar varias tareas comunes en el pentesting y la preparación para el examen OSCP. Este script proporciona un menú interactivo que permite al usuario elegir entre una variedad de herramientas de pentesting y ejecutar comandos específicos preconfigurados.

## Funcionalidades

### Menú Interactivo
- El script inicia con un menú que presenta opciones como Nmap, WPScan, Nikto, dnsrecon, gobuster, y wfuzz.
- El usuario puede seleccionar la herramienta deseada ingresando el número correspondiente.

### Opciones de Herramientas

#### Nmap Scans
- Permite realizar diferentes tipos de escaneos con Nmap:
  - Escaneo completo con detección de versión y scripts.
  - Escaneo de vulnerabilidades.
  - El usuario debe ingresar la dirección IP del objetivo.

#### WPScan
- Realiza escaneos en sitios WordPress para encontrar vulnerabilidades, plugins, temas y realizar fuerza bruta en usuarios.
- El usuario debe proporcionar la URL del sitio WordPress.

#### Nikto
- Ejecuta el escáner de servidor web Nikto para detectar vulnerabilidades y problemas de seguridad.
- Requiere la dirección IP del servidor web.

#### dnsrecon
- Realiza reconocimiento de DNS en un dominio específico.
- El usuario debe ingresar el nombre del dominio a investigar.

#### gobuster
- Utiliza gobuster para la búsqueda de directorios y archivos ocultos en sitios web.
- El usuario debe proporcionar la URL y seleccionar entre búsqueda de directorios o archivos.

#### wfuzz
- Permite realizar fuzzing en aplicaciones web utilizando wfuzz.
- Se utiliza para detectar XSS, inyecciones SQL, y otros.
- El usuario debe ingresar la URL de destino.

### Extractor de IPs
- Extrae direcciones IP de archivos de texto, como archivos de registro o resultados de escaneo.

## Cómo Contribuir
Las contribuciones son bienvenidas y valoradas. Si deseas añadir nuevas funciones, mejorar la interfaz del usuario, o cualquier otra mejora, por favor sigue los pasos descritos en la sección de contribución.

## Uso
Para utilizar este script, clónalo en tu sistema, otórgale permisos de ejecución con `chmod +x oscp_toolkit.sh`, y ejecútalo en una terminal. Asegúrate de tener instaladas todas las herramientas requeridas
