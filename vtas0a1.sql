-- ingresar operaciones de diario en 0 a 1
-- revisar referencias
SELECT * FROM diario WHERE (cuenta LIKE ('401%') AND facturar = 0 AND fecha >'2017-05-31' AND fecha <'2017-07-01') ORDER BY iddiario;
-- corregir fecha por referencia 
UPDATE diario SET fecha = '2017-07-19',facturar = 1 , coment = 'correc fecha' WHERE referencia = 'pd105';

UPDATE inventario SET fechamov = '2017-07-19', factu = 1 ,comentarios = 'ajust' WHERE idoc = '105' AND haber <>0;
 
UPDATE pedidos SET fecha = '2017-07-19', fechapago = '2017-07-19', facturar = 1 ,coment = 'ajust' WHERE idpedidos = 105;

SELECT * FROM diario WHERE referencia = 'pd104';

SELECT SUM(haber) FROM diario WHERE cuenta='401.04' AND fecha >'2017-06-30';