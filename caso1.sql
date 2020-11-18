--Se crean database del Caso 1
CREATE DATABASE empresa_caso1;
\c empresa_caso1
--Se crean tablas del Caso 1 según modelo lógico

CREATE TABLE departamento(
  id SERIAL,
  nombre_depto VARCHAR(100),
  PRIMARY KEY (id)
);
CREATE TABLE trabajadores(
  nombre VARCHAR(50) NOT NULL,
  rut VARCHAR(10),
  direccion VARCHAR(250),
  id_departamento INT REFERENCES departamento(id),
  PRIMARY KEY (rut)
);
CREATE TABLE liquidaciones(
  id SERIAL,
  rut_trabajador VARCHAR(10) REFERENCES trabajadores(rut),
  link_drive VARCHAR(500),
  PRIMARY KEY (id)
);
-- Agregamos datos para probar el modelo
INSERT INTO departamento(nombre_depto) VALUES ('Finanzas');
INSERT INTO departamento(nombre_depto) VALUES ('Tecnología');
INSERT INTO trabajadores(nombre, rut, direccion, id_departamento) VALUES ('Gilibeth','25606283-6','María Teresa 454545',2);
INSERT INTO trabajadores(nombre, rut, direccion, id_departamento) VALUES ('Stefani','12345678-5','Portuga 54545l',1);
INSERT INTO liquidaciones(rut_trabajador, link_drive) VALUES ('25606283-6','https://drive.google.com/file/d/1INxeDJQZ1vdU-FywVyg4vEAN2Wmf01Cx/view?usp=sharing');
INSERT INTO liquidaciones(rut_trabajador, link_drive) VALUES ('12345678-5','https://drive.google.com/file/d/1TzyPilcQPInktYpGt6iFseU4H06KvyMD/view?usp=sharing');
-- Unimos tablas para revisar
SELECT * FROM departamento 
INNER JOIN trabajadores ON trabajadores.id_departamento = departamento.id
INNER JOIN liquidaciones ON liquidaciones.rut_trabajador = trabajadores.rut;

