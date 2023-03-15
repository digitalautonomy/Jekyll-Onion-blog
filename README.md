# Desplegando un blog anónimo en servicios Onion

En este repositorio recopilamos la información necesaria para crear un blog anónimo en una computadora vieja.

El resultado será un blog publicado en la red Tor que podrá ser accedido por cualquier persona usando el [navegador Tor](https://www.torproject.org/download/).

## Materiales  

1. Computadora vieja (la llamaremos `servidor`)

2. Computadora personal (la llamaremos `cliente`)

4. Cable de red

>Este tutorial asume que el servidor tiene un sistema operativo Debian.


## Creando un blog con ayuda de Tor y Jekyll

Jekyll es un generador de sitios estáticos que utiliza Markdown para describir el contenido que se desea mostrar. Usaremos Jekyll para desplegar un blog localmente y usaremos Tor para publicarlo como un Onion Service.

### Conectando las dos computadoras con SSH
Conecta el servidor por WiFi o por cable ethernet a la misma red que el cliente.
#### En el servidor


>Si no tienes entorno gráfico, ya estás en la Terminal! Una vez logeado en tu usuario puedes copiar el texto.

Abre la aplicación Terminal y escribe:

    su -
    
Inserta la contraseña de superusuario establecida, da enter y escribe:

    apt update | apt install openssh-server  |  hostname -I 

La terminal retornará la dirección IP.


#### En el cliente

  **Debian**

Abre la aplicación Terminal y escribe:

    su -
    
Inserta la contraseña de superusuario.

En las siguientes líneas tienes que cambiar `user` por el nombre de usuario del servidor y `192.168.10.1` por la dirección IP retornada en el paso anterior.

    apt install openssh-client | ssh user@192.168.10.10

La terminal te pedirá confirmación para realizar la descarga, después pedirá la contraseña del usuario `user` del Debian.


### Nuestra plantilla para el blog

### Desplegando el blog


### Publicando el blog en la red Tor

## Manteniendo y publicando el blog
