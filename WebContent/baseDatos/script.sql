
drop database if exists restaurantis6a;
drop table IF EXISTS ArticuloEnVenta;
drop table IF EXISTS Carrito;
drop table IF EXISTS Contacto;
drop table IF EXISTS Articulo;
drop table IF EXISTS Galeria;
drop table IF EXISTS Comentario;
drop table IF EXISTS Cuenta;

create database restaurantis6a;
use restaurantis6a;
Create table Cuenta (
	idCuenta Int NOT NULL AUTO_INCREMENT,
	usuario Varchar(100) NOT NULL,
	clave Varchar(100) NOT NULL,
	rol Varchar(100) NOT NULL,
	nombre Varchar(100) NOT NULL,
	apellidoPaterno Varchar(100) NOT NULL,
	apellidoMaterno Varchar(100) NOT NULL,
	email Varbinary(100) NOT NULL,
	UNIQUE (usuario),
 Primary Key (idCuenta)) ENGINE = MyISAM;

Create table Comentario (
	idComentario Int NOT NULL AUTO_INCREMENT,
	idCuenta Int NOT NULL,
	comentario Varchar(1000) NOT NULL,
 Primary Key (idComentario)) ENGINE = MyISAM;

Create table Galeria (
	idGaleria Int NOT NULL AUTO_INCREMENT,
	nombre Varchar(100) NOT NULL,
	ubicacion Varchar(255) NOT NULL,
 Primary Key (idGaleria)) ENGINE = MyISAM;

Create table Articulo (
	idArticulo Int NOT NULL AUTO_INCREMENT,
	idGaleria Int NOT NULL,
	descripcionCorta Varchar(200) NOT NULL,
	descripcionLarga Varchar(2000) NOT NULL,
	costo Double NOT NULL,
	tipo Varchar(100) NOT NULL,
 Primary Key (idArticulo)) ENGINE = MyISAM;

Create table Contacto (
	idContacto Int NOT NULL AUTO_INCREMENT,
	nombre Varchar(100) NOT NULL,
	email Varchar(100) NOT NULL,
 Primary Key (idContacto)) ENGINE = MyISAM;

Create table Carrito (
	idCuenta Int NOT NULL,
	idArticulo Int NOT NULL,
	idCarrito Int NOT NULL AUTO_INCREMENT,
	estado Varchar(100) NOT NULL,
 Primary Key (idCarrito)) ENGINE = MyISAM;

Create table ArticuloEnVenta (
	idArticulo Int NOT NULL,
	estado Varchar(100) NOT NULL,
	UNIQUE (idArticulo)) ENGINE = MyISAM;


Alter table Comentario add Foreign Key (idCuenta) references Cuenta (idCuenta) on delete  restrict on update  restrict;
Alter table Carrito add Foreign Key (idCuenta) references Cuenta (idCuenta) on delete  restrict on update  restrict;
Alter table Articulo add Foreign Key (idGaleria) references Galeria (idGaleria) on delete  restrict on update  restrict;
Alter table Carrito add Foreign Key (idArticulo) references Articulo (idArticulo) on delete  restrict on update  restrict;
Alter table ArticuloEnVenta add Foreign Key (idArticulo) references Articulo (idArticulo) on delete  restrict on update  restrict;

INSERT INTO `restaurantis6a`.`cuenta`
(`idCuenta`,
`usuario`,
`clave`,
`rol`,
`nombre`,
`apellidoPaterno`,
`apellidoMaterno`,
`email`)
VALUES
(0,
'root',
'admin',
'administrador',
'root',
'root',
'root',
'root@gmail.com');


