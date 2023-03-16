# Desplegando un blog anónimo en servicios Onion

En este repositorio recopilamos la información necesaria para crear un blog anónimo en una computadora vieja.

El resultado será un blog publicado en la red Tor que podrá ser accedido por cualquier persona usando el [navegador Tor](https://www.torproject.org/download/).

## Materiales  

1. Computadora vieja la llamaremos `cliente`)
1. Computadora vieja la llamaremos `cliente`)

2. Computadora personal
2. Computadora personal

4. Cable de red

>Este tutorial asume que el servidor tiene un sistema operativo Debian.


## Creando un blog con ayuda de Tor y Jekyll

Jekyll es un generador de sitios estáticos que utiliza Markdown para describir el contenido que se desea mostrar. Usaremos Jekyll para desplegar un blog localmente y usaremos Tor para publicarlo como un Onion Service.

### Conectando las dos computadoras con SSH

Conecta el servidor por WiFi o por cable ethernet a la misma red que el cliente.


### Descargando los archivos necesarios

En una terminal ejecuta los siguientes comandos:


    cd ~ ;
    wget https://github.com/digitalautonomy/Jekyll-Onion-blog/archive/refs/heads/main.zip ;
    unzip main.zip ; 
    cd Jekyll-Onion-blog-main

Este comando realiza varias tareas:

1. Descarga un archivo comprimido con los archivos necesarios para publicar el blog

2. Descomprime este archivo

3. Pasa la terminal en la que ejecutaste el comando a la carpeta donde están todos los archivos necesarios

Ahora tu terminal se verá así:

    ~/Jekyll-Onion-blog-main$

#### En el servidor


Si no tienes entorno gráfico, ya estás en la Terminal! Una vez logeado en tu usuario puedes copiar el texto.
Abre la aplicación Terminal y escribe:

    su -


Inserta la contraseña de superusuario establecida, da enter

Inserta la contraseña de superusuario establecida, da enter

En las siguientes líneas tienes que cambiar `user` por el nombre de usuario del servidor y `192.168.10.1` por la dirección IP retornada en el paso anterior.

    apt install openssh-client | ssh user@192.168.10.10

La terminal te pedirá confirmación para realizar la descarga, después pedirá la contraseña del usuario `user` del Debian.


### Nuestra plantilla para el blog

Ahora vamos a instalar la platilla en (lugar), copia y pega cada linea en la terminal:


        su - 
        apt install git | cd ~  | git clone https://github.com/digitalautonomy/Jekyll-Onion-blog.git


Este te va a pedir que pongas tu contrasena de  usuario root, para seguir solo presione Enter
al final vas a resultar con una carpeta llamada Jekyll-Onion-blog
Ahora vamos a instalar la platilla en (lugar), copia y pega cada linea en la terminal:


        su - 
        apt install git | cd ~  | git clone https://github.com/digitalautonomy/Jekyll-Onion-blog.git


Este te va a pedir que pongas tu contrasena de  usuario root, para seguir solo presione Enter
al final vas a resultar con una carpeta llamada Jekyll-Onion-blog

### Desplegando el blog

para iniciar la instalacion automatica de los requerimientos copia y pega esto en la terminal:

        cd /Jekyll-Onion-blog/DEV/
        chmod +x installation.sh./installation.sh
        chmod +x installation.sh./installation.sh

Para finalizar la instalacion reinicia tu equipo.



### Publicando el blog en la red Tor

## Manteniendo y publicando el blog
