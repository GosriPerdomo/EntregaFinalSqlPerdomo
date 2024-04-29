CREATE DATABASE IF NOT EXISTS hechoencasa;
USE hechoencasa;
-- creo la tabla para guardar los productos
CREATE TABLE Productos (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Precio INT NOT NULL,
    Stock INT NOT NULL
);
-- creo la tabla para guardar los clientes
CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
	Direccion VARCHAR(255),
    Email VARCHAR(100),
    Telefono VARCHAR(20)
);
-- creo la tabla de pedidos
CREATE TABLE Pedidos (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
	ClienteID INT NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
 -- creo la tabla sobre los detalles de pedido
CREATE TABLE DetallePedido (
    DetalleID INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID INT,
    ProductoID INT,
    Cantidad INT NOT NULL,
    Precio INT NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);
-- creo la tabla sobre los materiales
CREATE TABLE Materiales (
    MaterialID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Stock INT NOT NULL
);
-- creo la tabla sobre los proveedores
CREATE TABLE Proveedores (
    ProveedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255),
    Telefono VARCHAR(20)
);
-- creo la tabla TipoProducto
CREATE TABLE TipoProducto (
    TipoProductoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT
);
-- creo la tabla de los envios
CREATE TABLE Envios (
    EnvioID INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID INT,
    FechaEnvio DATE,
    DireccionEnvio VARCHAR(255),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID)
);

-- creo la tabla sobre los eventos(encarges)
CREATE TABLE Eventos (
    EventoID INT AUTO_INCREMENT PRIMARY KEY,
    NombreEvento VARCHAR(100) NOT NULL,
    FechaEvento DATE
);
-- creo la tabla con los detalles del evento
CREATE TABLE EventosDetalle (
    EventoDetalleID INT AUTO_INCREMENT PRIMARY KEY,
    EventoID INT,
    TipoProductoID INT,
    Cantidad INT,
    FOREIGN KEY (EventoID) REFERENCES Eventos(EventoID),
    FOREIGN KEY (TipoProductoID) REFERENCES TipoProducto(TipoProductoID)
);
-- aqui utilizo el alter table para a;adir la nueva columna que vincula TipoProducto(nueva tabla) a la tabla (productos)
ALTER TABLE Productos
ADD COLUMN TipoProductoID INT,
ADD FOREIGN KEY (TipoProductoID) REFERENCES TipoProducto(TipoProductoID);
