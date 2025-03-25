-- apagar o banco de dados (somente para exercicios, não incluir no programa final)
drop database dbLoja;
--criar o banco de dados (somente primeira vez)
create database dbLoja;
--acessar o banco de dados
use dbLoja;
--criando as tabelas do banco de dados
--tabelas que não precisam de chave estrangeira são criadas primeiro
create table tbFuncionario(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cpf char(14) not null unique,
telCel char(10),
dataNasc date,
sexo char(1),
salario decimal(9,2),
logradouro varchar(100),
numero char(10),
cep char(9),
bairro varchar(100),
cidade varchar(100),
estado varchar(100),
siglaEst char(2),
complemento varchar	(100),
primary key(codFunc)
);
create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(50) not null,
email varchar(100),
cnpj char(18) not null unique,
primary key(codForn)
);
create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCel char(9),
cpf char(14) not null unique,
primary key(codCli)
);
--tabelas que precisam de chave estrangeira são criadas depois
create table tbUsuario(
codUsu int not null auto_increment,
nome varchar(30) not null unique,
senha varchar(12) not null,
codFunc int not null,
primary key (codUsu),
foreign key (codFunc) references tbFuncionario(codFunc)
);
create table tbProdutos(
codProduto int not null auto_increment,
nome varchar(100),
valor decimal(9,2),
quantidade int,
dataEnt date,
validade date,
codForn int not null,
primary key(codProduto),
foreign key(codForn) references tbFornecedores(codForn)
);
create table tbVenda(
codVenda int not null auto_increment,
dataVenda date,
horaVenda time,
quantidade int,
valorTotal decimal(9,2),
codProduto int not null,
codUsu int not null,
codCli int not null,
primary key(codVenda),
foreign key(codProduto) references tbProdutos(codProduto),
foreign key(codUsu) references tbUsuario(codUsu),
foreign key(codCli) references tbClientes(codCli)
);
--visualizando a estrutura da tabela
desc tbFuncionario;
desc tbFornecedores;
desc tbUsuario;
desc tbProdutos;
desc tbClientes;
desc tbVenda;
--inserindo registro nas tabelas
insert into tbFuncionario(nome,email,cpf,telCel,dataNasc,sexo,salario,logradouro,numero,cep,bairro,cidade,estado,siglaEst,complemento)
	values('Natalia Mariano', 'natalia.mfascini@senacsp.edu.br', '123.123.123-12', '12345-6789', '1995/01/01', 'F', 4500.55, 'Rua Pudim de Pao', '55A', '12345-678', 'Padaria', 'Sao Paulo', 'Sao Paulo', 'SP', 'Na esquina da praca.');
--visualizando os registros das tabelas
select * from tbFuncionario;