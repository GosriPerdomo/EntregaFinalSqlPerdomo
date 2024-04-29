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

