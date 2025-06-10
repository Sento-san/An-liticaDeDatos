-- crear la base de datos Stage_Norwith
create database stage_northwind;

-- Crear la base de datos datamar_northwind
create database datamar_northwind;

-- Implementar la base de datos stage_northwind 
use stage_northwind;

create table Categorias (
	categoriaId int not null,
	nombreCategoria varchar(15),
);

create table clientes(
	clienteId char(5) not null,
	compania varchar(40) not null,
	ciudad varchar(15),
	region varchar(15),
	codigoPostal char(10),
	pais nvarchar(15)
);

create table empleados(
	empleadoId int not null,
	nombre varchar(10) not null,
	apellido varchar(20),
	fechar_contratacion date
);

create table producto(
	productoId int not null,
	nombre_producto varchar(50),
	precioUnitario decimal(15,2) not null,
);

create table proveedor(
	proveedorId int not null,
	proveedorNombre varchar(40) not null,
	ciudad varchar(15),
	region varchar(15),
	pais varchar(15)
);

create table ventas(
	clienteId char(5) not null,
	empleadoCodigo int not null,
	productoCodigo int not null,
	ventasOrder datetime not null,
	ventasMonto decimal(15,2) not null,
	ventasUnidades int not null,
	ventasPrecioUnitario decimal(15,2) not null,
	ventasDescuento decimal(15,2)
);

-- crear el datamartNortwind
use datamar_northwind;

create table dim_cliente(
	cliente_Skey int not null identity (1,1),
	cliente_codigoBkey char(5) not null,
	cliente_compania varchar(40) not null,
	cliente_ciudad varchar(15) not null,
	cliente_region varchar(25) not null,
	cliente_pais varchar(15) not null,
	constraint pk_dimcliente
	primary key (cliente_Skey)
);

create table dim_empleado(
	empleado_Skey int not null identity(1,1), 
	empleado_codigoBkey int not null,
	empleado_NombreCompleto varchar(100) not null,
	constraint pk_dimempleado
	primary key (empleado_Skey)
);

create table dim_producto(
	producto_Skey int not null identity(1,1),
	producto_CodigoBkey int not null,
	producto_Nombre varchar(80) not null,
	producto_Categoria_Nombre varchar(15) not null,
	constraint  pk_dimproducto
	primary key (producto_Skey)
);

create table dim_tiempo(
	tiempo_Skey int not null identity(1,1),
	tiempo_fechaActual datetime not null,
	tiempo_anio int not null,
	tiempo_trimestre int not null,
	tiempo_mes int not null,
	tiempo_semana int not null,
	tiempo_diadeAnio int not null,
	tiempo_diadeMes int not null,
	tiempo_diaSemana int not null
	constraint pk_dimtiempo
	primary key (tiempo_Skey)
);

create table fact_ventas(
	cliente_Skey int not null,
	empleado_Skey int not null,
	producto_Skey int not null,
	tiempo_Skey int not null,
	ventas_Norder int not null,
	ventas_monto decimal(15,2) not null,
	ventas_unidades int not null,
	ventas_Punitario decimal(15,2) not null,
	ventas_descuento decimal(15,2) not null,
	constraint pk_factVentas
	primary key(cliente_Skey,empleado_Skey,producto_Skey,tiempo_Skey),
	constraint fk_factVentas_dimcliente
	foreign key (cliente_Skey)
	references dim_cliente(cliente_Skey),
	constraint fk_Ventas_dimempleado
	foreign key (empleado_Skey)
	references dim_empleado(empleado_Skey),
	constraint fk_Ventas_dimproducto
	foreign key (producto_Skey)
	references dim_producto(producto_Skey),
	constraint fk_Ventas_dimtiempo
	foreign key (tiempo_Skey)
	references dim_tiempo(tiempo_Skey)
);