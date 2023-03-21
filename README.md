# Desplegando un blog anónimo en Onion Services

Este proyecto está dirigido a periodistas, activistas, blogueros que por la naturaleza de su trabajo, los contenidos que publica 
o su modelo de amenaza, requieren de un grado superior de protección a su identidad al momento de hacer sus publicaciones.

Siguiente las instrucciones a continuación, obtendrá un blog con la potencialidad de tener el máximo nivel de anonimato,
siempre que sigas las recomendaciones aquí dadas.

En este proyecto se utiliza Tor para proteger la identidad del autor del blog y sus lectores. Docker es usado para 
soportar la instalación de dependencias y la ejecución de Jekyll. Se ha elegido Jekyll debido a que está destinado al 
desarrollo de sitios web estáticos lo cual es necesario cuando se quiere reducir las características del contenido que 
pueden exponer la identidad de los involucrados. Se recomienda que si quiere mantener el alto nivel de protección a su
identidad y la de sus lectores - con la que se ha configurado este proyecto - no agregue contenidos como vídeos o archivos
incrustados en sus posts.

Este procedimiento fue probado usando una computadora con Debian Bookworm (servidor) y otra con Tails 5.9 (administrador).
Sin embargo, los scripts desarrollados están verificados para que sean igualmente útiles en Debian Stable o cualquier
distribución de GNU/Linux basada en Debian Stable.

## Requisitos

Las tecnologías utilizadas para desplegar un blog en la forma que aquí se presenta son comunes a las principales plataformas
o sistemas operativos, sin embargo, utilizar uno u otro puede ampliar la superficie de ataque y exponer en mayor o menor 
medida a quien utiliza esta tecnología para publicar contenidos y a quienes acceden a dichos contenidos.

Estos requerimientos están basados en la evaluación de criterios técnicos que maximizan la seguridad y reducen la superficie
de ataque, se recomienda seguir las prácticas utilizadas aquí para proteger en la máxima medida posible la identidad
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
   nuevos posts. Para las tareas de administración debería priorizar el uso de [Tails](https://tails.boum.org/). En caso de que no sea 
   posible emplear Tails, cualquier máquina con una distribución de GNU/Linux instalada y SSH-client será suficiente. En el caso
   de la máquina _administrador_, lo que debe considerar es que no sea una máquina que permita ningún tipo de asociación con el autor
   del blog o su posible identificación, por eso debería elegirse Tails como la opción adecuada en este caso.

3. **Cliente:** se denominará _cliente_ a la máquina que usarán los lectores del blog para acceder a los posts.
   El único requerimiento para el _cliente_ es utilizar [Tor Browser](https://www.torproject.org/download/).

**Nota:** Aunque cada uno de los pasos a desarrollar para instalar, configurar y publicar el blog se han automatizado buscando
simplificar el procedimiento para usuarios no técnicos, se requiere un conocimiento básico de la ejecución de comandos y administración
de archivos en y mediante la línea de comandos de GNU / Linux.

## Primera etapa: Configuración de un canal SSH sobre Tor para administrar _el servidor_ de forma segura.

Reducir la interacción directa con _el servidor_ es fundamental para limitar la posibilidad de dejar rastros que permitan 
identificar al propietario del blog, por eso, en esta primera etapa se establecerá un canal seguro mediante el cual instalar,
configurar y actualizar los contenidos del blog.

### En el servidor

Si se dispone de una instalación de SSH-Server desde la instalación del sistema operativo en el servidor, este será el único
momento en el que es necesario interactuar directamente con el _servidor_.

**Obtener la dirección IP local del servidor:** En una terminal de comandos debe ejecutar `$ hostname -I`.

#### En el Administrador

Una vez conocida la IP local del servidor, desde la máquina que se esté utilizando como _administrador_, en la misma red local
del _servidor_, utilizando la línea de comandos debe ejecutar

`$ ssh -t {server user}@{server ip} 'wget -q https://raw.githubusercontent.com/digitalautonomy/Jekyll-Onion-blog/main/DEV/bootstrap-script.sh && bash bootstrap-script.sh'`

donde `{server user}` debe ser reemplazado por el nombre de usuario al que se tiene acceso en el servidor y `{server ip}` 
debe reemplazarse con la dirección IP local del servidor.

Se le pedirá que ingrese la contraseña de _usuario_ en el servidor.

Este comando ejecutará en _el servidor_ el `bootstrap-script` diseñado para instalar Tor en el servidor y configurar un Onion Service
que podrá utilizarse en adelante para comunicarse con _el servidor_ usando SSH sobre Tor desde cualquier lugar del mundo.

La ejecución del script `bootstrap-script` le solicitará el ingreso de la contraseña de `root` en diferentes momentos de acuerdo
los procedimientos que se estén ejecutando en el servidor.

Una vez terminada la ejecución del `bootstrap-script`, verá un log como el siguiente:

    +---------------------------------------------------------+
    Se ha configurado una manera más segura para continuar con el proceso de instalación.
    Por favor copie el siguiente comando y siga las instrucciones.

    ¡No comparta este comando con nadie!

        torify ssh -t {server user}@{link.onion}"
    +---------------------------------------------------------+

Al ejecutar el comando de la última línea del anterior log, continuará con el proceso de instalación y configuración. Para
empezar se le pedirá la contraseña del `usuario` para continuar.

**PARA TENER EN CUENTA:** Copie **en un lugar seguro** el enlace onion (`{link.onion}`) que le da el log anterior, necesitará
usarlo cada vez que quiera conectarse de forma remota a su servidor para configurar su blog o administrar sus contenidos.
**No comparta este enlace con nadie**.

## Segunda etapa

Tras ejecutar el comando anterior, se instalarán las dependencias necesarias para desplegar y servir su blog mediante un 
servicio onion, se le pedirá que introduzca la contraseña del `root` en varias ocasiones, sea cuidadoso de no errar la contraseña
para evitar tener que reiniciar el proceso en esta etapa.

Al finalizar la segunda etapa verá un log como el siguiente:

    +---------------------------------------------------------+
    Recuerde que este es el enlace que sus lectores
    deben usar para acceder a su nuevo blog utilizando
    Tor Browser: {link blog.onion}
    +---------------------------------------------------------+

El enlace onion (`{link blog.onion}`) es el que debe proveer a sus lectores para que puedan acceder mediante Tor Browser a
su blog. Manténgalo a buen resguardo y compártalo de forma segura evitando asociar datos que permitan identificarle. Evite
utilizar cualquier enfoque para "_simplificar_" el enlace onion como el uso de acortadores de URL o códigos QR. 

## Haciendo modificaciones al blog

Ahora su blog está desplegado y listo para ser visitado por cualquier lector en cualquier parte del mundo - utilizando Tor 
Browser -, el siguiente paso será "_personalizar_" su blog y empezar a publicar post, para este fin, puede seguir las 
instrucciones que encontrará [aquí](https://github.com/digitalautonomy/Jekyll-Onion-blog/blob/main/DEV/README.md).