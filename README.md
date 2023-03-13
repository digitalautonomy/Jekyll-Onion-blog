# Desplegando un blog anónimo con Raspberry Pi y servicios Onion

En este repositorio recopilamos la información necesaria para crear un blog anónimo con una placa Raspberry Pi y una computadora. Se necesitarán algunos elementos adicionales (listados abajo) y el resultado será publicar el blog en la red Tor, que puede ser accedida por cualquier persona usando el [navegador Tor](https://www.torproject.org/download/).

## ¿Qué se necesita para completar el proyecto?

### Placa Raspberry Pi

Este es el elemento principal, y el que costará más. La placa tendrá que usarse como una computadora al principio, así que se requiere de una Raspberry Pi 1, 2, 3 o 4.

Las Raspberry Pi Pico o Raspberry Pi Zero no servirán para este proyecto, pues la tarjeta que se utilice requiere poder ser usada como una computadora y con estas será mucho más difícil.

#### Adaptador de corriente para Raspberry Pi

Lo más apropiado es comprar tu Raspberry Pi con un adaptador de corriente, de forma que al adquirirlo te asegures de que funciona para la que adquiriste. Sin embargo, y si este no es el caso, hay dos casos dependiendo de la Raspberry Pi que tengas:

##### Raspberry Pi 1, 2 o 3

Estas Raspberry Pi se conectan a su adaptador de corriente a través de un puerto MicroUSB, que lucen así:

![Conexión MicroUSB](https://imgur.com/a/kCT0KJg)

##### Raspberry Pi 4

Esta versión se conecta a la corriente a través de un puerto USB-C, que luce así:

### Computadora 



### Teclado



### Monitor



### Cables



#### Cable de red



#### Adaptador USB a tarjeta SD



#### Cable HDMI



## Configurando Raspberry Pi

Vamos a configurar una placa [Raspberry Pi](https://www.raspberrypi.org/) para que con ella podamos publicar un blog a través de la red Tor, que va a ayudar a proteger la identidad del anfitrión.

### Versiones de las placas

### Raspberry Pi OS

### Instalación

## Comunicándose con la Raspberry Pi

### Habilitando SSH en Raspberry Pi

### Usando Raspberry Pi desde tu computadora personal

#### Windows

#### Apple

#### GNU/Linux

## Creando un blog en Raspberry Pi con ayuda de Tor y Jekyll

Jekyll es un generador de sitios estáticos que utiliza Markdown para describir el contenido que se desea mostrar. Usaremos Jekyll para desplegar un blog localmente y usaremos Tor para publicarlo como un Onion Service.

### Nuestra plantilla para el blog



### Instalando la plantilla en Raspberry Pi



### Desplegando el blog



### Publicando el blog en la red Tor

## Manteniendo y publicando el blog
