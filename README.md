# Desplegando un blog anónimo en servicios Onion

En este repositorio recopilamos la información necesaria para crear un blog anónimo en una computadora vieja.


El resultado será un blog publicado en la red Tor que podrá ser accedido por cualquier persona usando el [navegador Tor](https://www.torproject.org/download/) y podrá ser actualizado desde cualquier computadora con conexion a internet.

> Este tutorial fue probado en maquinas con Debian Testing.

## Materiales  

1. Computadora vieja  (de aqui en adelante `cliente`)

2. Computadora personal

4. Cable de red


>Su `cliente` debe tener instalado Debian, si no sabe como hacerlo puede consultar en [pagina oficial Debian](https://www.debian.org/releases/stable/installmanual).


## Preparando la infraestructura

Esto configurará el servidor Jekyll para poder publicar nuestro blog.

### En el servidor
#### Descargando los archivos necesarios

En una terminal ejecuta los siguientes comandos en el mismo orden:

    su -

El comando anterior te pedirá la contraseña root

    apt update;
    apt install unzip;
    exit;

Luego,

    cd ~ ;
    wget https://github.com/digitalautonomy/Jekyll-Onion-blog/archive/refs/heads/main.zip ;
    unzip main.zip ; 
    

Este comando:

1. Descarga un archivo comprimido con los archivos necesarios para publicar el blog

2. Descomprime este archivo

Luego,

        cd Jekyll-Onion-blog-main
        chmod -R +x DEV/
        cd DEV/

Estos comando:

1. Cambia a la carpeta  

2. Da permisos de ejecucion para hacer las próximas instalaciones

Tu terminal se verá así:

    ~/Jekyll-Onion-blog-main/DEV/$
    

Ahora, tendrás que acceder a tu usuario root y **cambiar {tu-usuario} con tu nombre de usuario**

    su -
    cd /home/{tu-usuario}/Jekyll-Onion-blog-main/DEV/
    ./installation.sh

Verás algunas confirmaciones en tu pantalla indicando que ha sido exitosa la instalación.


        groupadd docker 
        usermod -aG docker {tu-usuario}

Reinicia tu equipo , puedes hacerlo manualmente o con el comando -init 6 en la terminal

De nuevo en la terminal.

        cd Jekyll-Onion-blog-main/DEV
        ./docker.sh

Luego,

    su -
    cd /home/{tu-usuario}/Jekyll-Onion-blog-main/DEV/
    ./onion-service-config.sh   

Este comando le arrojará información importante, por favor guardela.

## Publicando el contenido 

### Personalice el blog.

Puedes ver las [Intrucciones de personalización](https://github.com/digitalautonomy/Jekyll-Onion-blog/tree/main/DEV) en el enlace.

### Publicando el blog en la red Tor

La salida del último script le ha dado las claves para compartir **por medios seguros** con sus lectores.
Será un link.onion al que ellos usando Tor Browser se pueden conectar para consultar el blog.


## Creando nuevos post 

Jekyll es un generador de sitios estáticos que utiliza Markdown para describir el contenido que se desea mostrar. Puede usar editores de Markdown como [Ghost writer](https://ghostwriter.kde.org/) o  [Mark text](https://github.com/marktext/marktext) para crear facilmente sus post.

> Al crear su contenido cuide su anonimato.

Tenga en cuenta que esta infraestructura de blog solo admite texto e imágenes.

## Publicando sus nuevos post


### Conectese a su cliente


Conecta el servidor por WiFi o por cable ethernet a la misma red que el cliente.

Inserta la contraseña de superusuario establecida, da enter


En las siguientes líneas tienes que cambiar `user` por el nombre de usuario del servidor y `192.168.10.1` por la dirección IP retornada en el paso anterior.

    apt install openssh-client | ssh user@192.168.10.10

La terminal te pedirá confirmación para realizar la descarga, después pedirá la contraseña del usuario `user` del Debian.

### Enviando archivos con Rsync

## Acerca de los desarrolladores

Este proyecto fue desarrollado por la ONG Centro de Autonomía Digital, establecida en Quito, Ecuador.

## Nota final

Este proyecto está pensado para activistas de todo le sur global, para protejer su privacidad, esperamos sea de ayuda.


