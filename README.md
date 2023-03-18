# Desplegando un blog anónimo en Onion Services

En este repositorio recopilamos la información necesaria para crear un blog anónimo en una computadora. El resultado será un blog publicado en la red Tor que podrá ser accedido por cualquier persona usando el navegador [Tor](https://www.torproject.org/download/) y podrá ser actualizado desde cualquier computadora con conexión a internet.

Este procedimiento fue probado usando dos computadoras: Una con Debian Testing (que fue el servidor) y otra con Tails 5.9 (que fue el cliente).

## Requisitos

Se tienen dos requisitos:

1. Una computadora en la que se publicará el blog. Debe tener sistema operativo [Debian](https://www.debian.org/releases/stable/installmanual), con las siguientes características:

    1. No tener entorno gráfico. Esto se hace para no tener componentes innecesarios que pueden afectar al rendimiento de la computadora y además pueden comprometer la seguridad de ella (y por lo tanto de quién la persona que controla el blog).

    2. Tener SSH Server instalado y corriendo para poder usar la computadora remotamente.

Desde ahora llamaremos a esta computadora "El servidor".

2. Otra computadora para conectarse de manera remota al servidor. Esta computadora debe tener una distribución GNU/Linux, SSH Client y Tor. **Se recomienda muy insistentemente** que esta computadora se use con [Tails](https://tails.boum.org/install/download/), pues es una distribución diseñada para proteger al usuario de la vigilancia y la censura.

Desde ahora llamaremos a esta computadora "El cliente".

## Configurando el servidor

En estas instrucciones se configurará el servidor para poder publicar nuestro blog.

### Primera etapa

#### Instrucciones en el servidor

Se deben conocer del servidor:

1. El nombre de usuario y contraseña de un usuario del servidor.

2. La contraseña del usuario `root`.

3. La dirección IP local del servidor. Se puede obtener escribiendo en la terminal de servidor el comando `hostname -I`.

#### Instrucciones en el cliente

Ejecutar el siguiente comando en la terminal (habiendo reemplazado los valores entre corchetes):

    $ ssh -t {server user}@{server ip} 'wget -q https://raw.githubusercontent.com/digitalautonomy/Jekyll-Onion-blog/main/DEV/bootstrap-script.sh && bash bootstrap-script.sh'

`{server user}` debe ser reemplazado por el nombre de usuario al que se tiene acceso en el servidor.

`{server ip}` debe ser reemplazado la dirección IP local del servidor.

Ejecutar este comando hará que se le solicite inicialmente la contraseña de `{server user}`, y luego la contraseña del usuario `root` **del servidor** una vez y posiblemente dos veces.

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