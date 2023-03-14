# Desplegando un blog anónimo en servicios Onion

En este repositorio recopilamos la información necesaria para crear un blog anónimo en una computadora vieja.

El resultado será un blog publicado en la red Tor que podrá ser accedido por cualquier persona usando el [navegador Tor](https://www.torproject.org/download/).

## Materiales  

1. Computadora vieja

2. Computadora personal

3. Memoria USB

4. Cable de red



## Instalando Debian 11 en la computadora vieja:


### Descargar Debian 11:

#### Conocer la arquitectura de la máquina vieja:
**En Windows**
Las instrucciones oficiales se encuentran [aquí](https://support.microsoft.com/en-us/windows/32-bit-and-64-bit-windows-frequently-asked-questions-c6ca9541-8dce-4d48-0415-94a3faa2e13d).

**En Linux**
En la terminal escribe

    getconf LONG_BIT

#### Descargar la imagen de Debian: 

**Opción Fácil**
Al hacer clic en el enlace correspondiente a la arquitectura encontrada en el paso anterior se descargará el instalador de Debian 11:
- [Versión 64-bits](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.6.0-amd64-netinst.iso)
- [Versión 32-bits](https://cdimage.debian.org/debian-cd/current/i386/iso-cd/debian-11.6.0-i386-netinst.iso)
	

**Opción Segura**
Se puede descargar el instalador de diferentes versiones de Debian desde la página oficial de Debian.

>Si no estás seguro de cuál arquitectura tiene tu computadora, descarga la versión de 32-bit.
### Hacer booteable la memoria USB

**En Windows**
Para ello descargue la versión de balena correspondiente a Windows con la arquitectura encontrada anteriormente en https://www.balena.io/etcher.
>Si no estás seguro de cuál arquitectura tiene tu computadora, descarga la versión de 32-bit.

**En Linux**
En https://etcher-docs.balena.io están las instrucciones para instalación por terminal de balena.

Al abrir la aplicacion ballena:
1. Seleccione *Flash from file* y escoja el instalador descargado.
2. Seleccione *Select target* y escoja la USB que va a usar para guardar la imagen.
3. Seleccione *Flash* y espere a que termine.


Ya tiene una USB booteable para instalar Debian en su computadora.



## Creando un blog con ayuda de Tor y Jekyll

Jekyll es un generador de sitios estáticos que utiliza Markdown para describir el contenido que se desea mostrar. Usaremos Jekyll para desplegar un blog localmente y usaremos Tor para publicarlo como un Onion Service.

### Nuestra plantilla para el blog


### Desplegando el blog


### Publicando el blog en la red Tor

## Manteniendo y publicando el blog
