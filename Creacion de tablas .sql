-- Creacion de la tabla Inventario --
CREATE TABLE Inventario (
id_producto NUMBER(5) NOT NULL,
cantidad NUMBER(5)DEFAULT,
CONSTRAINT PK_Inventario PRIMARY KEY(id_producto)
);


-- Creacion de la tabla Oferta--
CREATE TABLE Oferta(
id_oferta NUMBER(5) NOT NULL,
id_producto NUMBER (5)NOT NULL,
nuevo_precio NUMBER (5)NOT NULL,
CONSTRAINT PK_Oferta PRIMARY KEY(id_oferta)
);


-- Creacion de la tabla Producto --
CREATE TABLE Producto(
idProducto NUMBER(5),
id_oferta NUMBER (5),
nombre VARCHAR2(45),
marca VARCHAR2(45),
ubicacion VARCHAR2(45),
descripcion VARCHAR2(45),
precio NUMBER(5),
CONSTRAINT PK_Producto PRIMARY KEY(idProducto)
CONSTRAINT FK_Oferta FOREIGN KEY(id_oferta) REFERENCES (id_oferta)
);


-- Creacion de la tabla Venta --
CREATE TABLE Venta(
id_ticket NUMBER(5),
id_cliente NUMBER (5),
id_vendedor NUMBER (5),
fecha_venta DATE,
tipo_pago VARCHAR2(45),
tipo_servicio VARCHAR2(45),
tipo_venta VARCHAR2(45),
CONSTRAINT PK_Venta PRIMARY KEY(id_ticket)
);


-- Creacion de la tabla VentaDetalle --
CREATE TABLE VentaDetalle(
id_venta_detalle NUMBER(5),
id_ticket NUMBER (5),
id_producto NUMBER(5),
marca VARCHAR2(45),
cantidad NUMBER (5),
total NUMBER(5),
CONSTRAINT PK_VentaDetalle PRIMARY KEY(id_venta_detalle)
CONSTRAINT FK_Producto FOREIGN KEY(idProducto) REFERENCES (idProducto)
CONSTRAINT FK_Venta FOREIGN KEY(id_ticket) REFERENCES (id_ticket)
);


-- Creacion de la tabla Facturas --
CREATE TABLE Facturas(
id_factura NUMBER(5),
id_cliente NUMBER (5),
id_ticket NUMBER(5),
fecha DATE,
CONSTRAINT PK_Facturas PRIMARY KEY(id_factura)
CONSTRAINT FK_Cliente FOREIGN KEY(id_clientes) REFERENCES (id_clientes)
CONSTRAINT FK_Venta FOREIGN KEY(id_ticket) REFERENCES (id_ticket)
);


-- Creacion de la tabla Clientes --
CREATE TABLE Clientes(
id_clientes NUMBER(5),
nombre VARCHAR2(45),
apellido_paterno VARCHAR2(45),
apellido_materno VARCHAR2(45),
direccion VARCHAR2(45),
telefono VARCHAR2(45),
email VARCHAR2(45),
rfc VARCHAR2(45) UNIQUE,
CONSTRAINT PK_Clientes PRIMARY KEY(id_clientes)
);


-- Creacion de la tabla Tienda --
CREATE TABLE Tienda (
id_tienda NUMBER(5),
direccion_tienda VARCHAR2(45),
telefono_tienda VARCHAR2(45),
CONSTRAINT PK_Tienda PRIMARY KEY(id_tienda)
);


-- Creacion de la tabla Vendedor --
CREATE TABLE Vendedor(
id_vendedor NUMBER(5),
id_tienda NUMBER(5),
nombre_vendedor VARCHAR2(45),
apellido_paterno_vendedor VARCHAR2(45),
apellido_materno_vendedor VARCHAR2(45),
direccion_vendedor VARCHAR2(45),
telefono_vendedor VARCHAR2(45),
email_vendedor VARCHAR2(45),
fecha_nacimiento DATE,
fecha_ingreso DATE, 
genero CHAR,
curp VARCHAR2(45),
rfc VARCHAR2(45),
CONSTRAINT Vendedor PRIMARY KEY(id_vendedor)
CONSTRAINT FK_Tienda FOREIGN KEY(id_tienda) REFERENCES Tienda (id_tienda)
);
