-- mosrtar tabela utilizando database ecommerce:
show tables;

-- selecionar todos os dados da tabela:
select * from (nome da tabela);

-- caso queira inserir uma ordem de apresentação da tabela inserir order by:
select * from (nome da tabela) order by (nome do field);

select * from clients order by Fname; -- ordena pela id do cliente de 1 a 6 no nosso exemplo

-- inserir dados na tabela:
insert into (nome da tabela) values;

-- descrever o conteúdo da tabela (campo e nomes dos campos, o tipo de cada campo, a chave e demais informações)
desc (nome da tabela);
select * from product;
select * from payments;
desc product;

-- selecionar item da tabela onde existe determinada informação por exemplo selecionar da tabela orders (pedidos) 
-- o id do pedido e o status deste pedido onde está como confirmado:

select idOrder, orderStatus from orders where orderStatus = 'confirmado';

select idOrder, orderDescription, orderStatus from orders where orderStatus = 'Em processamento' order by idorder;

select count(*) from clients;
        
select * from clients c, orders o where c.idClient = idOrderClient;

select Fname, Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOrderClient;
           
select concat(Fname, '  ',Lname) as client, idOrder as request, orderStatus as status from clients c, orders o where c.idClient = idOrderClient;

select * from clients c, orders o where c.idClient = idOrderClient
group by idOrder;

select * from productorder;
select * from Orders;

select * from clients
	left outer join orders on idClient = idOrderClient;

-- estando as tabelas linkadas por alguma chave é possível mostrar dados de ambas
-- por exemplo mostrar o nome do comprador da tabela clientes e o status do pedido da tabela pedidos 

select fname, orderStatus from clients join orders where idClient = idOrderClient;

-- recuperar quantos pedidos foram realizados pelos clientes?
select c.idClient, Fname, count(*) as Number_of_orders from clients c inner join orders o on c.idClient = o.idOrderClient
		                inner join productOrder p on p.idPoOrder = o.idOrderClient
                        group by idClient;