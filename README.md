# Desplegando un blog anónimo en Onion Services

En este repositorio recopilamos la información necesaria para crear un blog anónimo en una computadora.


El resultado será un blog publicado en la red Tor que podrá ser accedido por cualquier persona usando el navegador [Tor](https://www.torproject.org/download/) y podrá ser actualizado desde cualquier computadora con conexión a internet.

Este tutorial fue probado en máquinas con Debian Testing.

## Requisitos

Se tienen dos requisitos:

1. Una computadora en la que se publicará el blog. Debe tener sistema operativo [Debian](https://www.debian.org/releases/stable/installmanual), con las siguientes características:

    1. No tener entorno gráfico. Esto se hace para no tener componentes innecesarios que pueden afectar al rendimiento de la computadora y además pueden comprometer la seguridad de ella (y por lo tanto de quién la posee).

    2. Tener SSH Server instalado y corriendo para poder usar la computadora remotamente.

Desde ahora llamaremos a esta computadora "El servidor".

2. Otra computadora para conectarse de manera remota al servidor. Esta computadora debe tener una distribución GNU/Linux, SSH Client y Tor. **Se recomienda muy insistentemente** que esta computadora se use con [Tails](https://tails.boum.org/install/download/), pues es una distribución diseñada para proteger al usuario de la vigilancia y la censura.

Desde ahora llamaremos a esta computadora "el cliente".

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

`ssh {user}@{ip} "wget -O- https://raw.githubusercontent.com/digitalautonomy/Jekyll-Onion-blog/main/DEV/bootstrap-script.sh && bash"`

`{user}` debe ser reemplazado por el nombre de usuario al que se tiene acceso en el servidor.

`{ip}` debe ser reemplazado la dirección IP local del servidor.

Un ejemplo con valores falsos se vería así:

`ssh pepito@192.168.1.3 "wget -O- https://raw.githubusercontent.com/digitalautonomy/Jekyll-Onion-blog/main/DEV/bootstrap-script.sh && bash"`

Ejecutar este comando hará que se le solicite la contraseña del usuario `root` **del servidor** una vez y posiblemente dos veces.

### Segunda etapa

Tras terminar el paso anterior, se le entregará un comando que debe ejecutar en el cliente. Este comando contiene un enlace onion que servirá para conectarse con SSH al servidor desde cualquier lugar usando la red Tor. **No comparta este comando con nadie**.

La ejecución de este comando hará que se instalen las dependencias necesarias para que el blog funcione y hará configuraciones para desplegarlo y publicarlo en la red Tor.

Cuando esta etapa termine, se imprimirá en la terminal un aviso con el enlace onion para acceder al blog, que para este momento **ya será accesible** desde cualquier lugar en la red Tor.

## Haciendo modificaciones al blog 

### Añadiendo posts al blog

Hemos creado una plantilla para posts, que tiene la estructura necesaria para que el archivo sea correctamente interpretado por Jekyll, el generador de sitios que usamos para publicar el blog. Esta plantilla se encuentra [aquí](https://github.com/digitalautonomy/Jekyll-Onion-blog/blob/main/DEV/post_template.md) y las instrucciones para modificarla (y para modificar el blog en general) se encuentran [aquí](https://github.com/digitalautonomy/Jekyll-Onion-blog/blob/main/DEV/README.md).
