use  tienda;

-- Llista el nom de tots els productes que hi ha en la taula producto.
select nombre from producto;

-- Llista els noms i els preus de tots els productes de la taula producto.
select nombre, precio from producto;

-- Llista totes les columnes de la taula producto.
select * from producto;

-- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
select nombre, precio as EUR, ROUND(precio*0.86,2) as USD from producto;

-- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
select nombre as 'Nombre de producto', precio as euros, ROUND(precio*0.86,2) as dólares from producto;

-- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
select UPPER(nombre) as Nombre, precio from producto;

-- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
select LOWER(nombre) as Nombre, precio from producto;

-- Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
select nombre, LEFT(UPPER(nombre),2) as Iniciales from fabricante;

-- Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
select nombre, ROUND(precio,1) as 'Precio Redondeado' from producto;

-- Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
select nombre, TRUNCATE(precio,0) as 'Precio truncado' from producto;

-- Llista el codi dels fabricants que tenen productes en la taula producto.
select codigo_fabricante from producto group by codigo_fabricante;

-- Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
select distinct codigo_fabricante from producto;

-- Llista els noms dels fabricants ordenats de manera ascendent.
select nombre from fabricante order by nombre asc;

-- Llista els noms dels fabricants ordenats de manera descendent.
select nombre from fabricante order by nombre desc;

-- Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
select nombre, precio from producto order by nombre asc, precio desc;

-- Retorna una llista amb les 5 primeres files de la taula fabricante.
select * from fabricante limit 5;

-- Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
select * from fabricante limit 2 offset 3;

-- Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
select nombre, precio from producto order by precio asc limit 1;

-- Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
select nombre, precio from producto order by precio desc limit 1;

-- Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
select nombre from producto where codigo_fabricante=2;

-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
select p.nombre as 'Nombre producto', p.precio 'Precio producto', f.nombre 'Fabricante' from producto as p join fabricante as f on f.codigo = p.codigo_fabricante;

-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
select p.nombre as 'Nombre producto', p.precio 'Precio producto', f.nombre 'Fabricante' from producto as p join fabricante as f on f.codigo = p.codigo_fabricante order by f.nombre;

-- Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
select p.nombre as 'Nombre producto', p.precio 'Precio producto', f.nombre 'Fabricante', f.codigo as 'Codigo fabricante' from producto as p join fabricante as f on f.codigo = p.codigo_fabricante;

-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
select p.nombre as producte, p.precio as preu, f.nombre as fabricant from producto p join fabricante f on f.codigo = p.codigo_fabricante where p.precio = (select MIN(precio) from producto);

-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
select p.nombre as producte, p.precio as preu, f.nombre as fabricant from producto p join fabricante f on f.codigo = p.codigo_fabricante where p.precio = (select MAX(precio) from producto);

-- Retorna una llista de tots els productes del fabricant Lenovo.
select p.*, f.nombre from producto p join fabricante f on f.codigo = p.codigo_fabricante where f.nombre = 'Lenovo';

-- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
select p.*, f.nombre from producto p join fabricante f on f.codigo = p.codigo_fabricante where f.nombre = 'Crucial' and p.precio>200;

-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.
select p.*, f.nombre from producto p join fabricante f on f.codigo = p.codigo_fabricante where f.nombre = 'Asus' or f.nombre = 'Hewlett-Packard' or f.nombre = 'Seagate';

-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Fent servir l'operador IN.
select p.*, f.nombre from producto p join fabricante f on f.codigo = p.codigo_fabricante where f.nombre in('Asus', 'Hewlett-Packard', 'Seagate');

-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
select p.nombre, p.precio, f.nombre from producto p join fabricante f on f.codigo = p.codigo_fabricante where f.nombre like('%e');

-- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
select p.nombre, p.precio, f.nombre from producto p join fabricante f on f.codigo = p.codigo_fabricante where f.nombre like('%w%');

-- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
select p.nombre, p.precio, f.nombre from producto p join fabricante f on f.codigo = p.codigo_fabricante where p.precio >=180 order by p.precio desc, p.nombre asc;

-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
select f.nombre, f.codigo from fabricante f join producto p on f.codigo = p.codigo_fabricante group by f.codigo;

-- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
select f.*, p.* from fabricante f left join producto p on p.codigo_fabricante = f.codigo;

-- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
select f.* from fabricante f left join producto p on f.codigo = p.codigo_fabricante where f.codigo not in(select codigo_fabricante from producto);

-- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
select p.* from producto p where p.codigo_fabricante = (select f.codigo from fabricante f where f.nombre = 'Lenovo');

-- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
select p.* from producto p where p.precio = (select MAX(p.precio) from producto p where p.codigo_fabricante = (select f.codigo from fabricante f where f.nombre = 'Lenovo'));

-- Llista el nom del producte més car del fabricant Lenovo.
select p.nombre from producto p join fabricante f on f.codigo = p.codigo_fabricante where f.nombre = 'Lenovo' order by p.precio desc limit 1;


-- Llista el nom del producte més barat del fabricant Hewlett-Packard.
select p.nombre from producto p join fabricante f on f.codigo = p.codigo_fabricante where f.nombre = 'Hewlett-Packard' order by p.precio limit 1;


-- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
select p.* from producto p where p.precio >= (select MAX(p.precio) from producto p where p.codigo_fabricante = (select f.codigo from fabricante f where f.nombre = 'Lenovo'));

-- Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
select p.*, f.nombre from producto p join fabricante f on f.codigo = p.codigo_fabricante where f.nombre = 'Asus' and p.precio > (select AVG(precio) from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Asus'));


-- BASE DE DADES UNIVERSIDAD
use universidad;

-- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
select apellido1 as 'primer apellido', apellido2 as 'segundo apellido', nombre from persona where tipo = 'alumno' order by apellido1 asc, apellido2 asc, nombre asc;

-- Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
select apellido1 as 'primer apellido', apellido2 as 'segundo apellido', nombre, telefono from persona where tipo = 'alumno' and telefono is null;

-- Retorna el llistat dels alumnes que van néixer en 1999.
select * from persona where tipo = 'alumno' and fecha_nacimiento between '1999-01-24' and '1999-12-31';

-- Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
select * from persona where tipo = 'profesor' and telefono is null and nif like('%K');

-- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
select * from asignatura where  cuatrimestre = 1 and curso = 3 and id_grado = 7;

-- Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
select per.apellido1 as 'Primer Apellido', per.apellido2 as 'Segundo Apellido', per.nombre, dep.nombre from persona per join profesor pro on pro.id_profesor = per.id join departamento dep on pro.id_departamento = dep.id order by per.apellido1, per.apellido2, per.nombre;

-- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
select sub.nombre, ce.anyo_inicio as 'Año de inicio', ce.anyo_fin as 'Año de finalización' from asignatura sub join alumno_se_matricula_asignatura mat on mat.id_asignatura = sub.id join curso_escolar ce on ce.id = mat.id_curso_escolar where mat.id_alumno = (select id from persona where nif = '26902806M');

-- Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
select distinct dep.nombre from departamento dep join profesor pro on pro.id_departamento = dep.id where pro.id_profesor in (select id_profesor from asignatura where id_grado = (select id from grado where nombre = 'Grado en Ingeniería Informática (Plan 2015)'));

-- Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
select distinct p.* from persona p join alumno_se_matricula_asignatura a on p.id = a.id_alumno where a.id_curso_escolar = (select id from curso_escolar where anyo_inicio = 2018 and anyo_fin = 2019);

-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
-- Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. 
-- El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. 
-- El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
select dep.nombre, per.apellido1, per.apellido2, per.nombre, per.tipo from persona per left join  profesor pro on per.id = pro.id_profesor left join departamento dep on dep.id = pro.id_departamento where per.tipo = 'profesor' order by dep.nombre, per.apellido1, per.apellido2, per.nombre;

-- Retorna un llistat amb els professors/es que no estan associats a un departament.
select per.apellido1, per.apellido2, per.nombre, per.tipo from persona per left join profesor pro on per.id = pro.id_profesor where per.tipo = 'profesor' and pro.id_profesor is null;

-- Retorna un llistat amb els departaments que no tenen professors/es associats.
select departamento.nombre from departamento left join profesor on profesor.id_departamento = departamento.id where departamento.id not in (select id_departamento from profesor);


-- Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
select persona.nombre, persona.apellido1, persona.apellido2 from persona left join asignatura on persona.id = asignatura.id_profesor where persona.tipo = 'profesor' and asignatura.id_profesor is null;

-- Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
select * from asignatura where id_profesor is null;

-- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
select d.nombre from departamento d left join profesor p on d.id = p.id_departamento left join asignatura a on p.id_profesor = a.id_profesor left join alumno_se_matricula_asignatura m on a.id = m.id_asignatura group by d.id, d.nombre having COUNT(m.id_asignatura) = 0;


-- Consultes resum:
-- Retorna el nombre total d'alumnes que hi ha.
select count(*) as 'Total Alumnos' from persona where tipo = 'alumno';

-- Calcula quants alumnes van néixer en 1999.
select count(*) as 'Total Alumnos nacidos 1999' from persona where tipo = 'alumno' and fecha_nacimiento between '1999-01-01' and '1999-12-31';

-- Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, 
-- una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. 
-- El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
select dep.nombre, count(pro.id_profesor) as total_profesores from departamento dep join profesor pro on pro.id_departamento = dep.id group by dep.nombre order by total_profesores desc;

-- Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. 
-- Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.
select dep.nombre, count(pro.id_profesor) as total_profesores from departamento dep left join profesor pro on pro.id_departamento = dep.id group by dep.nombre order by total_profesores desc;


-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. 
-- Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. 
-- El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
select gr.nombre, count(sub.id) as total_asignaturas from grado gr left join asignatura sub on sub.id_grado = gr.id group by gr.nombre order by total_asignaturas desc;

-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
select * from (select gr.nombre, count(sub.id) as total_asignaturas from grado gr left join asignatura sub on sub.id_grado = gr.id group by gr.nombre) as grados_filtrados where total_asignaturas > 40;

-- Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. 
-- El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
select gr.nombre, sub.tipo, sum(sub.creditos) from grado gr  join asignatura sub on gr.id = sub.id_grado group by gr.nombre, sub.tipo;

-- Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. 
-- El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
select  ce.anyo_inicio as 'Inicio Curso', count(distinct am.id_alumno) as 'Alumnos matriculados' from curso_escolar ce join alumno_se_matricula_asignatura am on am.id_curso_escolar = ce.id group by ce.anyo_inicio;

-- Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. 
-- El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
select per.id, per.nombre, per.apellido1, per.apellido2, count(sub.id) as total_asignaturas from persona per left join asignatura sub on sub.id_profesor = per.id where per.tipo = 'profesor' group by per.id;

-- Retorna totes les dades de l'alumne/a més jove.
select * from persona where fecha_nacimiento = (select max(fecha_nacimiento) from persona);

-- Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.
select per.* from persona per join profesor pro on per.id = pro.id_profesor left join asignatura sub on pro.id_profesor = sub.id_profesor where sub.id_profesor is null;

