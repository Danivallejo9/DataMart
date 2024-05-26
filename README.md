Proyecto de Migración de Datos y Creación de Data Mart

Descripción del Proyecto
Este proyecto tiene como objetivo la migración de datos desde la base de datos Jardinería hacia una base de datos Staging y, posteriormente, la creación de un Data Mart utilizando el modelo estrella. Este proceso incluye la extracción, transformación y carga (ETL) de los datos, asegurando su integridad y calidad para un análisis eficiente. El modelo estrella propuesto facilita la organización y análisis de las ventas, proporcionando una estructura centralizada que integra datos de productos, clientes, tiempo, pedidos y detalles de pedidos.

Objetivos
Realizar una migración efectiva de los datos de la base de datos Jardinería.

Diseñar la estructura de las tablas en la base de datos Staging basada en el modelo del Data Mart.

Desarrollar consultas SQL para la extracción, transformación y carga de datos.

Validar la integridad de los datos migrados.

Crear un Data Mart utilizando el modelo estrella para optimizar el análisis de datos.

Documentar el proceso de migración para futuras referencias.

Proceso de ETL (Extracción, Transformación y Carga)

Extracción: Consultas SQL para extraer datos de las tablas de la base de datos Jardinería.

Transformación: Limpieza y transformación de los datos para adecuarse a la estructura de la base de datos Staging y el Data Mart.

Carga: Inserción de los datos transformados en la base de datos Staging y posterior carga en el Data Mart.

Estructura del Modelo Estrella
DimProducto: Información sobre los productos.
DimCliente: Información sobre los clientes.
DimTiempo: Información temporal.
DimPedido: Información sobre los pedidos.
DimDetallePedido: Detalles específicos de los pedidos.
FACTVentas: Tabla de hechos que registra las ventas.

Participantes del Proyecto
Kelly Vega Morales (94)
Yampier Ruiz Patiño (94)
Shamir Tano Morales (76)
Daniela Vallejo Bustamante (94)

Conclusiones
El modelo estrella implementado proporciona una estructura eficiente para el análisis de ventas, facilitando la generación de informes y análisis detallados. La migración de datos hacia la base de datos Staging y su posterior carga en el Data Mart garantizan una consulta óptima y confiable, cumpliendo con los requerimientos del cliente y mejorando la toma de decisiones basada en datos.

