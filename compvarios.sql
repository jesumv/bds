SELECT * FROM tblregistro;
SELECT * FROM tblcat;
SELECT * FROM tbllugar;
SELECT * FROM tblclase;

-- lista de competencia

SELECT t1.fecha,t1.producto, CONCAT(t2.nombre," ", t2.marca, " ",t2.cant," ",t3.nombre),t1.precio, t1.punit, t4.nombre FROM tblregistro AS t1 
INNER JOIN tblproducto AS t2 ON t1.producto = t2.idproducto INNER JOIN tblunids AS t3 ON t2.unid = t3.idunids 
INNER JOIN tbllugar AS t4 ON t1.lugar = t4.idlugar ORDER BY t2.nombre;