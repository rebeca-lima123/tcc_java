create database fub;

create table tb_usuario (
	usuario_id int primary key auto_increment not null,
    email varchar(100) not null,
    nome_usuario varchar(36) not null,
    senha varchar(36) not null,
    tipo_usuario enum('EMPREGADOR', 'EMPREGADO') not null,
    rua varchar(100),
    bairro varchar(50),
    cidade varchar(50),
    estado char(2),
    telefone char(15)
);

create table tb_aux_pessoa_juridica (
	cnpj char(14) not null unique,
    ie char(14) not null unique,
    razao_social varchar(100) not null,
    fantasia varchar(100) not null,
    usuario_id int not null,
    foreign key (usuario_id) references tb_usuario(usuario_id)
);

create table tb_aux_pessoa_fisica (
	nome varchar(100) not null,
    data_nasc date not null,
    cpf char(11) not null unique,
    rg varchar(18) not null unique,
    usuario_id int not null,
    foreign key (usuario_id) references tb_usuario(usuario_id)
);

create table tb_contrato (
	contrato_id int primary key auto_increment not null,
    empregador_id int not null,
    empregado_id int,
    data_geracao date not null,
    titulo varchar(50) not null,
    descricao varchar(240),
    foreign key (empregador_id) references tb_usuario(usuario_id),
    foreign key (empregado_id) references tb_usuario(usuario_id)
);

create table tb_cupom (
	cupom_id int primary key auto_increment not null,
    contrato_id int not null,
    valor float not null,
    prazo_validade datetime not null,
    foreign key (contrato_id) references tb_contrato(contrato_id)
);

create table tb_avaliacao (
	avaliacao_id int primary key auto_increment not null,
    contrato_id int not null,
    nota float not null,
    comentario varchar(240),
    foreign key (contrato_id) references tb_contrato(contrato_id)
);
