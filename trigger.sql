create database revisao
go
use revisao

CREATE TABLE PRODUTO 
(CODIGO INT,
 NOME VARCHAR(40),
 COMISSAO FLOAT,
 VALOR FLOAT)
 GO
CREATE TABLE VENDAS
(NROVENDA INT,
 DATA SMALLDATETIME,
 CLIENTE INT,
 VALORTOTA FLOAT,
 VENDEDOR INT)
 GO
CREATE TABLE VENDEDOR 
(CODIGO INT, 
NOME VARCHAR(10),
COMISSAO FLOAT)
GO
CREATE TABLE CLIENTE 
(CODIGO INT,
NOME VARCHAR(40)
)
GO
CREATE TABLE VENDASITEMS 
(NROVENDA INT,
 NROITEM INT, 
 PRODUTO INT,
 VALORVENDA FLOAT,
 QTDE INT)
 GO
CREATE TABLE COMISSAO
(
MOMENTO SMALLDATETIME, 
VENDEDOR INT,
VENDA INT,
TIPOCOMISSAO CHAR(1),
VALORCOMISSAO FLOAT, 
STATUSCOMISSAO CHAR(1),
DTPAGAMENTO SMALLDATETIME)


drop table produto
go
drop table cliente
go
drop table vendasitems
go
drop table comissao
go
drop table vendedor
go
drop table vendas

select * from CLIENTE

		insert into PRODUTO (CODIGO,NOME,COMISSAO,VALOR)
		values (1,'xa',1.2,4.5)

				insert into PRODUTO (CODIGO,NOME,COMISSAO,VALOR)
		values (3,'cv',5.2,9.5)

		insert into  VENDEDOR(CODIGO,NOME,COMISSAO)
		values (1,'xc',1.3)

		insert into CLIENTE(CODIGO,NOME)
		values  (1,'fv')

		insert into VENDAS values (1,'2019-11-12',1,100,1)

		select * from VENDASITEMS

		insert into VENDASITEMS values(1,1,2,2.4,4)
 		
		
 
create trigger CALCULACOMISSAOVENDA on VENDAS for insert
as 
begin
	declare @nrovenda int
	declare @valortotal float 
	declare @codigo int
	declare @comissao float	

    select @nrovenda =NROVENDA,@valortotal=VALORTOTA,@codigo =VENDEDOR   from inserted

	select @comissao =COMISSAO from VENDEDOR where CODIGO=@codigo

	insert into COMISSAO (MOMENTO,VENDEDOR,VENDA,TIPOCOMISSAO,VALORCOMISSAO,STATUSCOMISSAO)
		values (CURRENT_TIMESTAMP,@codigo,@nrovenda,'v',@valortotal*@comissao,'A')


end
	select * from COMISSAO

	select * from PRODUTO

create  trigger ComissaoVendasItems on VENDASITEMS for insert
as
begin
		declare @codigo int
		declare @nome  varchar
		declare @comissao float 
		declare @valor float      
		declare @nrovenda int 
	    declare @valortotal float
		declare @vendedor varchar   
		
		select NROVENDA from inserted

		select @vendedor =VENDEDOR from VENDAS where NROVENDA=(select NROVENDA from inserted) 

		select @comissao =COMISSAO from PRODUTO where CODIGO=(select CODIGO from inserted)

		select @nrovenda =NROVENDA from VENDASITEMS where NROVENDA=(select NROVENDA from inserted) 

		select @comissao =COMISSAO from VENDEDOR where CODIGO=(select CODIGO from inserted) 
 
			insert into COMISSAO (MOMENTO,VENDEDOR,VENDA,TIPOCOMISSAO,VALORCOMISSAO,STATUSCOMISSAO) 

			values (CURRENT_TIMESTAMP,@vendedor,@nrovenda,'p',@valortotal*@comissao,'A')
	
	end


	select *from COMISSAO

	select *from PRODUTO