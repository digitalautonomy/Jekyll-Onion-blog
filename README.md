# Desplegando un blog anónimo en Onion Services

En este repositorio recopilamos la información necesaria para crear un blog anónimo en una computadora.


El resultado será un blog publicado en la red Tor que podrá ser accedido por cualquier persona usando el navegador [Tor](https://www.torproject.org/download/) y podrá ser actualizado desde cualquier computadora con conexión a internet.

> Este tutorial fue probado en máquinas con Debian Testing.

## Requisitos de la computadora

1. Tener sistema operativo [Debian](https://www.debian.org/releases/stable/installmanual).

> Una alternativa fácil y segura a instalar Debian es usar [Tails](https://tails.boum.org/).

## Configurando el servidor en la computadora

Esto configurará el servidor Jekyll para poder publicar nuestro blog.

#### Descargando los archivos necesarios

En una terminal ejecute en el mismo orden los siguientes comandos:

    $ su -c "apt update && apt install unzip"

La terminal le pedirá la contraseña del usuario root, introdúzcala.

Luego, descargue y descomprima este repositorio, así:

    $ cd ~ 
    $ wget https://github.com/digitalautonomy/Jekyll-Onion-blog/archive/refs/heads/main.zip
    $ unzip main.zip
    
#### Entrando en la carpeta con los códigos

Después, entre en la carpeta del archivo descomprimido y de permisos de ejecución a la carpeta DEV y entre en ella:

    $ cd Jekyll-Onion-blog-main/DEV
    $ chmod +x *.sh

Si siguió los pasos correctamente, la terminal estará ubicada en:

    ~/Jekyll-Onion-blog-main/DEV/$

#### Añada permisos a su usuario

> En adelante, reemplace `{tu-usuario}` con su nombre de usuario.

La terminal le pedirá la contraseña del usuario root, introdúzcala.

    $ su - -c "cd /home/$USER/Jekyll-Onion-blog-main/DEV/; ./installation.sh"

Ahora, 

    $ ./docker.sh

Verás algunas confirmaciones en tu pantalla indicando que ha sido exitosa la instalación.

(TODO: these need to be done as root, no?)

     $ groupadd docker 
     $ usermod -aG docker {tu-usuario}

Reinicia tu equipo , puedes hacerlo manualmente o con el comando 

(TODO: root, right?)

    $ init 6

en la terminal.

De nuevo en la terminal.

    $ cd Jekyll-Onion-blog-main/DEV
    $ ./docker.sh

Luego,

    $ su - -c "/home/$USER/Jekyll-Onion-blog-main/DEV/onion-service-config.sh"
    $ su - -c "/home/$USER/Jekyll-Onion-blog-main/DEV/onion-get-links-and-keys.sh"

Este comando le arrojará información importante, por favor guardela.

    +---------------------------------------------------------+
    + Recuerde que este es el enlace que sus lectores         +
    + deben usar para acceder a su nuevo blog utilizando      +
    + Tor Browser.                                            +
    +---------------------------------------------------------+
    {link-onion-blog.onion}

    cat <<'END'
    +---------------------------------------------------------+
    + Recuerde que este es el enlace que únicamente usted     +
    + debe utilizar para administrar los contenidos de su     +
    + blog mediante una conexión SSH segura.                  +
    +---------------------------------------------------------+
    {link-onion-ssh.onion}

## Conectando al servidor mediante Tor y SSH

Tor y SSH le permitiran manejar su servidor de manera segura y anonima.
Para poder conectarse debe primero instalar SSH y Tor en el cliente.

Para esto,

    su-

Y,

    apt install openssh-client ;
    apt install tor


Luego para conectarse debe tener en cuenta el link de conexion SSH que obtuvo del paso anterior, recuerde mantener este link en secreto.

    torify ssh {su-usuario}@{link-onion-ssh.onion} 

### NOTA
Si el servidor esta en su red local puede hacer una coneccion SSH la Ip del servidor. Para esto recuerde que la IP local puede cambiar asi que tendra que conectarse fisicamente el servidor y obtener la IP. Por esto y por seguridad le recomendamos usar el comando anterior.

Este comando le pedira confirmar y la clave del usuario de su servidor, una vez verificado podra hacer uso normal de el servidor por este medio.



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

    $ ssh user@192.168.10.10 "apt install openssh-client"

La terminal te pedirá confirmación para realizar la descarga, después pedirá la contraseña del usuario `user` del Debian.

### Enviando archivos con Rsync

## Acerca de los desarrolladores

Este proyecto fue desarrollado por la ONG Centro de Autonomía Digital, establecida en Quito, Ecuador.

## Nota final

Este proyecto está pensado para activistas de todo le sur global, para protejer su privacidad, esperamos sea de ayuda.


