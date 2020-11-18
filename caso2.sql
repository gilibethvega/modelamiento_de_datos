--Se crean database del Caso 1
CREATE DATABASE colegio_caso2;
\c colegio_caso2;
--Se crean tablas del Caso 2 según modelo lógico

CREATE TABLE curso(
  id SERIAL,
  nombre_curso VARCHAR(20),
  PRIMARY KEY (id)
);
CREATE TABLE alumno(
  rut VARCHAR(10),
  nombre VARCHAR(50),
  curso_id INT REFERENCES curso(id),
  PRIMARY KEY (rut)
);
CREATE TABLE departamento(
  id SERIAL,
  nombre_depto VARCHAR(40),
  PRIMARY KEY (id)
);
CREATE TABLE profesor(
  id SERIAL,
  nombre_profesor VARCHAR(50),
  departamento_id INT REFERENCES departamento(id),
  PRIMARY KEY (id)
);
CREATE TABLE pruebas(
  id SERIAL,
  pruebas_rut VARCHAR(10) REFERENCES alumno(rut),
  calificacion INT,
  profesor_id INT REFERENCES profesor(id),
  PRIMARY KEY (id)
);
-- Agregamos datos para probar el modelo
--Tabla cursos
INSERT INTO curso(nombre_curso) VALUES ('4to medio A');
INSERT INTO curso(nombre_curso) VALUES ('4to medio B');
INSERT INTO curso(nombre_curso) VALUES ('4to medio C');
--Tabla alumno
INSERT INTO alumno(rut, nombre, curso_id) VALUES ('1234567-8', 'Clark Kent', 1);
INSERT INTO alumno(rut, nombre, curso_id) VALUES ('9999999-8', 'Bruce Wayne', 2);
INSERT INTO alumno(rut, nombre, curso_id) VALUES ('9999999-0', 'Luisa Lois', 2);
--Tabla departamento
INSERT INTO departamento(nombre_depto) VALUES ('Lenguaje');
INSERT INTO departamento(nombre_depto) VALUES ('Matemáticas');
INSERT INTO departamento(nombre_depto) VALUES ('Física');
--Tabla profesor
INSERT INTO profesor(nombre_profesor, departamento_id) VALUES ('Cristobal', 1);
INSERT INTO profesor(nombre_profesor, departamento_id) VALUES ('Julio', 1);
INSERT INTO profesor(nombre_profesor, departamento_id) VALUES ('Gili', 3);
--Tabla pruebas
INSERT INTO pruebas(pruebas_rut, calificacion, profesor_id) VALUES ('1234567-8', 4, 1);
INSERT INTO pruebas(pruebas_rut, calificacion, profesor_id) VALUES ('1234567-8', 5, 2);
INSERT INTO pruebas(pruebas_rut, calificacion, profesor_id) VALUES ('1234567-8', 5, 3);
INSERT INTO pruebas(pruebas_rut, calificacion, profesor_id) VALUES ('9999999-8', 3, 1);
INSERT INTO pruebas(pruebas_rut, calificacion, profesor_id) VALUES ('9999999-8', 6, 2);
INSERT INTO pruebas(pruebas_rut, calificacion, profesor_id) VALUES ('9999999-0', 7, 1);
INSERT INTO pruebas(pruebas_rut, calificacion, profesor_id) VALUES ('9999999-0', 7, 2);
-- Seleccionamos para verificar
-- Alumnos, nota pruebas y profesores que corrigieron 
SELECT * FROM alumno 
INNER JOIN pruebas ON pruebas.pruebas_rut = alumno.rut
INNER JOIN profesor ON profesor.id = pruebas.profesor_id;
-- Profesores por departamento
SELECT * FROM profesor 
INNER JOIN departamento ON departamento.id = profesor.departamento_id;
-- Alumnos por cursos
SELECT * FROM alumno 
INNER JOIN curso ON curso.id = alumno.curso_id;

