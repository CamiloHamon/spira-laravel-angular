<h1>Sistema Academico - Prueba Spira - Laravel & Angular</h1>

<br />
 
<!-- ABOUT THE PROJECT -->
## Acerca del Proyecto
En este proyecto se hace un sistema de login con roles, en donde el administrador pueda crear estudiantes,
asignar materias y su intensidad horaria. Por otro lado, el usuario estudiante unicamente puede ver las
materias en las que esta inscrito. <br> Se hace uso de Angular para frontend y Nodejs para backend.

## Sistema de Jerarquia

![Jerarquia](https://github.com/CamiloHamon/spira/blob/main/jerarquia.png)
 
## Despliegue del Proyecto
Inicialmente se debe crear una base de datos en MySql, con los datos que tiene ``spira.sql``. El archivo de configuracion de la conexion a la base de datos, se encuentra en ``backend/src/database/keys.js``.

Para el despliegue del proyecto, se debe ubicar en la carpeta ``backend`` y ejecutar el comando:
<br>``composer install``
<br>Para despleagar el frontend, se debe ubicar en la carpeta ``frontend`` y ejecutar el comando:
<br>``npm install``
### Nota:
Estos comandos sirven para instalar todos los modulos empleados para la creacion del proyecto en el ``frontend`` y en el ``backend``.

## Credenciales
Las credenciales del usuario administrador son:
<br>
* email: admin@admin.com
* password: 123

Las credenciales del usuario estudiante son:
<br>
* email: laravel@laravel.com
* password: 123

Ademas, las credenciales de usuarios estudiantes, se pueden ver en ``http://localhost:4200/info-user/idUser`` para conocer el correo, y la contraseña es 123.
 
<!-- CONTACT -->
## Contact
 
[@camilohamon](https://github.com/camilohamon)<br />
 
Link del Proyecto: [Prueba Spira](https://github.com/CamiloHamon/spira)
