create database desafio;

use desafio;

create table usuario
(
id_user int not null auto_increment,
nome_user varchar (40) not null,
sobrenome_user varchar (60) not null,
cpf_user char (14) not null,
dt_nascimento date not null,
img_user varchar (60) null,
senha_user varchar (20) not null,
cf_senha_user varchar (20) not null,
dt_cadastro_user timestamp default current_timestamp not null,
dt_atualizacao_user timestamp default current_timestamp null,
constraint pk_usuario primary key (id_user)
);

create table contato
(
id_contato int not null auto_increment,
id_user int not null,
email_user varchar (80) not null,
ddd_user char (4) not null,
cel_user char (10) not null,
constraint pk_contato primary key (id_contato),
constraint fk_contato_user foreign key (id_user)
references usuario (id_user)
);

create table professor
(
id_prof int not null auto_increment,
id_user int not null,
id_contato int not null,
minibio_prof varchar (300) not null,
linkedin_prof varchar (120) null,
status_prof enum ('A' , 'I') not null default 'A',
constraint pk_professor primary key (id_prof),
constraint fk_professor_user foreign key (id_user)
references usuario (id_user),
constraint fk_professor_contato foreign key (id_contato) 
references contato (id_contato)
);

create table aluno
(
id_aluno int not null auto_increment,
id_user int not null,
id_contato int not null,
status_aluno enum ('A' , 'I') not null default 'A',
constraint pk_aluno primary key (id_aluno),
constraint fk_aluno_user foreign key (id_user)
references usuario (id_user),
constraint fk_aluno_contato foreign key (id_contato) 
references contato (id_contato)
);

create table curso
(
id_curso int not null auto_increment,
nome_curso varchar (50) not null,
descricao_curso varchar (400) not null,
id_user int not null,
id_prof int not null,
duracao_curso varchar (20) not null,
gratuidade_curso enum ('S' , 'N') not null default 'S',
valor_curso decimal (6,2) not null,
dt_cadastro timestamp default current_timestamp not null,
dt_atualizacao timestamp default current_timestamp null,
img_curso varchar (60) null,
constraint pk_pessoa primary key (id_curso),
constraint fk_curso_usuario foreign key (id_user) 
references usuario (id_user),
constraint fk_curso_professor foreign key (id_prof) 
references professor (id_prof)
);

create table matricula
(
id_matricula int not null auto_increment,
id_user int not null,
id_curso int not null,
dt_inicio datetime not null,
dt_termino datetime not null,
dt_cadastro timestamp default current_timestamp not null,
constraint pk_matricula primary key (id_matricula),
constraint fk_matricula_usuario foreign key (id_user) 
references usuario (id_user),
constraint fk_matricula_curso foreign key (id_curso) 
references curso (id_curso)
);

create table depoimento
(
id_depoimento int not null auto_increment,
id_user int not null,
depoimento varchar (130) not null,
dt_cadastro timestamp default current_timestamp not null,
constraint pk_depoimento primary key (id_depoimento),
constraint fk_depoimento_user foreign key (id_user)
references usuario (id_user)
);

create table categoria_blog
(
id_categoria int not null auto_increment,
titulo_categoria varchar (30) not null,
status_categoria enum ('A' , 'I') not null default 'A',
constraint pk_depoimento primary key (id_categoria)
);
 
create table post_blog
(
id_post int not null auto_increment,
id_autor int not null,
id_categoria int not null,
dt_publicacao datetime not null,
titulo_post varchar (50) not null,
resumo_post varchar (250) not null,
conteudo_post varchar (5000) not null,
dt_cadastro timestamp default 
current_timestamp not null,
dt_edicao timestamp default current_timestamp not null,
img_post varchar (60) null,
status_post enum ('A' , 'I') not null default 'A',
constraint pk_blog primary key (id_post),
constraint fk_blog_autor foreign key (id_autor)
references usuario (id_user),
constraint fk_blog_categoria foreign key (id_categoria) 
references categoria_blog (id_categoria)
);











