Hay que desarrollar un buscador de facts de Chuck Norris que se obtienen de la API https://api.chucknorris.io/

El buscador tendrá las siguientes características:

No necesita login, es abierto.
Se permitirá buscar por:
Palabras.
Categorías.
De manera aleatoria.
Los resultados se mostrarán paginados.
Cada búsqueda junto con los resultados obtenidos se guardarán en base de datos.
Existirá la opción de introducir una cuenta de email para que se envíen los resultados de la búsqueda.
La aplicación estará disponible en castellano e inglés (los contenidos extraídos de la API no es necesario traducirlos, se pueden presentar en inglés).

La estructura y el diseño de la página y de los correos son completamente libres, al igual que el modelo de datos para guardar la información. Se puede añadir cualquier otra funcionalidad o mejora que se considere.

Forma de entrega: subirlo a un repositorio público de GitHub o Bitbucket incluyendo una carpeta con algunas capturas de pantalla de la solución desarrollada y una pequeña explicación sobre la solución planteada en el Readme.

------------------ COMO ARRANCAR LA APLICACIÓN SIN DOCKER---------------------
1. Clona el repo --> git clone https://github.com/Blancagf18/chucknorris.git
2. Accede al proyecto --> cd chucknorris
3. El proyecto está en la versión Rails 8.0.2
4. Instala las dependencias --> bundle install
5. Configurar la bd --> rails db:setup
6. Levantar el server --> rails server -b 0.0.0.0 -p 3000
7. Acceder a través de http://localhost:3000/
8. Dame consejitos para convertirme en la chuck norris de la programación.
