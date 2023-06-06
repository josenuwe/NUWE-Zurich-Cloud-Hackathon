# Guía de uso 

Para este reto se proporcionarán los siguientes archivos: auto-install.sh y client_data.json. 
El archivo auto-install.sh instalará todo lo necesario para empezar a desarrollar, excepto las dependencias que se usarán durante el desarrollo. Una vez se ejecute y todo se complete, deberá estar instalado:
- cURL
- Python3
- Pip
- Terraform
- Docker
- Docker-compose
- Localstack
- AWS CLI

El uso de este script es completamente opcional, el usuario puede optar por instalar lo necesario u otras cosas a medida que las vaya necesitando.

También se dejará Localstack listo para funcionar.

## Localstack
Localstack es un stack local de cloud basado en AWS completamente funcional, es decir, emula AWS junto con todas sus funcionalidades. En este caso, se estará utilizando la versión Community y tiene limitaciones, pero todos las tareas propuestas podrán realizarse con esta versión.
AWS CLI funciona con localstack, tan sólo habrá que añadir el parámetro --endpoint-url e indicar el de localstack, por ejemplo:
```bash
aws --endpoint-url=http://localhost:4566 s3 mb s3://first-bucket
```
Dicho esto, queda lo más importante. ¿Cómo se inicia localstack?
Simple, sólo hace falta ejecutar:
```bash
localstack start -d
```
Y localstack estará funcionando en un contenedor, con el puerto 4566 abierto donde se harán las request.

En caso de haber optado por no usar el script de instalación automática, se puede obtener una versión de Localstack directamente de su repositorio oficial que usa docker-compose.
Más información: https://docs.localstack.cloud/overview/

## Advertencia
El script está pensado para trabajar en entornos Linux, ha sido testeado en Ubuntu 22.04. Se recomienda utilizar un fresh install, ya que la siguiente fase del reto continuará esta.
También se recomienda crear un snapshot nada más completar la instalación del SO y otra después de ejecutar el script si ha funcionado correctamente, así se podrá volver a una versión anterior fácilmente si algo falla.

## FAQ
- ¿Puedo utilizar otro SO que no sea Linux?
Sí, puedes utilizar el sistema operativo que desees, pero es altamente recomendable utilizar Linux.
- ¿Puedo desarrollar el reto usando la versión real de AWS?
Sí, pero se recomienda utilizar Localstack ya que no tendrá ningún coste, es más rápido probar lo que se desee y no hay que preocuparse si es necesario hacer muchas pruebas.
- ¿Es obligatorio utilizar Terraform?
No, pero se recomienda ya que es muy versátil y puede trabajar con muchos proveedores.
- ¿Qué conseguiré si completo la prueba con éxito?
Si se completa la prueba con éxito, se conseguirá el acceso a la fase presencial en Barcelona, donde el equipo técnico de Zurich y de NUWE estarán presentes.
- ¿Debo guardar los archivos creados? 
Sí, la siguiente fase del reto continuará esta y algunas tareas podrían requerir el uso de los mismos.