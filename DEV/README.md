# Como empezar con el blog torificado

La primera cosa a hacer con su nuevo blog torificado es añadir algunas configuraciones, pero recuerde: **NO** ponga información que permitan identificarle. Esta plantilla tiene la configuración más simple para hacer a su blog completamente anónimo, así que tiene que tener cuidado con la información que comparte en este. 

## Advertencia

**Por simplicidad, sugerimos que sólo se hagan cambios en los directorios y archivos que especificamos en estas instrucciones.**

**Tenga cuidado con el origen de las imágenes que va a usar. En particular le recomendamos eliminar los metadatos de todos los archivos que suba al servidor.**

Se mostrarán varios comandos donde el valor `{server user}` debe reemplazarse con el nombre de usuario al que se tiene acceso en el servidor y `{onion link}` debe reemplazarse con la dirección onion del servicio SSH del servidor.

## 1. Cambiar logo

Para cambiar el logo de la página se necesita tener un archivo en formato SVG llamado `logo.svg` que debe ser guardado en la carpeta `assets/images` del repositorio. Esta imagen debería ser cuadrada, pues de lo contrario se deformará al mostrarse.

Se puede cambiar el logo ejecutando este comando desde _el administrador_ :

    $ torify scp logo.svg {server user}@{onion link}:/home/{server user}/Jekyll-Onion-blog/assets/images

Este cambio va a modificar las imágenes que mostramos aquí:

![Cambiar logo en el header](./images/change-logo-1.png)

![Cambiar logo en el header](./images/change-logo-2.png)

## 2. Cambiar la sección *hero* en la página principal

En esta sección se pueden cambiar los siguientes elementos:

1. **Descripción y eslogan:** Diríjase a `_i18n` que es el directorio de internacionalización, y encuentre los archivos `en.yml` y `es.yml`. En cada uno edite la etiqueta `site.description` con su propia descripción y `site.slogan` con su propio eslogan.


Desde _el administrador_ se puede hacer esta operación con el siguiente comando para la versión en español:

    
    $ torify ssh -t {server user}@{onion link} "nano /home/{server user}/Jekyll-Onion-blog-main/_i18n/es.yml"

Y para la versión en inglés:

    $ torify ssh -t {server user}@{onion link} "nano /home/{server user}/Jekyll-Onion-blog-main/_i18n/en.yml"

El resultado de ejecutar estos comandos mostrará algo como:


![Interfaz de Nano](./images/original-es-yml.png)

![Interfaz de Nano](./images/original-en-yml.png)

**Recuerde: haga estos dos cambios en ambos archivos para que los cambios se vean reflejados en los dos idiomas**

2. **Imagen de fondo:** para cambiar el fondo de esta sección, primero necesita tener una imagen con el nombre `background-desktop.png` y copiarla al directorio `assets/images`.

Desde _el administrador_ se puede hacer esta operación con el siguiente comando:

    $ torify scp background-desktop.png {server user}@{onion link}:/home/{server user}/Jekyll-Onion-blog/assets/images




**Advertencia: La imagen seleccionada debe estar en formato PNG. En caso de que la imagen esté en formato JPG puede cambiar la extensión del archivo a `.png`.**


![Cambio de la sección hero](./images/change-hero.png)

## 3. Cambiar el contenido del *footer*

Puede mostrar su dirección de correo electrónico y su correspondiente [*fingerprint* GPG](https://es.wikipedia.org/wiki/Huella_digital_de_clave_p%C3%BAblica#Creando_huellas_digitales_de_clave_p%C3%BAblica) (si los tiene y los desea compartir).

**Advertencia: Asegúrese de que el servicio de correo que usa es seguro y anónimo. Use un servicio como [Riseup](https://riseup.net/) y similares.**

**Dirección de correo y *Fingerprint* GPG:** Diríjase al directorio `_data/` y encuentre el archivo `locations.yml`. En este archivo cambie el campo `name` bajo la línea `- location: email address` con la dirección de correo deseada y en este archivo cambie el campo `name` bajo la línea `- location: GPG fingerprint` con el `fingerprint` GPG deseado.

Desde _el administrador_ se puede hacer esta operación con el siguiente comando:

    $ torify ssh -t {server user}@{onion link} "nano /home/{server user}/Jekyll-Onion-blog-main/_data/locations.yml"


El resultado de ejecutar estos comandos mostrará algo como:


![Interfaz de Nano](./images/original-locations-yml.png)


### Nota
Si no tiene un `fingerprint` GPG borre la línea `- location: GPG fingerprint` y las que están debajo de ella.

## 4. Añadir entrada al blog

Cuando usted haya escrito una nueva entrada (en inglés o español) y quiera subir imágenes, puede usar la plantilla `post_template.md` ubicada en el directorio `/DEV`.

Si quiere versiones en español e inglés de sus entradas, los dos archivos **deben tener el mismo nombre**, pero cada uno de ellos debe ser guardado en su propio directorio.

Para la versión en español use el directorio `/_i18n/es/_post` y para la versión en inglés `/_i18n/en/_post`.

## Nombrar los archivos de las entradas correctamente

El nombre del archivo de su entrada **debe** usar la siguiente sintaxis:

    yyyy-mm-dd-titulo-de-su-entrada.md

No se puede reemplazar `-` con ningún otro símbolo y en el título de su entrada reemplace los espacios con `-`.

Por ejemplo: _titulo de su entrada_ deberia ser `titulo-de-su-entrada`.

Recuerde que el nombre del archivo de su entrada no es el mismo que el título de esta.

## Subiendo entradas a través del _administrador_

Si quisieramos subir un post que está en un archivo con nombre `2023-03-14-un-post-de-ejemplo.md`, podemos usar los siguientes comandos:

1. Para subir el post en su versión en español:

        $ torify scp 2023-03-14-un-post-de-ejemplo.md {server user}@{onion link}:/home/{server user}/Jekyll-Onion-blog-main/_i18n/es/_posts

2. Para subir el post en su versión en inglés:

        $ torify scp 2023-03-14-un-post-de-ejemplo.md {server user}@{onion link}:/home/{server user}/Jekyll-Onion-blog-main/_i18n/en/_posts

Nótese que los comandos son idénticos salvo por que en el primero el archivo se transfiere al directorio `_posts` dentro del directorio `es`, mientras que en el segundo pasa lo mismo pero dentro del directorio `en`.

Estos comandos transfieren los archivos `2023-03-14-un-post-de-ejemplo.md` a las carpetas de entradas del blog. Al hacerlo el blog se actualizará automáticamente, lo que significa que basta ejecutar estos comandos para subir entradas al blog.

Se pueden subir entradas en un solo idioma, pero si se desea subir una misma entrada en dos idiomas, deben tener el mismo nombre.

# Ejemplo (subir una entrada)

Como ejemplo usamos los siguientes dos archivos para la subida de una entrada, con nombre de archivo `2022-09-20-A-good-first-post.md`.

## Español

![Español](./images/example_es.png)

## Inglés

![Inglés](./images/example_en.png)

## Directorio de imágenes

Guardamos las imagenes de la siguiente manera:

![Images folder](./images/example_images.png)

Estos cambios se verán así:

### Sección de destacados

![Destacados](./images/example_featured.png)

### Visualización del blog en español

![Blog en español](./images/example_post_es.png)

### Visualización del blog en inglés

![Blog en inglés](./images/example_post_en.png)

### La entrada del blog (en español)

![Entrada del blog](./images/example_post.png)
