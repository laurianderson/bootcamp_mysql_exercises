#1 listar autores
SELECT * FROM biblioteca.autor;

#2 Listar nombre y edad de los estudiantes
SELECT nombre, edad FROM biblioteca.estudiante;

#3 ¿Qué estudiantes pertenecen a la carrera letras?
SELECT nombre, carrera FROM biblioteca.estudiante WHERE carrera = "Letras";

#4 ¿Qué autores son de nacionalidad argentina o chilena?
SELECT nombre, nacionalidad FROM biblioteca.autor WHERE nacionalidad = "Argentina" OR nacionalidad = "Chileno";

#5 ¿Qué libros no son del área de ciencia ficción
SELECT titulo, area FROM biblioteca.libro WHERE area != "ciencia ficción";

#6 Listar los libros de la editorial alma
SELECT titulo, editorial FROM biblioteca.libro WHERE editorial = "Editorial Alma";

#7 Listar los datos de los estudiantes cuya edad es mayor al promedio
SELECT nombre, edad FROM biblioteca.estudiante WHERE edad > (SELECT AVG(edad) FROM biblioteca.estudiante);

#8 Listar los nombres de los estudiantes cuyo apellido comience con la letra G.
SELECT nombre FROM biblioteca.estudiante WHERE nombre LIKE "L%";

#9 Listar los autores del libro “Sherlock Holmes”. (Se debe listar solamente los nombres):
SELECT autor.nombre 
FROM biblioteca.autor 
INNER JOIN  biblioteca.libro_autor ON autor.IdAutor = libro_autor.IdAutor
INNER JOIN  biblioteca.libro ON libro_autor.IdLibro = libro.IdLibro
WHERE libro.titulo = 'Sherlock Holmes';

#10 ¿Qué libros se prestaron al lector “Lorena Perez”? 
SELECT libro.titulo, estudiante.nombre
FROM biblioteca.libro
INNER JOIN biblioteca.prestamo ON libro.idLibro = prestamo.idLibro
INNER JOIN biblioteca.estudiante ON prestamo.idLector = estudiante.idLector
WHERE estudiante.nombre = 'Lorena';

#11 Listar el nombre del estudiante de menor edad
SELECT nombre, edad FROM biblioteca.estudiante ORDER BY edad ASC LIMIT 1;

#12 Listar nombres de los estudiantes a los que se prestaron libros de dramas.
SELECT estudiante.nombre
FROM biblioteca.estudiante
INNER JOIN biblioteca.prestamo ON estudiante.idLector = prestamo.idLector
INNER JOIN biblioteca.libro ON prestamo.idLibro = libro.idLibro
WHERE libro.area = 'Drama';

#13 Listar los libros que pertenecen a la autora J.K. Rowling.
SELECT libro.titulo, autor.nombre
FROM biblioteca.libro
INNER JOIN biblioteca.libro_autor ON libro.idLibro = libro_autor.idLibro
INNER JOIN biblioteca.autor ON libro_autor.idAutor = autor.idAutor
WHERE autor.nombre = 'Mercedes';

#14 Listar títulos de los libros que debían devolverse el 2023-05-20 00:00:00.
SELECT libro.titulo, prestamo.fechaDevolucion
FROM biblioteca.libro
INNER JOIN biblioteca.prestamo ON libro.idLibro = prestamo.idLibro
WHERE prestamo.fechaDevolucion = '2023-05-20 00:00:00' AND prestamo.devuelto = 0;





