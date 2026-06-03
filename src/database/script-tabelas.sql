create database educacao;
use educacao;

create table usuario (
    id int primary key auto_increment,
    nome varchar(65),
    email varchar(80),
    senha varchar(30)
);

create table pergunta (
    id int primary key auto_increment,
    enunciado varchar(200)
);

create table opcao (
    id int primary key auto_increment,
    texto varchar(200),
    perfil varchar(30)
);

create table resposta_usuario (
    fk_usuario int,
    fk_opcao int,
    fk_pergunta int,
    data_resposta datetime default now(),
    constraint fkUsuarioResposta
		foreign key (fk_usuario) references usuario(id),
        
	constraint fkOpcaoResposta
		foreign key (fk_opcao) references opcao(id),
        
	constraint fkPerguntaResposta
		foreign key(fk_pergunta) references pergunta(id)
);

insert into pergunta (enunciado) values 
('Com qual dessas caracteristicas de estudo você mais se identifica?'),
('Qual desses espaços você prefere estudar?'),
('Como você age quando precisa estudar um assunto muito difícil?'),
('Você vai montrar um móvel novo, por onde você começa?'),
('Ao aprender algo novo, qual dessas frases te define melhor?');

insert into opcao (texto, perfil) values 

('Preciso estar em contato com o conteúdo de forma prática', 'pratico'),
('Prefiro ler e me expressar por meio da escrita', 'leitura/escrita'),
('Entendo melhor ouvindo as informações', 'auditivo'),
('Entendo e me lembro melhor de informações visualizando o conteúdo','visual'),

('Um lugar onde eu posso me movimentar e fazer pausar frequentes para organizar as ideias', 'pratico'),
('Apenas um notebook, PDFs e um bloco de notas', 'leitura/escrita'),
('Um espaço onde eu posso falar em voz alta para entender melhor o conteúdo', 'auditivo'),
('Preciso de estimulos visuais, um ambiente limpo e organizado com post-its e papeis','visual'),

('Corro para fazer vários exercícios até entender o assunto', 'pratico'),
('Leio artigos, livros, jornais e escrevo sobre o assunto', 'leitura/escrita'),
('Pesquiso vídeos ou podcast sobre o assunto', 'auditivo'),
('Procuro gráficos ou imagens sobre o tema','visual'),

('Vou direto juntando as peças e procurando entender o móvel conforme vou montando', 'pratico'),
('Primeiro, leio o manual de instruções', 'leitura/escrita'),
('Coloco um vídeo ou peço para alguém me explicar', 'auditivo'),
('Me baseio na imagem do móvel pronto na caixa para realizar minha montagem','visual'),

('Tenho que treinar muito sobre este assunto', 'pratico'),
('Vou anotar com minhas próprias palavras para não esquecer', 'leitura/escrita'),
('Vou procurar um vídeo falando sobre o assunto', 'auditivo'),
('Preciso de um desenho ou uma demonstração sobre o conteúdo','visual');

select * from usuario;
select * from pergunta;
select * from opcao;
select * from resposta_usuario;
                
select o.perfil, COUNT(o.perfil) as total
    from resposta_usuario as r 
        join opcao as o on r.fk_opcao = o.id
            where r.fk_usuario = 4
            group by o.perfil
            order by total desc;

select p.enunciado as 'Pergunta', o.texto as 'Opções'
	from resposta_usuario as r
		join pergunta as p on r.fk_pergunta = p.id
			join opcao as o on r.fk_opcao = o.id;