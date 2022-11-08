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
  FOREIGN KEY(Emp_id) REFERENCES Empleado(Empleado_id)
);

CREATE TABLE Caja(
  Caja_id INT NOT NULL,
  PRIMARY KEY (Caja_id),
  Zona_id INT,
  FOREIGN KEY (Zona_id) REFERENCES Zona(Zona_id) 
);

CREATE TABLE Almacen(
  Almacen_id INT NOT NULL,
  PRIMARY KEY (Almacen_id),
  Zona_id INT,
  FOREIGN KEY (Zona_id) REFERENCES Zona(Zona_id)
);

CREATE TABLE Zona_exterior(
  Ext_id INT NOT NULL,
  PRIMARY KEY (Ext_id),
  Zona_id INT, 
  FOREIGN KEY (Zona_id) REFERENCES Zona(Zona_id)
);

CREATE TABLE Contiene(
Zona_id INT, 
Producto_id INT,
FOREIGN KEY (Zona_id) REFERENCES Zona(Zona_id),
FOREIGN KEY (Producto_id) REFERENCES Producto(Producto_id)
);


/* Inserciones en las tablas */

INSERT INTO Producto (Producto_id, Nombre)
VALUES (123, 'Pala');

INSERT INTO Vivero(Vivero_id)
VALUES (1);

INSERT INTO Vivero(Vivero_id)
VALUES (2);

INSERT INTO Vivero(Vivero_id)
VALUES (3);

INSERT INTO Empleado (Empleado_id, Nombre, Objetivos_venta, Control_pedidos)
VALUES (123, 'Juan Perez', 10, 5);

INSERT INTO Zona (Zona_id, Unidades_producto, Productividad, Tipo, Viv_id, Emp_id)
VALUES (1, 23, 10, 'Caja', 1, 123);

INSERT INTO Zona (Zona_id, Unidades_producto, Productividad, Tipo, Viv_id, Emp_id)
VALUES (2, 23, 10, 'Almacen', 2, 123);

INSERT INTO Zona (Zona_id, Unidades_producto, Productividad, Tipo, Viv_id, Emp_id)
VALUES (3, 23, 10, 'Exterior', 3, 123);

INSERT INTO Caja(Caja_id, Zona_id)
VALUES (1, 1);

INSERT INTO Almacen(Almacen_id, Zona_id)
VALUES (3, 2);

INSERT INTO Zona_exterior(Ext_id, Zona_id)
VALUES (2, 3);

INSERT INTO Contiene(Zona_id, Producto_id)
VALUES (1, 123);


/* Pruebas */

SELECT * FROM Contiene;