CREATE DATABASE educacao;
USE educacao;

CREATE TABLE usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    email VARCHAR(50),
    senha VARCHAR(50)
);

CREATE TABLE pergunta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    enunciado VARCHAR(300)
);

CREATE TABLE opcao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    texto VARCHAR(200),
    pontuacao INT,
    perfil VARCHAR(50),
    fk_pergunta INT,
    FOREIGN KEY (fk_pergunta) REFERENCES pergunta(id)
);

CREATE TABLE resposta_usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fk_usuario INT,
    fk_opcao INT,
    data_resposta DATETIME DEFAULT NOW(),
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id),
    FOREIGN KEY (fk_opcao) REFERENCES opcao(id)
);