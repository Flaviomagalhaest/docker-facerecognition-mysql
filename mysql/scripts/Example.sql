CREATE DATABASE Example;
USE Example;

CREATE TABLE Usuario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nrRegistro INT,
  nrDocumento INT
);

CREATE TABLE DadosComp (
  id INT AUTO_INCREMENT PRIMARY KEY,
  idUsuario INT,
  autenticacao INT,
);

ALTER TABLE DadosComp ADD CONSTRAINT fk_fotos FOREIGN KEY (idUsuario) REFERENCES Usuario(id);

