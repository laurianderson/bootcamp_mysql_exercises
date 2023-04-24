#Ejercicio 1
# 1) Con la base de datos “movies”, se propone crear una tabla temporal llamada “TWD”
#y guardar en la misma los episodios de todas las temporadas de “The Walking Dead”.

use movies_db;

CREATE TEMPORARY TABLE twd (nombreEpisodio varchar(40), nombreTemporada varchar(40));

INSERT INTO twd  SELECT e.title , s.title
FROM movies_db.seasons AS s
INNER JOIN movies_db.episodes AS e ON s.id = e.season_id
WHERE s.serie_id = 3;

# 2) Realizar una consulta a la tabla temporal para ver los episodios de la primera temporada.
SELECT nombreEpisodio, nombreTemporada FROM twd 
WHERE nombreTemporada = "Primer Temporada";

#------------------------------------------------------------------------------------------------
#Ejercicio 2
#1) En la base de datos “movies”, seleccionar una tabla donde crear un índice y luego chequear la creación del mismo
EXPLAIN SELECT * FROM episodes WHERE number > 5