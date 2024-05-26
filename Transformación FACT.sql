WITH VentasConFila AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY dp.ID_producto, ts_pedido.ID_tiempo) AS id_venta,
        dpe.ID_pedido,
        ddp.ID_detalle_pedido,
        p.ID_producto,
        c.ID_cliente,
        ISNULL(CAST(dp.cantidad AS VARCHAR), 'N/A') AS cantidad_vendida,
        ISNULL(CAST(dp.cantidad * dp.precio_unidad AS VARCHAR), 'N/A') AS monto_total,
        COALESCE(
            CAST(ts_pedido.ID_tiempo AS INT), 
            CAST(ts_entrega.ID_tiempo AS INT), 
            CAST(ts_esperada.ID_tiempo AS INT), 
            0
        ) AS id_fecha
    FROM
        TbDetallePedido dp
    LEFT JOIN TbPedido pe ON
        pe.ID_pedido = dp.ID_pedido
    LEFT JOIN TbTiempo ts_pedido ON 
        pe.fecha_pedido = ts_pedido.fecha
    LEFT JOIN TbTiempo ts_entrega ON 
        pe.fecha_entrega = ts_entrega.fecha
    LEFT JOIN TbTiempo ts_esperada ON 
        pe.fecha_esperada = ts_esperada.fecha
    INNER JOIN DimCliente c ON 
        c.ID_cliente_origen = pe.ID_cliente
    INNER JOIN DimProducto p ON 
        dp.ID_producto = p.ID_producto_origen
    INNER JOIN DimDetallePedido ddp ON 
        dp.ID_detalle_pedido = ddp.ID_detalle_pedido_origen
    INNER JOIN DimPedido dpe ON 
        dp.ID_pedido = dpe.ID_pedido_origen
)
SELECT *
FROM VentasConFila;

