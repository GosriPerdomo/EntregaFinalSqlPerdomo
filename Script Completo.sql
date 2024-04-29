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

INSERT INTO 
hechoencasa.TipoProducto (TipoProductoID,Nombre, Descripcion) 
VALUES
(null,'lapiceras','Lapiceras de resina epoxy con multiples opciones de colores y materiales'),
(null,'MarcaPaginas','MarcaPaginas de resina epoxy con multiples opciones de colores y materiales'),
(null,'Ceniceros','Ceniceros de resina con disintos diseños'),
(null,'Llaveros','Llaveros de resina con distintos diseños y materiales, tambien con opcion personificables para eventos'),
(null,'Combos Lapicera y MarcaPaginas','tu combo favorito Lapicera y Marca paginas');

INSERT INTO 
hechoencasa.productos (ProductoID,Nombre,Precio,Stock,TipoProductoID)
VALUES
(NULL, 'Lapicera', 350, 20,1),
(NULL, 'MarcaPaginas', 200, 20,2),
(NULL, 'Lapicera Y Marca Paginas', 500, 20,5),
(NULL, 'Llavero Patita', 200, 15,4),
(NULL, 'Cenicero naranjas', 500, 20,3),
(NULL, 'Cenicero Patita', 500, 17,3),
(NULL, 'Cenicero Beer', 500, 14,3);

INSERT INTO 
hechoencasa.Clientes(Clienteid,Nombre,Direccion,Email,Telefono)
VALUES
(NULL, 'Haydon','20 Lerdahl Plaza', 'hgoldsbury0@java.com', '+380 689 174 9576'),
(NULL, 'Jody','6789 Bashford Avenue', 'jrickaby1@princeton.edu', '+1 997 951 0002'),
(NULL, 'Shurlock','1865 Eggendart Parkway', 'sjeromson2@nytimes.com', '+976 642 616 0547'),
(NULL, 'Hamilton','402 Glendale Lane', 'hdraude3@dropbox.com', '+63 175 570 0372'),
(NULL, 'Fons', '53 Portage Circle','fkield4@sun.com', '+48 116 747 3700'),
(NULL, 'Rheta','87 Melody Court', 'rwrangle5@360.cn', '+52 156 661 9562');

INSERT INTO hechoencasa.Pedidos (Fecha, ClienteID)
VALUES
('2024-03-06', 1), 
('2024-03-07', 2), 
('2024-03-08', 3), 
('2024-04-15', 4), 
('2024-04-20', 5), 
('2024-04-21', 6);

INSERT INTO hechoencasa.DetallePedido (DetalleID,PedidoID, ProductoID, Cantidad, Precio)
VALUES
(NULL,1, 1, 3, 1050),
(NULL,2, 2, 2, 400), 
(NULL,3, 3, 4, 2000),
(NULL,4, 1, 3, 1050),
(NULL,5, 2, 2, 400), 
(NULL,6, 3, 4, 2000);

INSERT INTO 
hechoencasa.materiales(MaterialID,nombre,Stock)
VALUES
(NULL,'colores en polvo','5 '),
(NULL,'colores al alcohol','10 '),
(NULL,'pitones','70'),
(NULL,'Llaveritos','70'),
(NULL,'Flores Secas','6 '),
(NULL,'Resina catalizadora','200');

INSERT INTO
hechoencasa.proveedores(ProveedorID,Nombre,Direccion,Telefono)
VALUES
(NULL,'Insumos Artesanos','Daniel Fernández Crespo 1994','095736219'),
(NULL,'La Casa Del Artesano','Av. 18 de Julio 2271','091246865'),
(NULL,'Monrago','SoloEnvio','099431695');

INSERT INTO hechoencasa.Envios (EnvioID,PedidoID,FechaEnvio,DireccionEnvio)
VALUES
(NULL, 1, '2024-03-08', '20 Lerdahl Plaza'), 
(NULL, 2, '2024-03-08', '6789 Bashford Avenue'), 
(NULL, 3, '2024-03-10', '1865 Eggendart Parkway'), 
(NULL, 4, '2024-04-17', '402 Glendale Lane'), 
(NULL, 5, '2024-04-22', '53 Portage Circle'), 
(NULL, 6, '2024-04-22', '87 Melody Court');

INSERT INTO
hechoencasa.Eventos(EventoID,NombreEvento,FechaEvento)
VALUES
(NULL,'CasamientoRomina','2024-05-07'),
(NULL,'CumpleañosBenja','2024-05-21'),
(NULL,'CumpleañosMartina','2024-06-10');

-- aclaro que las cantidades de estos encarges no se ven relacionadas al stock original ya que son encargos 
INSERT INTO hechoencasa.EventosDetalle(EventoDetalleID,EventoID,TipoProductoID,Cantidad)
VALUES
(NULL,1,4,50),
(NULL,2,4,25),
(NULL,3,4,70);

-- VIstas

CREATE VIEW eventosproximos as
SELECT E.NombreEvento,E.FechaEvento,ED.TipoProductoID,ED.Cantidad
FROM Eventos E
JOIN EventosDetalle ED ON E.EventoID = ED.EventoID
WHERE E.FechaEvento BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 15 DAY);

CREATE VIEW ClientesConCantidadPedidos AS
SELECT c.ClienteID, c.Nombre, c.Email, c.Telefono, COUNT(p.PedidoID) AS CantidadPedidos
FROM Clientes c
LEFT JOIN Pedidos p ON c.ClienteID = p.ClienteID
GROUP BY c.ClienteID;

CREATE VIEW ProductosAgotados AS
SELECT *
FROM Productos
WHERE Stock = 0;

CREATE VIEW ProductosMasVendidos AS
SELECT p.ProductoID, p.Nombre, SUM(dp.Cantidad) AS TotalVendido
FROM Productos p
JOIN DetallePedido dp ON p.ProductoID = dp.ProductoID
GROUP BY p.ProductoID
ORDER BY TotalVendido DESC;

CREATE VIEW ClientesPedidosRecientes AS
SELECT c.ClienteID, c.Nombre AS NombreCliente, p.PedidoID, p.Fecha AS FechaPedido
FROM Clientes c
JOIN Pedidos p ON c.ClienteID = p.ClienteID
WHERE p.Fecha >= CURRENT_DATE - INTERVAL 7 DAY; 


-- Funciones 

DELIMITER //
CREATE FUNCTION TotalPedidosCliente(ClienteID INT) RETURNS INT
deterministic
BEGIN
    DECLARE cantidad_pedidos INT;
    SELECT COUNT(*) INTO cantidad_pedidos FROM Pedidos p WHERE p.ClienteID = ClienteID;
    RETURN cantidad_pedidos;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION CalcularTotalPedido(PedidoID INT) RETURNS INT
deterministic
BEGIN
    DECLARE total INT;
    SELECT SUM(Precio * Cantidad) INTO total
    FROM DetallePedido WHERE PedidoID = PedidoID;
    RETURN total;
END //
DELIMITER ;


--Procedimientos
DELIMITER //
CREATE PROCEDURE ActualizarStock(IN ProductoID INT, IN Cantidad INT)
deterministic
BEGIN
    UPDATE Productos SET Stock = Stock - Cantidad WHERE ProductoID = ProductoID;
END //;


DELIMITER //
CREATE PROCEDURE AgregarProducto(
    IN NombreProducto VARCHAR(100),
    IN PrecioProducto INT,
    IN StockProducto INT
)
deterministic
BEGIN
    INSERT INTO Productos (Nombre, Precio, Stock) VALUES (NombreProducto, PrecioProducto, StockProducto);
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE EliminarProducto(IN ProductoID INT)
deterministic
BEGIN
    DELETE FROM DetallePedido WHERE ProductoID = ProductoID;
    DELETE FROM Productos WHERE ProductoID = ProductoID;
END //
DELIMITER ;

--Triggers
DELIMITER //

CREATE TRIGGER ActualizarStockDespuesVenta
AFTER INSERT ON DetallePedido
FOR EACH ROW

BEGIN
    UPDATE Productos
    SET Stock = Stock - NEW.Cantidad
    WHERE ProductoID = NEW.ProductoID;
END//

DELIMITER //

CREATE TRIGGER RegistroFechaPedido
BEFORE INSERT ON Pedidos
FOR EACH ROW
BEGIN
    SET NEW.Fecha = NOW();
END;