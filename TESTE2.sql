create database FAST_201902


go 

use FAST_201902
 
/*criacao da tabela cliente */
create table cliente
(id_clie int  not null primary key,
nm_clie  varchar(45) not null,
dat_nas_clie datetime not null,
tele_cont_clie numeric(7,5) not null,
end_clie varchar (45) not null,
sex_clie varchar (20) not null);
go

/*criacao da tabela tp_pgto */
create table tp_pgto
(id_tp_pgto int  not null primary key,
dsc_tp_pgto varchar(15),
 id_cartao int constraint id_cartao_id_fk09 references cartao (id_cartao));  
  
go
/*criacao da tabela tp_serv */
create table tp_serv
(id__tp_serv int  not null primary key,
dsc_tp_serv varchar(15)); 

go
/*criacao da tabela tp_pessoa */
create table tp_pessoa
(id_tp_pessoa int  not null primary key,
dsc_tp_pessoa varchar(15)); 

go
/*criacao da tabela empresa */
create table empresa
(id_emp int  not null primary key,
nm_emp varchar(20) not null,
cnpj_emp numeric(7,5)   not null);

go

/*criacao da tabela pessoa */
create table pessoa 
(id_func int  not null primary key,
id_tp_pessoa int constraint tp_pessoa_id_fk02 references tp_pessoa (id_tp_pessoa),
id_emp  int  not null  constraint empresa_id_fk01   references empresa (id_emp),
nm_func varchar(20) not null,
dat_nas_func date not null,
rg_func varchar (40),
cpf_func varchar (40),
cp_func  numeric (12));
go

/*criacao da tabela prestador */
create table prestador
(id_prestador int  not null primary key,
id_func int constraint pessoa_id_fk03 references pessoa (id_func),
cnh_prestador numeric (7,2));
 
 go

 /*criacao da tabela cartao */
 create table cartao 
 (id_cartao int not null primary key,
 nome_cartao varchar(50) not null,
data_vencimento datetime not null,
codigo_verificacao int not null,
numero_cartao numeric(16)not null); 
 
 /*criacao da tabela veiculo */
 create table veiculo
 (id_ve int  not null primary key,
 id_prestador int  constraint prestador_id_fk04 references prestador (id_prestador),
 pl_ve numeric (7,5) not null,
 cor_ve varchar (20) not null,
 marca_ve varchar(20) not null,
 doc_ve  numeric (8,2) not null,
 modelo_ve varchar (45) not null,
 ano_ve datetime not null,
 km_ve numeric (8,5) not null,
 status_ve varchar(45) not null,
 rastreador_ve varchar (20) not null,
 cod_rastreador_ve int not null);
 
 go
 /*criacao da tabela contrato_serviço */
 create table contrato_servico
 (id__tp_serv int constraint tp_serv_fk075 references tp_serv (id__tp_serv),
 id_tp_pgto int constraint tp_pgto_fk06 references tp_pgto (id_tp_pgto),
 id_clie int constraint cliente_fk07 references cliente (id_clie),
 id_prestador int constraint prestador_id_fk010 references prestador (id_prestador),
 id_func int constraint pessoa_id_fk05 references pessoa (id_func),
 id_contrato_Serv  int  not null, 
 cubagem_serv numeric (7,4) not null,
 dat_serv datetime not null,
 vl_pgto numeric (10,5)not null );
 go
 
 /*alter table da tabela contrato_serviço*/

 ALTER TABLE contrato_serviço alter COLUMN id__tp_serv int;
 go
 alter table veiculo alter COLUMN id_ve int ;
 go
 alter table prestador alter COLUMN id_prestador int ;
 go 
  alter table pessoa alter COLUMN id_func int ;
 go
  alter table empresa alter COLUMN id_emp int ;
 go 
  alter table tp_pessoa alter COLUMN id_tp_pessoa int ;
  go
   alter table tp_pgto alter COLUMN id_tp_pgto int ;
   go
   alter table cliente alter COLUMN id_clie int ;
/*
 alter table contrato_serviço
 add  id_tp_pgto   int  not null 
 alter table contrato_serviço
 add  id_clie   int  not null 
 alter table contrato_serviço
 add  id_prestador   int  not null 
 ALTER TABLE NomeTabela
 ALTER TABLE contrato_serviço
ADD CONSTRAINT tp_serv_
FOREIGN KEY (id__tp_serv) REFERENCES contrato_serviço(id__tp_serv);
ALTER TABLE contrato_serviço
ADD CONSTRAINT con_serv PRIMARY KEY (id_contrato_Serv)
*/
 /* select das tabelas */
 select *from cliente
 go
 select *from tp_pgto
 go
 select *from tp_serv
 go
 select *from tp_pessoa
 go
 select *from empresa
 go
 select *from pessoa
 go
 select *from prestador
 go
 select *from veiculo
 go
 select *from contrato_serviço
 go
 select *from cartao

 /* insert da tabela cliente */

  insert into cliente(id_clie,nm_clie,dat_nas_clie,tele_cont_clie,end_clie,sex_clie)
       values (1,'Carlos Roberto','2018/06/12 18:00:00',1, 'parque edu chaves','Masculino');
go	          
 /* insert da tabela tp_pgto */

 insert into tp_pgto  (id_tp_pgto,dsc_tp_pgto,id_cartao)
values ( 1,'Debito',1),
       (2,'Credito',1);
go
	          
 /* insert da tabela tp_serv */
insert into tp_serv (id__tp_serv,dsc_tp_serv)
values (1,'mudanca'),
       (2,'locacao');	   
go

/* insert da tabela tp_pessoa */
insert into tp_pessoa (id_tp_pessoa,dsc_tp_pessoa)
values (1,'Juridica'),
       (2,'fisica');	   
go


 /* insert  da tabela empresa */

 insert into empresa (id_emp,nm_emp,cnpj_emp)
 values (5,'sdadsasdsa',9);

 go
 /* insert  da tabela pessoa */

 insert into pessoa (id_func,id_tp_pessoa,id_emp,nm_func,dat_nas_func,rg_func,cpf_func,cp_func)
 values  (7,1,1,'carlos','2018/06/12 18:00:00',2,2,4)

 (/*1,1,'carlos','2018/06/12 18:00:00',00,01,02*/);
 go
/* insert da tabela prestador */

insert into prestador (id_prestador,id_func,cnh_prestador)
values (6,1,0)
 go
 /* insert da tabela veiculo */

 insert into  veiculo (id_ve,id_prestador,pl_ve,cor_ve,marca_ve,doc_ve,modelo_ve,ano_ve,km_ve,status_ve,rastreador_ve,cod_rastreador_ve)
 values (1,8,1,'azul','Conversivel',2,'Conversivel','2018/06/12 18:00:00',03,'Desligado','Desligado',06);
 /* (05,8,1,'azul','honda','Conversivel','2018/06/12 18:00:00',03,'Ativo','Desligado',06*/
 go
 /* insert da tabela contrato_serviço */

 insert into contrato_servico (id__tp_serv,id_tp_pgto,id_clie,id_prestador,id_func, id_contrato_Serv,cubagem_serv,dat_serv,vl_pgto)
values 
(1,1,1,6,1,7,1,'2018/06/12 18:00:00',4);

/* insert da tabela cartao */

insert into cartao (id_cartao,nome_cartao,data_vencimento,codigo_verificacao,numero_cartao)
values (1,'MasterCard','2019/06/12 12:00:00',4,3)
go
/* drop das tabelas */
drop table cliente
go
drop table tp_pgto
go
drop  table tp_serv
go
drop  table tp_pessoa
go
drop table empresa
go
drop table pessoa 
go
drop table prestador 
go
drop table cartao 
go
drop table veiculo
go
drop table contrato_serviço

/* SERVIDOR E USUARIO E SENHA DO BANCO DO TCC 
172.16.48.10
Usuário: fastmoving
Senha: m0v1ngf@st */


sp_help contrato_servico id_func
