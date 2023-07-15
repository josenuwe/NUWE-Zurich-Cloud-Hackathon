# Guía de uso 
Para esta fase del reto se proporcionarán los siguientes archivos:
- **Dockerfile**: crea una imagen custom de Jenkins con todo lo necesario para automatizar el despliegue mediante una pipeline.
- **docker-compose.yml**: automatiza el despliegue del entorno de desarrollo.
- **auto-install.sh**: instala todo lo necesario para poder trabajar con el entorno de desarrollo:
    - cURL
    - Python3
    - Pip
    - Terraform
    - Docker
    - Docker-compose
    - AWS CLI
    
    También crea carpetas para persistencia de datos de los contenedores creados, crea el grupo **docker** y añade el usuario actual a ese grupo.
- **app.py**: WebApp para subir imagenes que se almacenan en un S3 Bucket.
- **index.html**

Una vez completado el script, ejecutar el siguiente comando:

```bash
docker-compose up --build -d
```

Al finalizar el proceso, se deberían haber creado tres contenedores:
- **Gogs**
- **Jenkins**
- **Localstack**

El uso de estos scripts es completamente opcional, el usuario puede optar por instalar lo necesario u otras cosas a medida que las vaya necesitando.

También veréis que hay una carpeta llamada **localstack_pro** con otro docker-compose dentro. Será necesario usarlo para el Bloque 2, ya que la versión **Community** no tiene todas las funcionalidades necesarias.

## Localstack
Localstack es un stack local de cloud basado en AWS completamente funcional, es decir, emula AWS junto con todas sus funcionalidades. Para este reto, se puede utilizar la versión Community en el **Bloque 1**. Para el **Bloque 2** será necesario introducir la API Key proporcionada para utilizar la versión Pro de Localstack.

AWS CLI funciona con localstack, tan sólo habrá que añadir el parámetro --endpoint-url e indicar el de localstack, por ejemplo:

```bash
aws --endpoint-url=http://localhost:4566 s3 mb s3://first-bucket
```
o utilizar la version que ofrece Localstack: **awslocal**. También se puede utilizar la versión oficial de **AWS CLI** creando un **alias** si no se desea añadir --endpoint-url continuamente.

Hay varias opciones para iniciar Localstack, en este caso, se proporciona un docker-compose y no es necesario hacer nada más.
En caso de no utilizar los archivos proporcionados, habrá que instalar localstack de forma manual y ejecutarlo:

```bash
localstack start -d
```

## Advertencia
Todos los archivos proporcionados están pensados para trabajar con Linux, han sido testeados en Ubuntu 22.04. Se recomienda utilizar un fresh install para evitar conflictos.
También se recomienda crear un snapshot nada más completar la instalación del SO y otra después de ejecutar el script si ha funcionado correctamente, así se podrá volver a una versión anterior fácilmente si algo falla.

## FAQ
- ¿Puedo utilizar otro SO que no sea Linux?
Sí, puedes utilizar el sistema operativo que desees, pero es altamente recomendable utilizar Linux.
- ¿Puedo desarrollar el reto usando la versión real de AWS?
Sí, pero se recomienda utilizar Localstack ya que no tendrá ningún coste, es más rápido probar lo que se desee y no hay que preocuparse si es necesario hacer muchas pruebas.
- ¿Es obligatorio utilizar Terraform?
No, pero se recomienda ya que es muy versátil y puede trabajar con muchos proveedores.
- ¿Es necesario completar los dos bloques de forma obligatoria?
No, no es obligatorio completar ambos bloques, pero sí recomendado para obtener la máxima puntuación posible.
- ¿Cómo de importante es el informe?
El informe es de las partes más importantes del reto. Es donde se explica la solución al problema planteado, que será revisada por el equipo de Zurich también.

