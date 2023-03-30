create database empresa;

create table FUNCIONARIO(
	Pnome VARCHAR(15) NOT NULL,
    Minicial CHAR,
    Unome VARCHAR(15) NOT NULL,
    Cpf CHAR(11) PRIMARY KEY,
    datanasc DATE,
    Endereco VARCHAR(255),
    Sexo CHAR,
    Salario DECIMAL(10,2),
    Cpf_supervisor CHAR(11),
    Dnr INT,
    
    FOREIGN KEY(Cpf_supervisor) REFERENCES FUNCIONARIO(cpf) 
);

INSERT INTO FUNCIONARIO VALUES('Jorge','E','BRITO','88866555576','1937-11-10','Rua do Horto,35,São Paulo,SP','M',55.00,NULL,1);
INSERT INTO FUNCIONARIO VALUES('Jennifer','S','Souza','98765432168','1941-06-20','AV.Arthur de Lima,54,Santo André,SP','F',43000,'88866555576',4);
INSERT INTO FUNCIONARIO VALUES('FERNANDO','T','Wong','33344555587','1955-12-08','Rua da Lapa,34,São Paulo,SP','M',40000,'88866555576',5);
INSERT INTO FUNCIONARIO VALUES('João','B','Silva','12345678966','1965-01-09','Rua das Flores,751,São Paulo,SP','M',30000,'33344555587',5);
INSERT INTO FUNCIONARIO VALUES('Alice','J','Zelaya','99988777767','1968-01-19','Rua Souza Lima,35,Curitiba,PR','F',25000,'98765432168',4);
INSERT INTO FUNCIONARIO VALUES('Ronaldo','K','Lima','66688444476','1962-09-15','Rua Rebouças,65,Piracicaba,SP','M',38000,'33344555587',5);
INSERT INTO FUNCIONARIO VALUES('Joice','A','Leite','45345345376','1972-07-31','AV.Lucas Obes,74,São Paulo,SP','F',25000,'33344555587',5);
INSERT INTO FUNCIONARIO VALUES ('André','E','Pereira','98798798733','1969-03-29','Rua Timbira,35,São Paulo,SP','M',55000,'98765432168',4);

create table DEPARTAMENTO(
	Dnome VARCHAR(15) NOT NULL,
    Dnumero INT PRIMARY KEY,
    Cpf_gerente CHAR(11),
    Data_inicio_gerente DATE,
    UNIQUE (Dnome),
    FOREIGN KEY (Cpf_gerente) REFERENCES FUNCIONARIO(Cpf)
);

INSERT INTO DEPARTAMENTO(Dnome,Dnumero) VALUES ('Matriz',1);
INSERT INTO DEPARTAMENTO(Dnome,Dnumero) VALUES ('Pesquisa',5);
INSERT INTO DEPARTAMENTO(Dnome,Dnumero) VALUES ('Administração',4);

UPDATE DEPARTAMENTO
SET Cpf_gerente = '33344555587', Data_Inicio_Gerente = '1988-05-22'
where Dnumero = 5;

CREATE TABLE LOCALIZACAO_DEP(
	Dnumero INT NOT NULL,
    Dlocal VARCHAR(15) NOT NULL,
    PRIMARY KEY (Dnumero, Dlocal),
    FOREIGN KEY (Dnumero) REFERENCES DEPARTAMENTO (Dnumero)
);

INSERT INTO LOCALIZACAO_DEP VALUES(1,'São Paulo');
INSERT INTO LOCALIZACAO_DEP VALUES(4,'Mauá');
INSERT INTO LOCALIZACAO_DEP VALUES(5,'Santo André');
INSERT INTO LOCALIZACAO_DEP VALUES(5,'Itu');
INSERT INTO LOCALIZACAO_DEP VALUES(5,'São Paulo');

create table PROJETO(
	Projnome VARCHAR(15) NOT NULL,
    Projnumero INT PRIMARY KEY,
    Projlocal VARCHAR(15),
    Dnum INT,
    UNIQUE (Projnome),
    FOREIGN KEY (Dnum) REFERENCES DEPARTAMENTO (Dnumero)
);

INSERT INTO PROJETO VALUES ('ProdutoX',1,'Santo André',5);
INSERT INTO PROJETO VALUES ('ProdutoY',2,'Itu',5);
INSERT INTO PROJETO VALUES ('ProdutoZ',3,'São Paulo',5);
INSERT INTO PROJETO VALUES ('Informatização',10,'Mauá',4);
INSERT INTO PROJETO VALUES ('Reorganização',20,'São Paulo',1);
INSERT INTO PROJETO VALUES ('NovosBenefícios',30,'Mauá',4);

create table TRABALHA_EM(
	Fcpf CHAR(11) NOT NULL,
    Pnr INT NOT NULL,
    Horas DECIMAL(3,1) ,
    PRIMARY KEY (Fcpf, Pnr),
    CONSTRAINT pk_funcionario FOREIGN KEY(Fcpf) references FUNCIONARIO(cpf) ,
    CONSTRAINT pk_projeto FOREIGN KEY(Pnr) references PROJETO(Projnumero) 
);

INSERT INTO TRABALHA_EM VALUES('12345678966',1,32.5);
INSERT INTO TRABALHA_EM VALUES('12345678966',2,7.5);
INSERT INTO TRABALHA_EM VALUES('66688444476',3,40);
INSERT INTO TRABALHA_EM VALUES('45345345376',1,20);
INSERT INTO TRABALHA_EM VALUES('45345345376',2,20);
INSERT INTO TRABALHA_EM VALUES('33344555587',2,10);
INSERT INTO TRABALHA_EM VALUES('33344555587',3,10);
INSERT INTO TRABALHA_EM VALUES('33344555587',10,10);
INSERT INTO TRABALHA_EM VALUES('33344555587',20,10);
INSERT INTO TRABALHA_EM VALUES('99988777767',30,30);
INSERT INTO TRABALHA_EM VALUES('99988777767',10,10);
INSERT INTO TRABALHA_EM VALUES('98798798733',10,35);
INSERT INTO TRABALHA_EM VALUES('98798798733',30,5);
INSERT INTO TRABALHA_EM VALUES('98765432168',30,20);
INSERT INTO TRABALHA_EM VALUES('98765432168',30,15);
INSERT INTO TRABALHA_EM VALUES('88866555576',20,null);

CREATE TABLE DEPENDENTE(
	Fcpf CHAR(11) NOT NULL ,
    Nome_dependente VARCHAR(15) NOT NULL,
    Sexo CHAR,
    Datanasc DATE,
    Parentesco VARCHAR(8),
    PRIMARY KEY (Fcpf,Nome_dependente),
    FOREIGN KEY(Fcpf) REFERENCES FUNCIONARIO(Cpf)
);

INSERT INTO DEPENDENTE VALUES ('33344555587','Alicia','F','1986-04-05','Filha');
INSERT INTO DEPENDENTE VALUES ('33344555587','Tiago','M','1983-10-25','Filho');
INSERT INTO DEPENDENTE VALUES ('33344555587','Janaína','F','1986-04-05','Esposa');
INSERT INTO DEPENDENTE VALUES ('98765432168','Antonio','M','1942-02-28','Marido');
INSERT INTO DEPENDENTE VALUES ('12345678966','Michael','M','1988-01-04','Filho');
INSERT INTO DEPENDENTE VALUES ('12345678966','Alicia','F','1988-12-30','Filha');
INSERT INTO DEPENDENTE VALUES ('12345678966','Elizabeth','F','1967-05-05','Esposa');

UPDATE DEPARTAMENTO
SET Cpf_gerente = '33344555587', Data_inicio_gerente = '1988-05-22'
WHERE Dnumero = 5;
UPDATE DEPARTAMENTO
SET Cpf_gerente = '98765432168', Data_inicio_gerente = '1995-01-01'
WHERE Dnumero = 4;
UPDATE DEPARTAMENTO
SET Cpf_gerente = '88866555576', Data_inicio_gerente = '1981-06-19'
WHERE Dnumero = 1;
#Recuperar todas as informações de departamento
SELECT * FROM DEPARTAMENTO;

select datanasc as 'Data', Endereco as 'Endereço' from funcionario where Pnome = 'João' AND Minicial = 'B' AND Unome = 'Silva';

select Pnome as 'NOME', endereco AS 'ENDEREÇO' from funcionario, departamento where  Dnome = 'Pesquisa' AND  Dnumero=Dnr;

select Projnumero, Dnumero, Unome, endereco, datanasc from projeto, departamento, funcionario where Projlocal = 'Mauá' and Cpf_gerente=Cpf and Dnumero=Dnum;

select F.Pnome, F.Unome, F.Endereco
from funcionario f, departamento d
where D.Dnome = 'Pesquisa' and D.Dnumero = F.Dnr;

select Cpf from funcionario;

select Cpf, Dnome from funcionario, departamento;

select all Salario from funcionario;

select distinct Salario from funcionario;

select Pnome, Unome
from funcionario
where endereco like '%Sao Paulo,SP%';

select Pnome, Unome
from funcionario
where Datanasc like '__5_______';

select F.Pnome, F.Unome, 1.1 * F.salario as Aumento_salario
from funcionario as F, trabalha_em as T, projeto as P
where F.Cpf=T.Fcpf and T.Pnr = P.Projnumero and P.Projnome='ProdutoX';

select * from funcionario where (Salario between 30000 and 40000) and Dnr = 5;

select D.Dnome, F.Unome, F.Pnome, P.Projnome
from departamento D, funcionario F, trabalha_em T, projeto P
where D.Dnumero = F.Dnr and F.Cpf = T.Fcpf and T.Pnr = P.Projnumero
order by D.Dnome, F.Unome, F.Pnome; 

select D.Dnome, F.Unome, F.Pnome, P.Projnome
from departamento D, funcionario F, trabalha_em T, projeto P
where D.Dnumero = F.Dnr and F.Cpf = T.Fcpf and T.Pnr = P.Projnumero
order by D.Dnome desc, F.Unome asc, F.Pnome asc;
