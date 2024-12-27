CREATE DATABASE proyectoBaseDeDatos
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;
use proyectoBaseDeDatos;
—
CREATE TABLE tipo (
idTipo INT(4) NOT NULL AUTO_INCREMENT,
nomTipo ENUM('oferta', 'destacada') NOT NULL,
duracion VARCHAR(50) NOT NULL,
costo DOUBLE (8,2) NOT NULL,
fechaDeAltaT DATE NOT NULL DEFAULT CURRENT_DATE,
PRIMARY KEY (idTipo)
);
CREATE TABLE usuario (
idUsuario INT(4) NOT NULL AUTO_INCREMENT,
nickname VARCHAR(50) NOT NULL UNIQUE,
correoElec VARCHAR(50) NOT NULL UNIQUE,
fechaDeAltaU DATE NOT NULL DEFAULT CURRENT_DATE,
PRIMARY KEY (idUsuario)
);
CREATE TABLE tel_usuario (
idTel_Usuario INT(4) AUTO_INCREMENT NOT NULL,
nmroTelefono INT(9) NOT NULL,
PRIMARY KEY (idTel_Usuario, nmroTelefono),
FOREIGN KEY (idTel_Usuario) REFERENCES usuario (idUsuario)
);
CREATE TABLE departamento (
idDepartamento INT(4) AUTO_INCREMENT NOT NULL,
nomDepartamento VARCHAR(50) NOT NULL UNIQUE,
PRIMARY KEY (idDepartamento)
);
CREATE TABLE ciudad (
idCiudad INT(4) AUTO_INCREMENT NOT NULL,
nomCiudad VARCHAR(50) NOT NULL UNIQUE,
idDepartamento INT(4) NOT NULL,
PRIMARY KEY (idCiudad),
FOREIGN KEY (idDepartamento) REFERENCES departamento
(idDepartamento)
);
CREATE TABLE empresa (
idEmpresa INT(4) NOT NULL,
rut BIGINT(12) NOT NULL UNIQUE,
nomEmpresa VARCHAR(50) NOT NULL UNIQUE,
direccion VARCHAR(50) NOT NULL,
rubro VARCHAR(50) NOT NULL,
idCiudad INT(4) NOT NULL,
PRIMARY KEY (idEmpresa),
FOREIGN KEY (idEmpresa) REFERENCES usuario (idUsuario),
FOREIGN KEY (idCiudad) REFERENCES ciudad (idCiudad)
);
CREATE TABLE postulante (
idPostulante INT(4) NOT NULL,
ci INT(8) NOT NULL UNIQUE,
nomPostulante VARCHAR(50) NOT NULL,
apellidoPostulante VARCHAR(50) NOT NULL,
nacionalidad VARCHAR(50) NOT NULL,
fechaNac DATE NOT NULL,
PRIMARY KEY (idPostulante),
FOREIGN KEY (idPostulante) REFERENCES usuario (idUsuario)
);
CREATE TABLE ofertaLaboral (
idOfertaLaboral INT(4) AUTO_INCREMENT NOT NULL,
nomOfertaLaboral VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
horarioTrab VARCHAR(10) NOT NULL,
cargoDelPuesto VARCHAR(50) NOT NULL,
remuneracion DOUBLE(8,2) NOT NULL,
fechaDeAltaOL DATE NOT NULL DEFAULT CURRENT_DATE,
cantidadDeVacantes INT(3) NOT NULL,
idEmpresa INT(4) NOT NULL,
idTipo INT(4) NOT NULL,
PRIMARY KEY (idOfertaLaboral),
FOREIGN KEY (idEmpresa) REFERENCES empresa (idEmpresa),
FOREIGN KEY (idTipo) REFERENCES tipo (idTipo)
);
CREATE TABLE postula (
idPostulante INT(4) NOT NULL,
idOfertaLaboral INT(4) NOT NULL,
fechaPost DATE NOT NULL DEFAULT CURRENT_DATE,
cv VARCHAR(100) NOT NULL,
valoracion ENUM('aprobado', 'ampliar info', 'no aprobado') NOT NULL,
PRIMARY KEY (idPostulante, idOfertaLaboral),
FOREIGN KEY (idPostulante) REFERENCES postulante (idPostulante),
FOREIGN KEY (idOfertaLaboral) REFERENCES ofertaLaboral
(idOfertaLaboral)
);
—
INSERT INTO tipo (nomTipo, duracion, costo, fechaDeAltaT) VALUES ("destacada",
'60', 200.00, '2024-08-08');
INSERT INTO tipo (nomTipo, duracion, costo) VALUES ("oferta", '30', 100.50);
INSERT INTO usuario (nickname, correoElec) VALUES ('juan123',
'juan123@gmail.com');
INSERT INTO usuario (nickname, correoElec, fechaDeAltaU) VALUES ('ana456',
'ana456@yahoo.com', '2024-01-08');
INSERT INTO usuario (nickname, correoElec, fechaDeAltaU) VALUES ('agus456',
'agus456@yahoo.com', '2024-03-08');
INSERT INTO usuario (nickname, correoElec) VALUES ('jose123',
'jose23@gmail.com');
INSERT INTO usuario (nickname, correoElec, fechaDeAltaU) VALUES ('mauro456',
'mauro456@yahoo.com', '2024-07-08');
INSERT INTO usuario (nickname, correoElec) VALUES ('lucia123',
'lucia23@gmail.com');
INSERT INTO usuario (nickname, correoElec, fechaDeAltaU) VALUES ('pepe456',
'pepe456@yahoo.com', '2023-03-08');
INSERT INTO tel_usuario (idTel_Usuario, nmroTelefono) VALUES (1, 123456789);
INSERT INTO tel_usuario (idTel_Usuario, nmroTelefono) VALUES (2, 123856789);
INSERT INTO tel_usuario (idTel_Usuario, nmroTelefono) VALUES (3, 123856789);
INSERT INTO tel_usuario (idTel_Usuario, nmroTelefono) VALUES (4, 123856789);
INSERT INTO tel_usuario (idTel_Usuario, nmroTelefono) VALUES (5, 123856756);
INSERT INTO tel_usuario (idTel_Usuario, nmroTelefono) VALUES (6, 123236789);
INSERT INTO departamento (nomDepartamento) VALUES ('montevideo');
INSERT INTO departamento (nomDepartamento) VALUES ('canelones');
INSERT INTO Ciudad (nomCiudad, idDepartamento) VALUES('Montevideo', 1),
('Las Piedras', 2);
INSERT INTO Empresa (idEmpresa, rut, nomEmpresa, direccion, rubro, idCiudad)
VALUES (1, 123456789012, 'TechCorp', 'Calle Falsa 123', 'Tecnología', 1);
INSERT INTO Empresa (idEmpresa, rut, nomEmpresa, direccion, rubro, idCiudad)
VALUES (2, 123456755012, 'TechMIL', 'Calle Jaja 125', 'Tecnología', 2);
INSERT INTO Empresa (idEmpresa, rut, nomEmpresa, direccion, rubro, idCiudad)
VALUES (3, 123456783312, 'XTch', 'Calle Real 323', 'Tecnología', 1);
INSERT INTO Postulante (idPostulante, ci, nomPostulante, apellidoPostulante,
nacionalidad, fechaNac) VALUES
(2, 87654321, 'Ana', 'García', 'Uruguaya', '1992-07-15'),
(3, 87354321, 'AGUSTIN', 'García', 'Uruguaya', '1992-02-15'),
(4, 87634321, 'JOSE', 'PEREZ', 'Uruguaya', '1992-05-05');
INSERT INTO Postulante (idPostulante, ci, nomPostulante, apellidoPostulante,
nacionalidad, fechaNac) VALUES
(7, 87651221, 'Pepe', 'Martinez', 'Uruguayo', '1991-03-05');
INSERT INTO OfertaLaboral (nomOfertaLaboral, descripcion, horarioTrab,
cargoDelPuesto, remuneracion, cantidadDeVacantes, idEmpresa, idTipo) VALUES
('Desarrollador Web', 'Desarrollo de sitios web', '9-17', 'Desarrollador', 50000.00, 2,
1, 1);
INSERT INTO OfertaLaboral (nomOfertaLaboral, descripcion, horarioTrab,
cargoDelPuesto, remuneracion, cantidadDeVacantes, idEmpresa, idTipo) VALUES
('Desarrollador Web', 'Desarrollo de sitios web', '9-17', 'Desarrollador', 50300, 5, 1,
2);
INSERT INTO OfertaLaboral (nomOfertaLaboral, descripcion, horarioTrab,
cargoDelPuesto, remuneracion, cantidadDeVacantes, idEmpresa, idTipo) VALUES
('Desarrollador Web', 'Desarrollo de sitios web', '9-17', 'Desarrollador', 10000.00, 6,
1, 1);
INSERT INTO OfertaLaboral (nomOfertaLaboral, descripcion, horarioTrab,
cargoDelPuesto, remuneracion, cantidadDeVacantes, idEmpresa, idTipo) VALUES
('Desarrollador .NET', 'Desarrollo de sitios web', '8-31', 'Desarrollador', 30000.00, 6,
2, 1);
INSERT INTO OfertaLaboral (nomOfertaLaboral, descripcion, horarioTrab,
cargoDelPuesto, remuneracion, cantidadDeVacantes, idEmpresa, idTipo) VALUES
('Desarrollador JAVA', 'Desarrollo Back-End', '10-17', 'Desarrollador', 9000.00, 6, 2,
2);
INSERT INTO OfertaLaboral (nomOfertaLaboral, descripcion, horarioTrab,
cargoDelPuesto, remuneracion, cantidadDeVacantes, idEmpresa, idTipo) VALUES
('Desarrollador .NET', 'Desarrollo Back-End', '10-17', 'Desarrollador', 50000.00, 6, 2,
1);
INSERT INTO OfertaLaboral (nomOfertaLaboral, descripcion, horarioTrab,
cargoDelPuesto, remuneracion, fechaDeAltaOL, cantidadDeVacantes, idEmpresa,
idTipo) VALUES
('Desarrollador .NET', 'Desarrollo de sitios web', '14.22', 'Desarrollador', 5000.00,
'2023-08-12', 6, 1, 2);
INSERT INTO OfertaLaboral (nomOfertaLaboral, descripcion, horarioTrab,
cargoDelPuesto, remuneracion, cantidadDeVacantes, idEmpresa, idTipo) VALUES
('Desarrollador .NET', 'Desarrollo de sitios web', '12.22', 'Desarrollador', 5000.00, 6,
1, 2);
INSERT INTO Postula (idPostulante, idOfertaLaboral, cv, valoracion) VALUES (2, 1,
'CV Ana.pdf', 'AMPLIAR INFO');
INSERT INTO Postula (idPostulante, idOfertaLaboral, fechaPost, cv, valoracion)
VALUES (3, 1, '2024-12-23', 'CV AGUSTIN.pdf', 'NO APROBADO');
INSERT INTO Postula (idPostulante, idOfertaLaboral, fechaPost, cv, valoracion)
VALUES (4, 1,'2024-12-21', 'CV JOSE.pdf', 'APROBADO');
INSERT INTO Postula (idPostulante, idOfertaLaboral, fechaPost, cv, valoracion)
VALUES (4, 2,'2024-12-21', 'CV JOSE.pdf', 'No APROBADO');
INSERT INTO Postula (idPostulante, idOfertaLaboral, fechaPost, cv, valoracion)
VALUES (7, 1,'2024-12-21', 'CV JOSE.pdf', 'APROBADO');