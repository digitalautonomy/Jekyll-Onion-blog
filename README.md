# Desplegando un blog anónimo en servicios Onion

En este repositorio recopilamos la información necesaria para crear un blog anónimo en una computadora vieja.

El resultado será un blog publicado en la red Tor que podrá ser accedido por cualquier persona usando el [navegador Tor](https://www.torproject.org/download/).

## Materiales  

### Computadora vieja



### Computadora personal



### Memoria USB



### Cable de red



## Instalando Debian 11 en la computadora vieja:


### Descargar debian:
		Para descargar debian 11 haga click en una opcion:
		- [version 64-bits](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.6.0-amd64-netinst.iso)
		- [version 32-bits](https://cdimage.debian.org/debian-cd/current/i386/iso-cd/debian-11.6.0-i386-netinst.iso)
	

esta descargara automaticamente la imagen de debian, si usted no esta seguro de que imagen instalar, escoja la version 64.

### Copiando Debian a la memoria USB

	para instalar debian en un computador se necesita adaptar una USB, es decir hacer la USB booteable.

**En Windows**
Para ello descargue [ballena](https://www.balena.io/etcher), en la pagina puede escoger la version para su sistema operativo.

Ejecuta el instalador de ballena

**En Linux**

Siga las instrucciones de descarga [aqui](https://etcher-docs.balena.io/?)

-

Al abrir la aplicacion ballena:
1. Seleccione "Flash from file" y escoja la imagen que esta en la seccion de descargas.
2. Seleccione la USB que va a usar para guardar la imagen
3. Seleccione Flash y espere a terminar.


Ya tiene una USB lista para instalar Debian en su computadora.


### Instalando Debian
Apaga la computadora, inserte la USB en un puerto y prendala presionando f12 constantemente.

Se abrira el menu de booteo, seleccione USB y presione Enter

Se abrira el instalador de Debian, seleccione Graphical install

Puede configurar opciones como idioma del sistema, su pais ubicacion y el teclado.

*Nota:*
*El hadware de red no es necesario, si vas a usar la conputadora conectada a un cable de red siempre, si quieres usar wifi descarga de uno de los ficheros en pantalla en otra USB y conectala al pc antes de seguir*

Ponle las siguientes caracteristicas a tu computadora:
- un nombre a tu pc
- claves para el super usuario
- nombre para su usuario
- nombre para su cuenta
- clave para su usuario
- fecha y hora

En la seccion de particion de discos seleccione "Guiado - utilizar todo el disco y LVM cifrado"
**Importante**
Escoja la unidad de memoria del computador, usualmente es la de mayor capacidad.

Seleccione la recomendacion para novatos
Seleccione aceptar.

Este proceso se puede demorar hasta 5 minutos


## Creando un blog con ayuda de Tor y Jekyll

Jekyll es un generador de sitios estáticos que utiliza Markdown para describir el contenido que se desea mostrar. Usaremos Jekyll para desplegar un blog localmente y usaremos Tor para publicarlo como un Onion Service.

### Nuestra plantilla para el blog


### Desplegando el blog


### Publicando el blog en la red Tor

## Manteniendo y publicando el blog
