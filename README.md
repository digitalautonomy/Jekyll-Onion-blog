# Desplegando un blog anónimo en Onion Services

En este repositorio se recopila la información necesaria para crear un blog anónimo en una computadora. El resultado será un blog publicado en la red Tor que podrá ser accedido por cualquier persona usando el navegador [Tor](https://www.torproject.org/download/) y podrá ser actualizado desde cualquier computadora con conexión a internet.

Este procedimiento fue probado usando dos computadoras: Una con Debian Testing (que fue el servidor) y otra con Tails 5.9 (que fue el cliente).

## Requisitos

Las tecnologías utilizadas para desplegar un blog en la forma que aquí se presenta son comunes a las principales plataformas
o sistemas operativos, sin embargo, utilizar uno u otro puede ampliar la superficie de ataque y exponer en mayor o menor 
medida a quien utiliza esta tecnología para publicar contenidos y a quienes acceden a dichos contenidos.

Estos requerimientos están basados en la evaluación de criterios técnicos que maximizan la seguridad y reducen la superficie
de ataque, nuestra recomendación es seguir las prácticas utilizadas aquí para proteger en la máxima medida posible la identidad
de quien escribe contenidos en el blog y de sus lectores.

1. **Servidor:** se denominará _servidor_ a la máquina que alojará el blog. Como servidor puede ser utilizada cualquier computadora 
   con las siguientes especificaciones mínimas:
   1. Procesador con tecnología de 64 bits.
   2. RAM: 4 GB.
   3. Almacenamiento: 20 GB.
   4. Sistema Operativo: Debian GNU/Linux. Reducir la complejidad de la instalación contribuirá a reducir la superficie de ataque,
      por lo que es altamente recomendable que _el servidor_ no tenga un entorno de escritorio instalado y configurado. Durante el
      proceso de instalación debería utilizar un generador de claves aleatorias ([keepassxc](https://keepassxc.org/)) para generar
      de forma segura contraseñas para el _cifrado del disco_, _root_ y el _usuario_.
   5. SSH-Server: preferiblemente instalado desde la instalación del sistema operativo para reducir la interacción directa con
      _el servidor_.

2. **Administrador:** se denominará _administrador_ a la máquina que utilizará el autor del blog para administrar _el servidor_ y publicar
   nuevos posts. Como cliente nuestra recomendación es usar [Tails](https://tails.boum.org/). En caso de que no sea 
   posible el uso de Tails, cualquier máquina con una distribución de GNU/Linux instalada y SSH-client será suficiente. En el caso
   de la máquina _administrador_, nuestra recomendación es que no sea una máquina que permita ningún tipo de asociación con el autor
   del blog o su posible identificación, por eso nos decantamos por Tails como la opción ideal en este caso.

3. **Cliente:** se denominará _cliente_ a la máquina que usarán los lectores del blog para acceder a los contenidos del blog.
   El único requerimiento para el _cliente_ es utilizar [Tor Browser](https://www.torproject.org/download/).

**Nota:** Aunque cada uno de los pasos a desarrollar para instalar, configurar y publicar el blog se han automatizado buscando
simplificar el procedimiento para usuarios no técnicos, se requiere un conocimiento básico de la ejecución de comandos y administración
de archivos en y mediante la terminal de comandos de GNU / Linux.

## Primera etapa: Configuración de un canal SSH sobre Tor para administrar _el servidor_ de forma segura.

Reducir la interacción directa con _el servidor_ es fundamental para reducir la posibilidad de dejar rastros que permitan 
identificar al propietario del blog, por eso, en esta primera etapa se establecerá un canal seguro mediante el cual instalar,
configurar y actualizar los contenidos del blog.

### En el servidor

Si se dispone de una instalación de SSH-Server desde la instalación del sistema operativo, en el servidor, este será el único
momento en el que es necesario interactuar directamente con el _servidor_.

**Obtener la dirección IP local del servidor:** En una terminal de comandos debe ejecutar `$ hostname -I`.

#### En el Administrador

Una vez conocida la IP local del servidor, desde la máquina que se esté utilizando como _administrador_, en la misma red local
del _servidor_, utilizando la terminal de comando debe ejecutar

`$ ssh -t {server user}@{server ip} 'wget -q https://raw.githubusercontent.com/digitalautonomy/Jekyll-Onion-blog/main/DEV/bootstrap-script.sh && bash bootstrap-script.sh'`

donde `{server user}` debe ser reemplazado por el nombre de usuario al que se tiene acceso en el servidor y `{server ip}` debe reemplazarse con la dirección IP local del servidor.

Este comando ejecutará en _el servidor_ el `bootstrap-script` diseñado para instalar Tor en el servidor y configurar un Onion Service
que podrá utilizarse en adelante para comunicarse con _el servidor_ usando SSH sobre Tor desde cualquier lugar del mundo.



Un ejemplo del comando con valores falsos se vería así:

`ssh -t pepito@192.168.1.3 'wget -q https://raw.githubusercontent.com/digitalautonomy/Jekyll-Onion-blog/main/DEV/bootstrap-script.sh && bash bootstrap-script.sh'`

Una vez terminada la ejecucion, será algo como:

    +---------------------------------------------------------+
    Se ha configurado una manera más segura para continuar con el proceso de instalación.
    Por favor copie el siguiente comando y siga las instrucciones.

    ¡No comparta este comando con nadie!

        torify ssh -t {server user}@{link.onion}"
    +---------------------------------------------------------+
Debe continuar el proceso como lo indica el mensaje.
## Segunda etapa

Tras terminar el paso anterior, se le entregará un comando que debe ejecutar **en el cliente**. Este comando contiene un enlace onion que servirá para conectarse con SSH al servidor desde cualquier lugar usando la red Tor. **No comparta este comando con nadie**. La terminal **en el cliente** será algo así:


    $ torify ssh -t {server user}@{link.onion} {directorio instalación}/second_stage.sh""


La ejecución de este comando hará que se instalen las dependencias necesarias para que el blog funcione y hará configuraciones para desplegarlo y publicarlo en la red Tor.

Cuando esta etapa termine, se imprimirá en la terminal un aviso con el enlace onion para acceder al blog, que para este momento ya es accesible. En su terminal el programa le dara el link de el blog de la siguiente manera.

    +---------------------------------------------------------+
    Recuerde que este es el enlace que sus lectores
    deben usar para acceder a su nuevo blog utilizando
    Tor Browser: {link blog.onion}
    +---------------------------------------------------------+

## Haciendo modificaciones al blog

Para modificar el blog haremos dos procedimientos:

1. Transmitir archivos al servidor desde el cliente para usarlos en el blog.

2. Controlar al servidor desde el cliente para modificar algunos archivos.

### Transmitiendo archivos al blog
En el templete puede cambiar:
1. Logo
2. Fondo
3. Descripción
4. Slogan
5. Correo
6. Editar fingerprint 

#### Cambiando el logo del blog

El logo que se desee poner debe estar en formato SVG y debe llamarse `logo.svg`. Para cambiar el logo podemos ejecutar el siguiente comando en el cliente (en el directorio donde se encuentra `logo.svg`):

    $ torify scp logo.svg {server user}@{onion link}:/home/{server user}/Jekyll-Onion-blog/assets/images

Los valores deben ser reemplazados de la misma forma que en los comandos anteriores. Subir esta imagen bastará para que el blog se actualice.

#### Cambiando el fondo del blog

Este procedimiento es idéntico al del cambio de logo, pero en este caso se transferirá una imagen en formato PNG llamado `background-desktop.png`. El comando sería así (ejecutado en el directorio donde se encuentre la imagen):

    $ torify scp background-desktop.png {server user}@{onion link}:/home/{server user}/Jekyll-Onion-blog/assets/images

### Añadiendo posts

Hemos creado una plantilla de posts que tiene la estructura necesaria para que el archivo sea correctamente interpretado por Jekyll, el generador de sitios que usamos para publicar el blog. Esta plantilla se encuentra [aquí](https://github.com/digitalautonomy/Jekyll-Onion-blog/blob/main/DEV/post_template.md) y las instrucciones para modificarla (y para modificar el blog en general) se encuentran [aquí](https://github.com/digitalautonomy/Jekyll-Onion-blog/blob/main/DEV/README.md).

#### Subiendo los posts al blog

La plantilla del blog está hecha de forma que se puedan publicar los mismos posts tanto en inglés como en español. Para esto, como se menciona en la [guía para crear posts](https://github.com/digitalautonomy/Jekyll-Onion-blog/blob/main/DEV/README.md), los dos archivos deben tener el mismo nombre y deben estar en diferentes carpetas específicas.

Si quisieramos subir un post que está en un archivo con nombre `2023-03-14-un-post-de-ejemplo.md`, podemos usar los siguientes comandos:

1. Para subir el post en su versión en español:

    $ torify scp 2023-03-14-un-post-de-ejemplo.md {server user}@{onion link}:/home/{server user}/Jekyll-Onion-blog-main/_i18n/es/_posts

2. Para subir el post en su versión en inglés:

    $ torify scp 2023-03-14-un-post-de-ejemplo.md {server user}@{onion link}:/home/{server user}/Jekyll-Onion-blog-main/_i18n/en/_posts

Para estos comandos deben reemplazarse los siguientes valores:

- `{server user}` debe reemplazarse por el nombre de usuario del servidor.

- `{onion link}` debe reemplazarse por el enlace onion que aparece en el segundo comando que ejecutamos; el que apareció en la terminal después de que ejecutamos el primer comando.

Nótese que los comandos son idénticos salvo por que en el primero el archivo se transfiere al directorio `_posts` dentro del directorio `es`, mientras que en el segundo pasa lo mismo pero dentro del directorio `en`.

Estos comandos transfieren los archivos `2023-03-14-un-post-de-ejemplo.md` a las carpetas de posts del blog. Al hacerlo el blog se actualizará automáticamente, lo que significa que basta ejecutar estos comandos para subir posts al blog.

Se pueden subir posts en un solo idioma, pero si se desea subir un mismo post en dos idiomas deben tener el mismo nombre.

#### Transmitiendo imágenes

Ningún contenido que se suba al blog puede tener información que permita obtener su identidad. No sólo debe tener cuidado con el contenido de los archivos que sube, sino con sus metadatos.

Como persona que administra el blog, debe evaluar con cuidado las amenazas a las que se enfrenta y subir diferentes tipos de contenidos dependiendo de los riesgos y peligros que esto suponga.