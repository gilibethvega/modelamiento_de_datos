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
  calificacion INT,
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