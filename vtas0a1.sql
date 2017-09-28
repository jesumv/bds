-- ingresar operaciones de diario en 0 a 1
-- revisar referencias
SELECT * FROM diario WHERE (cuenta LIKE ('401%') AND facturar = 0 AND fecha >'2017-06-30' AND fecha <>'2017-07-19') ORDER BY iddiario;
-- corregir fecha por referencia 
UPDATE diario SET facturar = 1  WHERE referencia = 'pd126';

UPDATE inventario SET  factu = 1  WHERE idoc = '126' AND haber <>0;
 
UPDATE pedidos SET  facturar = 1  WHERE idpedidos = 126;

SELECT * FROM diario WHERE referencia = 'pd126';

SELECT SUM(haber) FROM diario WHERE cuenta='401.04' AND fecha ='2017-07-19';