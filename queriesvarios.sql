-- ultimas operaciones en diario
select * from diario order by iddiario desc limit 20;
-- consulta de productos
SELECT t1.idproductos, t1.codigo,t1.cbarras,
t1.nombre,t1.nom_corto,t1.nom_cat,
t2.nombre AS unidad, t1.cant, t1.descripcion,t1.costo,
t1.costov,t1.precio1,t1.precio2,t1.precio3,t1.precio4
FROM productos AS t1 LEFT JOIN unidades AS t2 
ON t1.unidad = t2.idunidades ORDER BY idproductos;
-- revision de ventas
select * from diario where referencia = "pd29";
select * from artsped where idpedido = 29;
select * from inventario where idproductos = 27 or idproductos = 28;

--  consulta de 1 producto x id
select * from productos where idproductos = 100;
-- selecciona ordenes de compra
select * from oc order by idoc desc limit 20;

-- selecciona ordenes de compra por producto
select idoc,cant,preciou,preciot from artsoc where idproductos =14;
SELECT * FROm inventario where idproductos = 91;

-- ventas del mes al publico en general
select * from diario where cuenta like('40%') and subcuenta < 5 and fecha > '2017-09-30';

-- consulta de clientes
select * from clientes where 1;


