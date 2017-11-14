--Crea tabla oferta
CREATE TABLE Oferta(
id_oferta NUMBER(5),
id_producto NUMBER (5)NOT NULL,
nuevo_precio NUMBER (5)NOT NULL,
CONSTRAINT PK_Oferta PRIMARY KEY(id_oferta)
);

-- Creacion de la tabla Producto --
CREATE TABLE Producto(
id_producto NUMBER(5),
id_oferta NUMBER (5),
nombre VARCHAR2(45) NOT NULL,
marca VARCHAR2(45) NOT NULL,
ubicacion VARCHAR2(45) NOT NULL,
descripcion VARCHAR2(45) NOT NULL,
precio NUMBER(5) NOT NULL,
CONSTRAINT PK_Producto PRIMARY KEY(id_Producto),
CONSTRAINT FK_Oferta FOREIGN KEY(id_oferta) REFERENCES oferta(id_oferta)
);

-- Creacion de la tabla Inventario --
CREATE TABLE Inventario(
id_producto NUMBER(5) NOT NULL,
cantidad NUMBER(5) NOT NULL,
CONSTRAINT FK FOREIGN KEY(id_producto) REFERENCES producto(id_producto)
);

-- Creacion de la tabla Tienda --
CREATE TABLE Tienda (
id_tienda NUMBER(5),
direccion_tienda VARCHAR2(45),
telefono_tienda VARCHAR2(45) NOT NULL,
CONSTRAINT PK_Tienda PRIMARY KEY(id_tienda)
);

-- Creacion de la tabla Vendedor --
CREATE TABLE Vendedor(
id_vendedor NUMBER(5),
id_tienda NUMBER(5) NOT NULL,
nombre_vendedor VARCHAR2(45) NOT NULL,
apellido_paterno_vendedor VARCHAR2(45) NOT NULL,
apellido_materno_vendedor VARCHAR2(45) NOT NULL,
direccion_vendedor VARCHAR2(45) NOT NULL,
telefono_vendedor VARCHAR2(45) NOT NULL,
email_vendedor VARCHAR2(45) NOT NULL,
fecha_nacimiento DATE NOT NULL,
fecha_ingreso DATE NOT NULL, 
genero CHAR,
curp VARCHAR2(45) UNIQUE NOT NULL,
rfc VARCHAR2(45) UNIQUE NOT NULL,
CONSTRAINT Vendedor PRIMARY KEY(id_vendedor),
CONSTRAINT FK_Tienda FOREIGN KEY(id_tienda) REFERENCES Tienda(id_tienda)
);

-- Creacion de la tabla Clientes --
CREATE TABLE Clientes(
id_cliente NUMBER(5),
nombre VARCHAR2(45) NOT NULL,
apellido_paterno VARCHAR2(45),
apellido_materno VARCHAR2(45),
direccion VARCHAR2(45) NOT NULL,
telefono VARCHAR2(45) NOT NULL,
email VARCHAR2(45) NOT NULL,
rfc VARCHAR2(45) UNIQUE NOT NULL,
CONSTRAINT PK_Clientes PRIMARY KEY(id_cliente)
);

-- Creacion de la tabla Venta --
CREATE TABLE Venta(
id_ticket NUMBER(5),
id_cliente NUMBER (5) NOT NULL,
id_vendedor NUMBER (5) NOT NULL,
fecha_venta DATE NOT NULL,
tipo_pago VARCHAR2(45) DEFAULT('tarjeta'),
tipo_servicio VARCHAR2(45) DEFAULT('domicilio'),
total_venta NUMBER(10,2) NOT NULL,
CONSTRAINT PK_Venta PRIMARY KEY(id_ticket),
CONSTRAINT FK_CLIENTE FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
CONSTRAINT FK_VENDEDOR FOREIGN KEY(id_vendedor) REFERENCES vendedor(id_vendedor)
);

-- Creacion de la tabla VentaDetalle --
CREATE TABLE VentaDetalle(
id_ventaDetalle NUMBER(5),
id_ticket NUMBER (5) NOT NULL,
id_producto NUMBER(5) NOT NULL,
cantidad NUMBER (10) NOT NULL,
total NUMBER(10,2) NOT NULL,
CONSTRAINT PK_VentaDetalle PRIMARY KEY(id_ventaDetalle),
CONSTRAINT FK_Producto FOREIGN KEY(id_Producto) REFERENCES producto (id_producto),
CONSTRAINT FK_Venta FOREIGN KEY(id_ticket) REFERENCES venta(id_ticket)
);

-- Creacion de la tabla Facturas --
CREATE TABLE Facturas(
id_factura NUMBER(5),
id_cliente NUMBER (5) NOT NULL,
id_ticket NUMBER(5) NOT NULL,
fecha DATE NOT NULL,
CONSTRAINT PK_Facturas PRIMARY KEY(id_factura),
CONSTRAINT FK_Cliente_fac FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
CONSTRAINT FK_Venta_fac FOREIGN KEY(id_ticket) REFERENCES venta(id_ticket)
);
