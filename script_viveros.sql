DROP SCHEMA public CASCADE;
CREATE SCHEMA public;


DROP TABLE IF EXISTS Vivero;
DROP TABLE IF EXISTS Zona;
DROP TABLE IF EXISTS Caja;
DROP TABLE IF EXISTS Almacen;
DROP TABLE IF EXISTS Zona_exterior;
DROP TABLE IF EXISTS Contiene;
DROP TABLE IF EXISTS Compra;
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Fidelizado;
DROP TABLE IF EXISTS No_fidelizado;
DROP TABLE IF EXISTS Producto;


/* Definición de las tablas de nuestro modelo */

CREATE TABLE Producto(
  Producto_id INT NOT NULL,
  Nombre VARCHAR(255),
  PRIMARY KEY (Producto_id)
);

CREATE TABLE Vivero(
  Vivero_id INT NOT NULL, 
  PRIMARY KEY (Vivero_id)
);

CREATE TABLE Empleado(
  Empleado_id INT NOT NULL,
  Nombre VARCHAR(255),
  Objetivos_venta INT,
  Control_pedidos INT,
  PRIMARY KEY (Empleado_id)
);

CREATE TABLE Zona(
  Zona_id INT NOT NULL,
  PRIMARY KEY (Zona_id),
  Unidades_producto INT,
  Productividad INT,
  Tipo varchar(255),
  Viv_id INT,
  Emp_id INT,
  FOREIGN KEY(Viv_id) REFERENCES Vivero(Vivero_id),
  FOREIGN KEY(Emp_id) REFERENCES Empleado(Empleado_id) ON DELETE CASCADE
);

CREATE TABLE Caja(
  Caja_id INT NOT NULL,
  PRIMARY KEY (Caja_id),
  Zona_id INT,
  FOREIGN KEY (Zona_id) REFERENCES Zona(Zona_id) ON DELETE CASCADE
);

CREATE TABLE Almacen(
  Almacen_id INT NOT NULL,
  PRIMARY KEY (Almacen_id),
  Zona_id INT,
  FOREIGN KEY (Zona_id) REFERENCES Zona(Zona_id) ON DELETE CASCADE
);

CREATE TABLE Zona_exterior(
  Ext_id INT NOT NULL,
  PRIMARY KEY (Ext_id),
  Zona_id INT, 
  FOREIGN KEY (Zona_id) REFERENCES Zona(Zona_id) ON DELETE CASCADE
);

CREATE TABLE Contiene(
Zona_id INT, 
Producto_id INT,
FOREIGN KEY (Zona_id) REFERENCES Zona(Zona_id) ON DELETE CASCADE,
FOREIGN KEY (Producto_id) REFERENCES Producto(Producto_id) ON DELETE CASCADE
);

CREATE TABLE Cliente(
  Dni INT NOT NULL,
  PRIMARY KEY (Dni),
  Nombre varchar(255), 
  Tipo varchar(255)
  );

CREATE TABLE Compra(
  Compra_id INT NOT NULL,
  PRIMARY KEY (Compra_id),
  Dni_cliente INT, 
  FOREIGN KEY (Dni_cliente) REFERENCES Cliente(Dni)
);

CREATE TABLE Posee(
Compra_id INT, 
Producto_id INT,
Empleado_id INT,
FOREIGN KEY (Compra_id) REFERENCES Compra(Compra_id),
FOREIGN KEY (Producto_id) REFERENCES Producto(Producto_id),
FOREIGN KEY (Empleado_id) REFERENCES Empleado(Empleado_id)
);

CREATE TABLE Fidelizado(
  num_compras INT,
  bonificacion varchar(255),
  Dni_cliente INT, 
  FOREIGN KEY (Dni_cliente) REFERENCES Cliente(Dni)
);

CREATE TABLE No_fidelizado(
  Dni_cliente INT, 
  FOREIGN KEY (Dni_cliente) REFERENCES Cliente(Dni)
);


/* Inserciones en las tablas */

INSERT INTO Producto (Producto_id, Nombre)
VALUES (123, 'Pala');

INSERT INTO Producto (Producto_id, Nombre)
VALUES (122, 'Geranio');

INSERT INTO Producto (Producto_id, Nombre)
VALUES (124, 'Maceta');

INSERT INTO Producto (Producto_id, Nombre)
VALUES (111, 'Rosa');

INSERT INTO Producto (Producto_id, Nombre)
VALUES (121, 'Florero');

INSERT INTO Vivero(Vivero_id)
VALUES (1);

INSERT INTO Vivero(Vivero_id)
VALUES (2);

INSERT INTO Vivero(Vivero_id)
VALUES (3);

INSERT INTO Vivero(Vivero_id)
VALUES (4);

INSERT INTO Vivero(Vivero_id)
VALUES (5);

INSERT INTO Empleado (Empleado_id, Nombre, Objetivos_venta, Control_pedidos)
VALUES (123, 'Juan Perez', 10, 5);

INSERT INTO Empleado (Empleado_id, Nombre, Objetivos_venta, Control_pedidos)
VALUES (122, 'Antonio Ramirez', 14, 7);

INSERT INTO Empleado (Empleado_id, Nombre, Objetivos_venta, Control_pedidos)
VALUES (134, 'Maria Benitez', 20, 8);

INSERT INTO Empleado (Empleado_id, Nombre, Objetivos_venta, Control_pedidos)
VALUES (111, 'Diego Diaz', 11, 2);

INSERT INTO Empleado (Empleado_id, Nombre, Objetivos_venta, Control_pedidos)
VALUES (213, 'Fabrizzio Perilli', 13, 9);

INSERT INTO Zona (Zona_id, Unidades_producto, Productividad, Tipo, Viv_id, Emp_id)
VALUES (1, 23, 10, 'Caja', 1, 123);

INSERT INTO Zona (Zona_id, Unidades_producto, Productividad, Tipo, Viv_id, Emp_id)
VALUES (2, 31, 45, 'Almacen', 2, 134);

INSERT INTO Zona (Zona_id, Unidades_producto, Productividad, Tipo, Viv_id, Emp_id)
VALUES (3, 13, 22, 'Exterior', 3, 111);

INSERT INTO Zona (Zona_id, Unidades_producto, Productividad, Tipo, Viv_id, Emp_id)
VALUES (4, 56, 16, 'Caja', 4, 213);

INSERT INTO Zona (Zona_id, Unidades_producto, Productividad, Tipo, Viv_id, Emp_id)
VALUES (5, 32, 3, 'Exterior', 5, 122);

INSERT INTO Caja(Caja_id, Zona_id)
VALUES (1, 1);

INSERT INTO Caja(Caja_id, Zona_id)
VALUES (2, 4);

INSERT INTO Almacen(Almacen_id, Zona_id)
VALUES (3, 2);

INSERT INTO Zona_exterior(Ext_id, Zona_id)
VALUES (1, 3);

INSERT INTO Zona_exterior(Ext_id, Zona_id)
VALUES (2, 5);

INSERT INTO Contiene(Zona_id, Producto_id)
VALUES (1, 123);

INSERT INTO Contiene(Zona_id, Producto_id)
VALUES (2, 122);

INSERT INTO Contiene(Zona_id, Producto_id)
VALUES (3, 124);

INSERT INTO Contiene(Zona_id, Producto_id)
VALUES (4, 111);

INSERT INTO Contiene(Zona_id, Producto_id)
VALUES (5, 121);

INSERT INTO Cliente(Dni, Nombre, Tipo)
VALUES (1, 'Antonio', 'Fidelizado');

INSERT INTO Cliente(Dni, Nombre, Tipo)
VALUES (2, 'Juan', 'No fidelizado');

INSERT INTO Cliente(Dni, Nombre, Tipo)
VALUES (3, 'Pedro', 'Fidelizado');

INSERT INTO Cliente(Dni, Nombre, Tipo)
VALUES (4, 'Andrea', 'No fidelizado');

INSERT INTO Cliente(Dni, Nombre, Tipo)
VALUES (5, 'Lucia', 'Fidelizado');

INSERT INTO Compra(Compra_id, Dni_cliente)
VALUES (1, 1);

INSERT INTO Compra(Compra_id, Dni_cliente)
VALUES (2, 2);

INSERT INTO Compra(Compra_id, Dni_cliente)
VALUES (3, 3);

INSERT INTO Compra(Compra_id, Dni_cliente)
VALUES (4, 4);

INSERT INTO Compra(Compra_id, Dni_cliente)
VALUES (5, 5);

INSERT INTO Posee(Compra_id, Producto_id, Empleado_id)
VALUES (1, 123, 123);

INSERT INTO Posee(Compra_id, Producto_id, Empleado_id)
VALUES (2, 122, 122);

INSERT INTO Posee(Compra_id, Producto_id, Empleado_id)
VALUES (3, 123, 134);

INSERT INTO Posee(Compra_id, Producto_id, Empleado_id)
VALUES (4, 111, 111);

INSERT INTO Posee(Compra_id, Producto_id, Empleado_id)
VALUES (5, 121, 213);

INSERT INTO Fidelizado(num_compras, bonificacion, Dni_cliente)
VALUES (34, '20%', 1);

INSERT INTO Fidelizado(num_compras, bonificacion, Dni_cliente)
VALUES (45, '30%', 3);

INSERT INTO Fidelizado(num_compras, bonificacion, Dni_cliente)
VALUES (65, '40%', 5);

INSERT INTO No_fidelizado(Dni_cliente)
VALUES (2);

INSERT INTO No_fidelizado(Dni_cliente)
VALUES (4);


/* Pruebas */

