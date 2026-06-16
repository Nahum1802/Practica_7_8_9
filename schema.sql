-- ==========================================
-- ESQUEMA DE BASE DE DATOS: REFACCIONARIA
-- ==========================================

-- 1. TABLA MARCA (10 tuplas)
CREATE TABLE MARCA (
    id_marca SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    pais_origen VARCHAR(50)
);

INSERT INTO MARCA (nombre, pais_origen) VALUES
('Brembo', 'Italia'), ('Monroe', 'USA'), ('Bosch', 'Alemania'), ('NGK', 'Japón'), ('Castrol', 'Reino Unido'),
('Michelin', 'Francia'), ('Hella', 'Alemania'), ('LUK', 'Alemania'), ('Wagner', 'USA'), ('Gondher', 'México');

-- 2. TABLA PROVEEDOR (5 tuplas)
CREATE TABLE PROVEEDOR (
    id_proveedor SERIAL PRIMARY KEY,
    nombre_empresa VARCHAR(100) NOT NULL,
    contacto VARCHAR(50),
    telefono VARCHAR(15)
);

INSERT INTO PROVEEDOR (nombre_empresa, contacto, telefono) VALUES
('AutoPartes Mayoristas SA', 'Roberto Salas', '5511223344'),
('Distribuidora del Norte', 'Laura Vega', '8112345678'),
('Frenos y Balatas del Centro', 'Mario López', '3312345678'),
('Lubricantes Nacionales', 'Carlos Ruíz', '5599887766'),
('Eléctrica Automotriz MX', 'Ana Silva', '5544332211');

-- 3. TABLA CATEGORIA (10 tuplas)
CREATE TABLE CATEGORIA (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    fecha_creacion DATE,
    estatus VARCHAR(20)
);

INSERT INTO CATEGORIA (nombre, descripcion, fecha_creacion, estatus) VALUES
('Frenos', 'Balatas, discos y tambores', '2026-01-01', 'Activo'),
('Suspensión', 'Amortiguadores y horquillas', '2026-01-01', 'Activo'),
('Motor', 'Filtros, bandas y bujías', '2026-01-05', 'Activo'),
('Eléctrico', 'Baterías y fusibles', '2026-01-05', 'Activo'),
('Iluminación', 'Faros y focos LED', '2026-01-10', 'Activo'),
('Enfriamiento', 'Radiadores y anticongelante', '2026-02-01', 'Activo'),
('Transmisión', 'Aceites y clutch', '2026-02-15', 'Activo'),
('Escape', 'Mofles y catalizadores', '2026-03-01', 'Inactivo'),
('Accesorios', 'Tapetes y fundas', '2026-03-20', 'Activo'),
('Llantas', 'Neumáticos todas las medidas', '2026-04-01', 'Activo');

-- 4. TABLA PRODUCTO (20 tuplas)
CREATE TABLE PRODUCTO (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio NUMERIC(10,2) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT REFERENCES CATEGORIA(id_categoria),
    id_marca INT REFERENCES MARCA(id_marca),
    id_proveedor INT REFERENCES PROVEEDOR(id_proveedor)
);

INSERT INTO PRODUCTO (nombre, descripcion, precio, stock, id_categoria, id_marca, id_proveedor) VALUES
('Balatas Delanteras', 'Juego de balatas cerámicas', 850.00, 25, 1, 1, 3),
('Disco de Freno', 'Disco ventilado estándar', 600.00, 15, 1, 1, 3),
('Amortiguador Trasero', 'Amortiguador de gas', 1200.00, 10, 2, 2, 1),
('Filtro de Aceite', 'Filtro sintético', 150.00, 50, 3, 3, 1),
('Bujía Iridio', 'Bujía larga duración', 220.00, 100, 3, 4, 1),
('Batería 12V', 'Batería 700 Amperes', 2500.00, 8, 4, 10, 5),
('Foco H4 LED', 'Par de focos blancos', 450.00, 30, 5, 7, 5),
('Anticongelante', 'Garrafa 5L verde', 280.00, 40, 6, 5, 4),
('Aceite Sintético', 'Garrafa 5L 5W-30', 950.00, 20, 7, 5, 4),
('Limpiaparabrisas', 'Par plumas 22 pulg', 180.00, 60, 9, 3, 2),
('Balatas Traseras', 'Juego balatas semimetálicas', 550.00, 20, 1, 9, 3),
('Tambor de Freno', 'Tambor trasero estándar', 750.00, 12, 1, 1, 3),
('Filtro de Aire', 'Filtro de motor alto flujo', 200.00, 45, 3, 3, 1),
('Kit de Clutch', 'Plato, disco y collarín', 3200.00, 5, 7, 8, 2),
('Amortiguador Delantero', 'Amortiguador hidráulico', 1100.00, 14, 2, 2, 1),
('Llanta 205/55 R16', 'Llanta radial toda estación', 1800.00, 40, 10, 6, 2),
('Bomba de Agua', 'Bomba de refrigerante', 850.00, 15, 6, 3, 1),
('Alternador 90A', 'Alternador remanufacturado', 3500.00, 4, 4, 3, 5),
('Filtro de Gasolina', 'Filtro de línea', 120.00, 55, 3, 3, 1),
('Sensor de Oxígeno', 'Sensor universal 4 cables', 900.00, 18, 4, 3, 5);

-- 5. TABLA USUARIO (10 tuplas)
CREATE TABLE USUARIO (
    id_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    fecha_registro DATE
);

INSERT INTO USUARIO (nombre, apellido, email, telefono, fecha_registro) VALUES
('Carlos', 'Ramirez', 'carlos.r@mail.com', '5512345678', '2026-01-10'),
('Maria', 'Gomez', 'mgomez@mail.com', '5587654321', '2026-01-15'),
('Juan', 'Perez', 'jperez@mail.com', '5533221144', '2026-02-01'),
('Ana', 'Lopez', 'alopez@mail.com', '5599887766', '2026-02-20'),
('Luis', 'Torres', 'luis.t@mail.com', '5544332211', '2026-03-05'),
('Diana', 'Flores', 'dflores@mail.com', '5566778899', '2026-03-12'),
('Jorge', 'Sanchez', 'jsanchez@mail.com', '5522334455', '2026-04-01'),
('Rosa', 'Diaz', 'rdiaz@mail.com', '5577889900', '2026-04-18'),
('Miguel', 'Miranda', 'mmiranda@mail.com', '5511223344', '2026-05-10'),
('Sofia', 'Castro', 'scastro@mail.com', '5500998877', '2026-06-01');

-- 6. TABLA PEDIDO (20 tuplas)
CREATE TABLE PEDIDO (
    id_pedido SERIAL PRIMARY KEY,
    fecha_pedido DATE NOT NULL,
    total NUMERIC(10,2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    metodo_pago VARCHAR(20) NOT NULL,
    id_usuario INT REFERENCES USUARIO(id_usuario)
);

INSERT INTO PEDIDO (fecha_pedido, total, estado, metodo_pago, id_usuario) VALUES
('2026-06-01', 1000.00, 'Entregado', 'Tarjeta', 1),
('2026-06-02', 2500.00, 'Procesando', 'Efectivo', 2),
('2026-06-03', 450.00, 'Entregado', 'Tarjeta', 3),
('2026-06-05', 3400.00, 'Enviado', 'Transferencia', 4),
('2026-06-08', 150.00, 'Entregado', 'Efectivo', 1),
('2026-06-10', 1200.00, 'Procesando', 'Tarjeta', 5),
('2026-06-11', 880.00, 'Enviado', 'Transferencia', 6),
('2026-06-12', 950.00, 'Pendiente', 'Tarjeta', 7),
('2026-06-14', 180.00, 'Entregado', 'Efectivo', 9),
('2026-06-15', 280.00, 'Procesando', 'Tarjeta', 10),
('2026-06-15', 3200.00, 'Pendiente', 'Transferencia', 3),
('2026-06-16', 550.00, 'Pendiente', 'Tarjeta', 5),
('2026-06-16', 1800.00, 'Procesando', 'Tarjeta', 2),
('2026-06-16', 900.00, 'Procesando', 'Efectivo', 8),
('2026-06-16', 1100.00, 'Enviado', 'Transferencia', 1),
('2026-06-16', 200.00, 'Pendiente', 'Efectivo', 4),
('2026-06-16', 850.00, 'Entregado', 'Tarjeta', 6),
('2026-06-16', 120.00, 'Procesando', 'Efectivo', 7),
('2026-06-16', 3500.00, 'Enviado', 'Transferencia', 9),
('2026-06-16', 450.00, 'Entregado', 'Tarjeta', 10);

-- 7. TABLA DETALLE_PEDIDO (30 tuplas)
CREATE TABLE DETALLE_PEDIDO (
    id_detalle SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES PEDIDO(id_pedido),
    id_producto INT REFERENCES PRODUCTO(id_producto),
    cantidad INT NOT NULL,
    precio_unitario NUMERIC(10,2) NOT NULL,
    subtotal NUMERIC(10,2) NOT NULL
);

INSERT INTO DETALLE_PEDIDO (id_pedido, id_producto, cantidad, precio_unitario, subtotal) VALUES
(1, 1, 1, 850.00, 850.00), (1, 4, 1, 150.00, 150.00), (2, 6, 1, 2500.00, 2500.00),
(3, 7, 1, 450.00, 450.00), (4, 3, 2, 1200.00, 2400.00), (4, 9, 1, 950.00, 950.00),
(5, 4, 1, 150.00, 150.00), (6, 3, 1, 1200.00, 1200.00), (7, 5, 4, 220.00, 880.00),
(8, 9, 1, 950.00, 950.00), (9, 10, 1, 180.00, 180.00), (10, 8, 1, 280.00, 280.00),
(11, 14, 1, 3200.00, 3200.00), (12, 11, 1, 550.00, 550.00), (13, 16, 1, 1800.00, 1800.00),
(14, 20, 1, 900.00, 900.00), (15, 15, 1, 1100.00, 1100.00), (16, 13, 1, 200.00, 200.00),
(17, 17, 1, 850.00, 850.00), (18, 19, 1, 120.00, 120.00), (19, 18, 1, 3500.00, 3500.00),
(20, 7, 1, 450.00, 450.00), (2, 10, 1, 180.00, 180.00), (4, 13, 1, 200.00, 200.00),
(1, 19, 1, 120.00, 120.00), (3, 8, 1, 280.00, 280.00), (7, 13, 2, 200.00, 400.00),
(15, 1, 1, 850.00, 850.00), (19, 5, 2, 220.00, 440.00), (8, 4, 1, 150.00, 150.00);

-- 8. TABLA RESEÑA (10 tuplas)
CREATE TABLE RESENA (
    id_resena SERIAL PRIMARY KEY,
    id_producto INT REFERENCES PRODUCTO(id_producto),
    id_usuario INT REFERENCES USUARIO(id_usuario),
    calificacion INT CHECK (calificacion BETWEEN 1 AND 5),
    comentario TEXT,
    fecha_resena DATE
);

INSERT INTO RESENA (id_producto, id_usuario, calificacion, comentario, fecha_resena) VALUES
(1, 1, 5, 'Excelente frenado, no rechinan.', '2026-06-05'),
(6, 2, 4, 'Buena batería, pero algo cara.', '2026-06-06'),
(7, 3, 5, 'Iluminan súper bien de noche.', '2026-06-08'),
(3, 4, 3, 'Quedaron un poco rígidos.', '2026-06-10'),
(4, 1, 5, 'Filtro original, buen precio.', '2026-06-12'),
(9, 7, 5, 'Excelente viscosidad, el motor suena suave.', '2026-06-14'),
(10, 9, 4, 'Limpian bien, falta ver cuánto duran.', '2026-06-15'),
(5, 6, 5, 'Mi carro recuperó potencia.', '2026-06-16'),
(8, 10, 5, 'Buen anticongelante, no se evapora.', '2026-06-16'),
(14, 3, 5, 'Corta excelente el clutch, muy suave.', '2026-06-16');