
-- tablas varias
select * from diario order by iddiario desc limit 100;
select * from clientes;
select * from pedidos where arch like('%gustavo%');
select * from pedidos where idclientes = 9;
select * from pedidos where idpedidos= 191;
select t1.cant,t2.nom_corto,t1.preciot from artsped as t1 inner join productos as t2 
on t1.idproductos= t2.idproductos where idpedido = 191;
select * from catctasat;
-- revision de ventas publico en general
-- monto
select fecha,cuenta,referencia,haber, facturar from diario where cuenta like('%40%') and subcuenta <5 and fecha >'2017-08-31';
-- suma de monto
select sum(haber)from diario where cuenta like('%40%') and subcuenta <5 and fecha >'2017-08-31';
-- iva
select fecha,cuenta,referencia,haber from diario where (cuenta like('208%') or cuenta like('209%')) and subcuenta <5 and fecha >'2017-08-31';