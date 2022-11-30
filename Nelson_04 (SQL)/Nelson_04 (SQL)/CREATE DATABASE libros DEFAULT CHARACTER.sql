CREATE DATABASE libros DEFAULT CHARACTER SET UTF8 COLLATE utf8_general_ci;

USE libros;

CREATE TABLE grados(
    codigo_grado bigint(20) NOT null AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(20) NOT null
);

CREATE TABLE estudiantes(
    carne bigint(20) NOT null AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(20) NOT null,
    apellido varchar(15) NOT null,
    direccion varchar(20) NOT null,
    telefono int(10),
    email varchar(20),
    fechaNacimiento date,
    codigo_grado bigint(5) NOT null
);

CREATE TABLE empleados(
    cod_empleado bigint(20) NOT null AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(15) NOT null,
    apellido varchar(15) NOT null,
    direccion varchar(15) NOT null,
    email varchar(20)
);

CREATE TABLE prestamos(
    cod_prestamo bigint(20) NOT null AUTO_INCREMENT PRIMARY KEY,
    cod_libro bigint(5) NOT null,
    carne bigint(10) NOT null,
    fecha_prestamo date NOT null,
    fecha_devolucion date,
    cod_empleado bigint(5) NOT null
);

CREATE TABLE estados(
    cod_estado bigint(20) NOT null AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(15)
);

CREATE TABLE libros(
    cod_libro bigint(20) NOT null AUTO_INCREMENT PRIMARY KEY,
    codigo_autor bigint(5) NOT null,
    codigo_editorial bigint(5) NOT null,
    titulo varchar(20) NOT null,
    numero_paginas int(15),
    tamanio int(15),
    precio int(20) NOT null,
    estado bigint(5) NOT null,
    edicion int(20) NOT null
);

CREATE TABLE editoriales(
    codigo_editorial bigint(20) NOT null AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(20) NOT null,
    direccion varchar(20),
    telefono int(10),
    email varchar(20)
);

CREATE TABLE autores(
    codigo_autor bigint(10) NOT null AUTO_INCREMENT PRIMARY KEY,
    apellido_autor varchar(10) NOT null,
    nombre_autor varchar(10) NOT null,
    pais_origen bigint(5) NOT null
);

CREATE TABLE paises(
    cod_pais bigint(20) NOT null AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(15)
);

ALTER TABLE estudiantes
ADD CONSTRAINT PK_FK_codigo_grado FOREIGN KEY (codigo_grado) REFERENCES
grados(codigo_grado) ON UPDATE cascade ON DELETE CASCADE;

ALTER TABLE prestamos
ADD CONSTRAINT PK_FK_carne FOREIGN KEY (carne) REFERENCES
estudiantes(carne) ON UPDATE cascade ON DELETE CASCADE;

ALTER TABLE prestamos
ADD CONSTRAINT PK_FK_cod_empleado FOREIGN KEY (cod_empleado) REFERENCES
empleados(cod_empleado) ON UPDATE cascade ON DELETE CASCADE;

ALTER TABLE prestamos
ADD CONSTRAINT PK_FK_cod_libro FOREIGN KEY (cod_libro) REFERENCES
libros(cod_libro) ON UPDATE cascade ON DELETE CASCADE;

ALTER TABLE libros
ADD CONSTRAINT PK_FK_codigo_autor FOREIGN KEY (codigo_autor) REFERENCES
autores(codigo_autor) ON UPDATE cascade ON DELETE CASCADE;

ALTER TABLE libros
ADD CONSTRAINT PK_FK_codigo_editorial FOREIGN KEY (codigo_editorial) REFERENCES
editoriales(codigo_editorial) ON UPDATE cascade ON DELETE CASCADE;

ALTER TABLE libros
ADD CONSTRAINT PK_FK_estado FOREIGN KEY (estado) REFERENCES
estados(cod_estado) ON UPDATE cascade ON DELETE CASCADE;

ALTER TABLE autores
ADD CONSTRAINT PK_FK_pais_origin FOREIGN KEY (pais_origen) REFERENCES
paises(cod_pais) ON UPDATE cascade ON DELETE CASCADE;