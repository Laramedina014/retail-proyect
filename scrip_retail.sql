CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    edad INTEGER NOT NULL,
    telefono VARCHAR(20),
    fecha_alta DATE DEFAULT CURRENT_DATE,
    CONSTRAINT check_cliente_edad CHECK (edad >= 16)
);

CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INTEGER NOT NULL DEFAULT 0,
	
	CONSTRAINT check_producto_precio CHECK (precio > 0),
    CONSTRAINT check_producto_stock CHECK (stock >= 0)
);

CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT fk_ventas_cliente FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente) ON DELETE RESTRICT,
    CONSTRAINT fk_ventas_producto FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto) ON DELETE RESTRICT,
    CONSTRAINT check_venta_cantidad CHECK (cantidad > 0)
);


BEGIN;

INSERT INTO clientes (nombre, email, edad, telefono) VALUES
    ('Lara Medina', 'lara.medina@gmail.com', 21, '+5491145678901'),
    ('Sofia Rial', 'sofia.rial@gmail.com', 21, '+5491156789012'),
    ('Tiziana Deliso', 'tiziana.deliso@gmail.com', 22, '+5491167890123'),
    ('Josefina Herrera', 'josefina.herrera@gmail.com', 23, '+5491178901234'),
    ('Bianca Vinuales', 'bianca.vinuales@gmail.com', 22, '+5491189012345');

INSERT INTO productos (nombre, categoria, precio, stock) VALUES
    ('Jean negro', 'Demin', 25.50, 40),
    ('Jean azul clasic', 'Demin', 75.00, 25),
    ('Campera de cuero negra', 'Campera', 180.00, 15),
    ('Campera de cuero marron', 'Campera', 240.00, 8),
    ('Botas caña alta negras', 'Botas', 110.00, 20);

INSERT INTO ventas (id_cliente, id_producto, cantidad, fecha_venta) VALUES
    (1, 1, 2, '2026-11-10 10:30:00'),
    (2, 2, 1, '2026-11-11 14:15:00'),
    (3, 3, 1, '2026-11-12 16:45:00'),
    (4, 4, 1, '2026-11-13 11:20:00'),
    (5, 5, 2, '2026-11-14 18:00:00');

COMMIT;

UPDATE productos
SET precio = ROUND(precio * 1.10, 2)
WHERE categoria = 'Demin';

DELETE FROM ventas
WHERE id_venta = 5;

SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;
