USE stage_northwind;
USE Northwind;
USE datamar_northwind;

CREATE TABLE [dbo].[Stage_Tiempo](
	[Tiempo_Skey] [int] IDENTITY(1,1) NOT NULL,
	[Tiempo_FechaActual] [datetime] NOT NULL,
	[Tiempo_Anio] [int] NOT NULL,
	[Tiempo_Trimestre] [int] NOT NULL,
	[Tiempo_Mes] [int] NOT NULL,
	[Tiempo_Semana] [int] NOT NULL,
	[Tiempo_DiaDeAnio] [int] NOT NULL,
	[Tiempo_DiaDeMes] [int] NOT NULL);

SELECT Distinct(OrderDate),
YEAR(OrderDate) AS Anio,
DATEPART(QUARTER,OrderDate) as Trimestre,
DATEPART(MONTH,OrderDate) as Mes,
DATEPART(WEEK,OrderDate) as Semana,
DATEPART(DAYOFYEAR,OrderDate) as DiaDeAnio,
DATEPART(DAY,OrderDate) as DiaDeMes,
DATEPART(WEEKDAY,OrderDate-1) as DiaDeSemana
FROM Northwind.DBO.Orders;

select * from Categorias;
select * from clientes;
select * from producto;
select * from empleados;
select * from proveedor;
select * from ventas;
select * from Stage_Tiempo;

SELECT se.empleadoId, concat(se.nombre,' ',se.apellido) as 'NombreCompleto'
FROM stage_northwind.dbo.empleados AS se

select * from datamar_northwind.dbo.dim_empleado;

SELECT st.Tiempo_FechaActual, st.Tiempo_Anio,
st.Tiempo_Trimestre, st.Tiempo_Mes,
st.Tiempo_Semana, st.Tiempo_DiaDeAnio,
st.Tiempo_DiaDeMes, st.Tiempo_DiaSemana
FROM stage_northwind.dbo.Stage_Tiempo AS st;

SELECT * FROM stage_northwind.dbo.Stage_Tiempo AS st;
SELECT * FROM stage_northwind.dbo.producto as st;

select * from Northwind.dbo.Products
where CategoryID is null;

SELECT ProductID, ProductName, UnitPrice, c.CategoryID
FROM Northwind.dbo.Products as p
INNER JOIN Northwind.DBO.Categories as c
ON p.CategoryID = c.CategoryID;

SELECT p.productoId, p.nombre_producto,
c.nombreCategoria
FROM stage_northwind.dbo.Categorias AS c
INNER JOIN stage_northwind.dbo.producto AS p
ON p.categoriaid = c.categoriaId;

SELECT * FROM datamar_northwind.dbo.dim_producto;

SELECT Tiempo_fechaActual, tiempo_anio,
tiempo_trimestre, tiempo_mes, tiempo_semana,
tiempo_diadeAnio, tiempo_diadeMes, tiempo_diaSemana
FROM stage_northwind.dbo.Stage_Tiempo;

SELECT dc.cliente_Skey, de.empleado_Skey,
dp.producto_Skey, dt.tiempo_Skey,
sv.ventasOrder, sv.ventasMonto, sv.ventasUnidades,
sv.ventasPrecioUnitario, sv.ventasDescuento
FROM stage_northwind.dbo.ventas AS sv
INNER JOIN datamar_northwind.dbo.dim_cliente AS dc
ON sv.clienteId = dc.cliente_codigoBkey
INNER JOIN datamar_northwind.dbo.dim_empleado AS de
ON sv.empleadoCodigo = de.empleado_codigoBkey
INNER JOIN datamar_northwind.dbo.dim_producto AS dp
ON sv.productoCodigo = dp.producto_CodigoBkey
INNER JOIN datamar_northwind.dbo.dim_tiempo AS dt
ON sv.ventasOrder = dt.tiempo_fechaActual;

-- Consulta Dim_Ventas Luis
SELECT dc.cliente_Skey, de.empleado_SKey, 
dp.producto_SKey, dt.tiempo_SKey, 
sv.ventasOrder, sv.ventasmonto, sv.ventasunidades, 
sv.ventaspreciounitario, sv.ventasdescuento
FROM stage_northwind.dbo.ventas AS sv
INNER JOIN datamar_northwind.dbo.dim_cliente as dc
on sv.clienteid = dc.cliente_codigoBkey
inner join datamar_northwind.dbo.dim_empleado as de
on sv.empleadocodigo = de.empleado_codigoBKey
inner join datamar_northwind.dbo.dim_producto as dp
on sv.productocodigo = dp.producto_CodigoBkey
inner join datamar_northwind.dbo.dim_tiempo as dt
on sv.ventasOrder = dt.tiempo_fechaActual;

SELECT * FROM datamar_northwind.dbo.fact_ventas;

DBCC CHECKIDENT('dim_cliente', RESEED, 0);
GO
TRUNCATE TABLE dim_cliente;
GO