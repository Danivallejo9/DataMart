/*Dim_cliente*/
SELECT c.ID_cliente, 
UPPER (c.nombre_cliente) AS cliente,
UPPER (c.nombre_contacto + ' ' + c.apellido_contacto) AS contacto, 
REPLACE(c.telefono, '-', '') AS telefono,
REPLACE(c.fax, '-', '') AS fax,
c.linea_direccion1, 
ISNULL (c.linea_direccion2, 'N/A') AS linea_direccion2, 
c.ciudad, c.region, 
c.pais, 
c.codigo_postal,
UPPER (e.nombre + ' ' + e.apellido1 + ' ' + e.apellido2) AS emplado,
FORMAT(c.limite_credito, 'N0') AS limite_credito
FROM
StagingJardineria.dbo.TbCliente c
JOIN jardineria.dbo.empleado e
ON c.ID_empleado_rep_ventas = e.ID_empleado;

/*dim_producto*/
SELECT  p.ID_producto,
UPPER(p.nombre) AS nombre,
cp.Desc_Categoria AS categoria,
p.dimensiones,
p.proveedor,
p.descripcion,
p.cantidad_en_stock,
p.precio_venta,
p.precio_proveedor
FROM
StagingJardineria.dbo.TbProducto p
JOIN jardineria.dbo.Categoria_producto cp
ON p.Categoria = cp.Id_Categoria;

/*dim_pedido*/
USE StagingJardineria
SELECT pe.ID_pedido, pe.estado
FROM TbPedido pe

/*dim_detallePedido*/
USE StagingJardineria
SELECT 
	dp.ID_detalle_pedido,
	UPPER(p.nombre) AS nombre,
	dp.cantidad,
	pe.estado,
    ISNULL(NULLIF(p.descripcion, ''), 'N/A') AS descripcion,
	p.precio_venta,
	ISNULL(NULLIF(p.dimensiones, ''), 'N/A') AS dimensiones,
	c.Desc_Categoria AS categoria
FROM TbDetallePedido dp
LEFT JOIN TbPedido pe ON
	pe.ID_pedido = dp.ID_pedido
LEFT JOIN TbProducto p ON
	p.ID_producto = dp.ID_producto
LEFT JOIN jardineria.dbo.Categoria_producto c ON
c.Id_Categoria = p.Categoria
ORDER BY ID_detalle_pedido ASC

/*fact_ventas*/
WITH VentasConFila AS (
	SELECT 
		ROW_NUMBER() OVER (ORDER BY dp.ID_producto, ts_pedido.ID_tiempo) AS id_venta,
		dp.ID_producto,
		ISNULL(CAST(dp.cantidad AS VARCHAR), 'N/A') AS cantidad_vendida,
        ISNULL(CAST(dp.cantidad * dp.precio_unidad AS VARCHAR), 'N/A') AS monto_total,
		 ISNULL(CAST(COALESCE(
		 ts_pedido.ID_tiempo, ts_entrega.ID_tiempo,
		 ts_esperada.ID_tiempo) AS VARCHAR), 'N/A')
		 AS id_fecha
	FROM
	TbDetallePedido dp
	LEFT JOIN TbPedido pe ON
		pe.ID_pedido = dp.ID_pedido
	LEFT JOIN 
		TbTiempo ts_pedido ON pe.fecha_pedido = ts_pedido.fecha
	LEFT JOIN 	
		TbTiempo ts_entrega ON pe.fecha_entrega = ts_entrega.fecha
	LEFT JOIN 	
		TbTiempo ts_esperada ON pe.fecha_esperada = ts_esperada.fecha
)	SELECT *
	FROM VentasConFila;