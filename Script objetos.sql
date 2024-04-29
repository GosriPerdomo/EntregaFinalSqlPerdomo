USE hechoencasa;

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
END//