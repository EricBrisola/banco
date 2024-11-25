use clinica;

select database();

create user 'admin'@'localhost' 
	identified by '$uperAdminCL1N1CA';

create user 'suporte'@'localhost' 
	identified by '$uport3CL1N1CA';

create user 'operador'@'localhost' 
	identified by 'OperadorCL1N1CA';

create user 'consulta'@'%' 
	identified by 'consultaCL1N1CA';

GRANT all privileges
 ON clinica.*
 TO 'admin'@'localhost';

create table ambulatorio (
	nroa int primary key,
	andar numeric(3) not null
);

create table medicos (
	codm int primary key,
	nome varchar(50) not null,
	idade smallint not null,
	especialidade varchar(20),
	cpf numeric(11) unique,
	cidade varchar(30),
	nroa int
);

create table pacientes(
	codp int primary key,
    nome varchar(40) not null,
    idade smallint,
    cpf numeric(11) unique,
    doenca varchar(40) not null
);

create table funcionarios (
	codf int primary key,
	nome varchar(40) not null,
	idade smallint,
	cpf numeric(11) unique,
	cidade varchar(30),
	salario numeric(10),
	cargo varchar(20)
);

create table consultas (
	codm int,
    codp int,
    consulta_data date,
    hora time,
    primary key (consulta_data, hora, codm),
    constraint fk_codm foreign key (codm) references medicos (codm),
    constraint fk_codp foreign key (codp) references pacientes (codp)
);

grant SELECT, INSERT, UPDATE, DELETE
	on clinica.*
    to 'suporte'@'localhost';

grant SELECT, INSERT, UPDATE
	on clinica.*
    to 'operador'@'localhost';
    
grant SELECT
	on clinica.*
    to 'consulta'@'%';
    
alter table consultas 
	add constraint horario_consulta
	check (hora > '06:00:00' and hora < '21:00:00'); 
    
alter table ambulatorio
	add column capacidade smallint;

alter table pacientes
	add column cidade varchar(30);
    
alter table funcionarios
	drop column cargo;
    
alter table medicos
	add constraint nroa_fk foreign key (nroa) references ambulatorio (nroa); 
    
alter table medicos
	add column ativo boolean not null default true;
    
alter table pacientes
	drop column doenca;
    
alter table consultas
	add column doenca varchar(40) not null;
    
REVOKE SELECT ON pacientes FROM 'consulta'@'%';

    


