create database educacao;
use educacao;

-- Cadastro do usuário
create table usuario (
    id int primary key auto_increment,
    nome varchar(65),
    email varchar(80),
    senha varchar(30)
);

-- Tabela para cada pergunta
create table pergunta (
    id int primary key auto_increment,
    enunciado varchar(200)
);

-- Tabela para opções de perguntas, com o texto correspondente ao perfil de estudo do usuário e uma fk para ligar com a pergunta
create table opcao (
    id int primary key auto_increment,
    perfil varchar(30),
    fk_pergunta INT,
    constraint fkPergunta
		foreign key (fk_pergunta) references pergunta(id)
);

-- Junção da tabela opção com o usuário para as respostas correspondentes
create table resposta_usuario (
    id int primary key auto_increment,
    fk_usuario int,
    fk_opcao int,
    data_resposta datetime default now(),
    constraint fkUsuarioResposta
		foreign key (fk_usuario) references usuario(id),
        constraint fkOpcaoResposta
			foreign key (fk_opcao) references opcao(id)
);