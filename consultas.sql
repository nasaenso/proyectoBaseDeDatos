1. Listado de ofertas laborales y la empresa que la publica, a las que se presenta
un determinado postulante (ver un postulante según los datos ingresados).
SELECT e.nomEmpresa, o.nomOfertaLaboral, p.nomPostulante
FROM empresa e INNER JOIN ofertalaboral o INNER JOIN postulante p INNER
JOIN postula po
ON (e.idEmpresa = o.idEmpresa) AND (p.idPostulante = po.idPostulante) AND
(po.idOfertaLaboral = o.idOfertaLaboral);

2. Cantidad de postulaciones por mes.
SELECT p.fechaPost, COUNT(*)
FROM postula p
GROUP BY MONTH(p.fechaPost);

3. Listado de ofertas laborales de tipo “DESTACADA” publicadas por una
determinada empresa (ver una empresa según los datos ingresados)
SELECT o.nomOfertaLaboral, e.nomEmpresa, t.nomTipo
FROM ofertalaboral o INNER JOIN empresa e INNER JOIN tipo t
ON (o.idEmpresa = e.idEmpresa) AND (t.idTipo = o.idTipo)
WHERE (t.nomTipo = "destacada") AND (e.nomEmpresa = "TechCorp");

4. Promedio de costo de publicaciones por empresa, debe figurar el nombre de la
empresa.
SELECT e.nomEmpresa, AVG(t.costo)
FROM empresa e INNER JOIN ofertalaboral o INNER join tipo t
WHERE (o.idTipo = t.idTipo) AND (e.idEmpresa = o.idEmpresa)
GROUP BY nomEmpresa;

5. Contar la cantidad de postulantes por oferta.
SELECT o.nomOfertaLaboral, COUNT(p.idOfertaLaboral)
FROM postula p INNER JOIN ofertalaboral o
WHERE (p.idOfertaLaboral = o.idOfertaLaboral)
GROUP BY o.nomOfertaLaboral;

6. Contar la cantidad de postulantes por oferta y debe aparecer el nombre de la
empresa y de la oferta.
SELECT e.nomEmpresa, o.nomOfertaLaboral, COUNT(p.idOfertaLaboral)
FROM postula p INNER JOIN ofertalaboral o INNER JOIN empresa e
WHERE (p.idOfertaLaboral = o.idOfertaLaboral) AND (e.idEmpresa = o.idEmpresa)
GROUP BY o.nomOfertaLaboral;

7. Contar la cantidad de postulaciones por oferta y por concepto, debe aparecer el
nombre de la empresa y de la oferta.
SELECT e.nomEmpresa, o.nomOfertaLaboral, p.valoracion, COUNT(p.valoracion)
FROM postula p INNER JOIN ofertalaboral o INNER JOIN empresa e
WHERE (p.idOfertaLaboral = o.idOfertaLaboral) AND (e.idEmpresa = o.idEmpresa)
AND (e.nomEmpresa = "TechCorp")
GROUP BY p.valoracion;

8. Listar nombre de empresa y nombre de ofertas de tipo “OFERTA”, con
remuneraciones mayores que 100000.
SELECT e.nomEmpresa, o.nomOfertaLaboral, t.nomTipo, o.remuneracion
FROM empresa e INNER JOIN ofertalaboral o INNER JOIN tipo t
WHERE (e.idEmpresa = o.idEmpresa) AND (o.idTipo = t.idTipo) AND (t.nomTipo =
"OFERTA") AND (o.remuneracion > 10000);

9. Listar las ofertas que no están vigentes, es decir aquellas cuya duración en días
luego de la fecha de publicación ya pasó.
SELECT nomOfertaLaboral, fechaDeAltaOL
FROM ofertalaboral
WHERE (fechaDeAltaOL < CURRENT_DATE);
