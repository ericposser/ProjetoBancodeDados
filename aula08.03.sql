create database aula;

create table Funcionario(
	Pnome varchar(30) not null,
    Minicial varchar(30) not null,
    Unome varchar(30) not null,
    cpf varchar(14) not null primary key,
    datanasc date not null,
    endereco varchar(50) not null,
    sexo varchar(1) not null,
    salario float not null,
    cpf_supervisor varchar(14) not null,
    dnr int not null,
    
    foreign key (cpf_supervisor) references Funcionario (cpf),
    foreign key (drn) references Departamento (dnumero)
);

alter table Funcionario add constraint dnr foreign key (dnr) references departamento(dnumero);

create table Departamento(
	dnome varchar(30) not null,
    dnumero int primary key,
    cpf_gerente varchar(14) not null,
    data_inicio date not null
);

create table Trabalha_em(
	fcpf varchar(14),
    pnr int,
    horas time,
    primary key (fcpf, pnr)
);

alter table Trabalha_em add constraint fcpf foreign key (fcpf) references Funcionario (cpf);



create table Projeto(
	projnome varchar(30) not null,
    projnumero int primary key not null,
    projlocal varchar(50) not null,
    dnum int not null
);

drop table Funcionario;

drop table Projeto;
