--TABLA_PRODUCTO
SELECT  p.ID_producto, p.nombre, p.Categoria, p.dimensiones, p.proveedor, p.descripcion,
p.cantidad_en_stock, p.precio_venta, p.precio_proveedor
FROM
producto p

--TABLA_TIEMPO
SELECT DISTINCT pe.fecha_pedido,pe.fecha_esperada, pe.fecha_entrega
FROM pedido pe
ORDER BY 1 ASC

--TABLA_CLIENTE
SELECT c.ID_cliente, c.nombre_cliente, c.nombre_contacto, c.apellido_contacto, c.telefono,
c.fax, c.linea_direccion1, c.linea_direccion2, c.ciudad, c.region, c.pais, c.codigo_postal,
c.ID_empleado_rep_ventas, c.limite_credito
FROM
cliente c

--TABLA_PEDIDO
USE jardineria
SELECT 
	p.ID_pedido,
	p.estado,
	p.fecha_pedido,
	p.fecha_entrega,
	p.fecha_esperada
FROM pedido p

--TABLA_DETALLE_PEDIDO
USE jardineria
SELECT 
	dp.ID_detalle_pedido,
	dp.ID_pedido,
	dp.ID_producto,
	dp.cantidad,
	dp.precio_unidad
FROM detalle_pedido dp


