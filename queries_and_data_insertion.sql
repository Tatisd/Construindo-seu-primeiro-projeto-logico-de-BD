desc clients;

show tables;

select * from clients;

desc clients;

insert into clients (Fname, Minit, Lname, CPF, Address)
values  ('Maria', 'M', 'Silva', 123467891, 'rua silva 29, Carangola - Cidade das Flores'),
		('Matheus', 'O', 'Pimentel', 987654321, 'rua alameda 289, Centro - Cidade das Flores'),
        ('Ricardo', 'F', 'Silva', 45678913, 'avenida vinha 109,  Centro - Cidade das Flores'),
        ('Julia', 'S', 'França', 789123456, 'rua lareijras 861,  Centro - Cidade das Flores'),
        ('Roberta', 'G', 'Assis', 98745631, 'avenida koller 19,  Centro - Cidade das Flores'),
        ('Isabela', 'M', 'Cruz', 654789123, 'rua alameda das flores 28,  Centro - Cidade das Flores');
        
insert into clients (Fname, Minit, Lname, CPF, Address) values    ('Isabela', 'M', 'Cruz', 654789123, 'alameda das flores 28,  Centro - Cidade das Flores');
        
insert into product (Pname, Classification_kids, Category, avaliação, size) 
values	('Fone de ouvido', false, 'Eletrônico', '4', null),
        ('Barbie Elsa',  true, 'Brinquedos', '3', null),
        ('Body Carters', true, 'Vestuário', '5', null),
        ('Microfone Vedo - Youtuber', false, 'Eletrônico', '4', null),
        ('Sofá Retrátil', false, 'Móveis', '3', '3x57x80'),
        ('Farinha de Arroz', false, 'Alimentos', '2', null),
        ('Fire Stick Amazon', false, 'Eletrônico', '3', null);
        
select * from product;	

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
values  (1, default, 'compra via aplicativo', null, 1),
		(2, default, 'compra via aplicativo', 50, 0),
        (3, 'confirmado', null, null, 1),
        (4, default, 'compra via web site', 150, 0);
        
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
		(2, default, 'compra via aplicativo', null, 1);
        
select * from orders;

insert into productOrder (idPoProduct, idPoOrder, poQuantity, poStatus)
values  (1, 1, 2, null),
		(2, 1, 1, null),
        (3, 2, 1, null);
        
        
        
select * from productOrder;

insert into productStorage (StorageLocation, Quantity)
values  ('Rio de Janeiro', 1000),
		('Rio de Janeiro', 500),
        ('São Paulo', 10),
        ('São Paulo', 100),
        ('São Paulo', 10),
        ('Brasília', 60);
        
select * from productStorage;

insert into storageLocation (idLProduct, idLStorage, Location)
values  (1, 2, 'RJ'),
		(2,6,'GO');
        
select * from storageLocation;

insert into supplier (SocialName, CNPJ, Contact)
values  ('Almeida e filhos', 123456789123456, '21985474'),
		('letrônicos Silva', 854519649143457, '21985484'),
        ('Eletrônicos Valma', 934567893934695, '21975474');

select * from supplier;

insert into productSupplier (idPsSupplier, idPsProduct, Quantity)
values  (1, 1, 500),
		(1, 2, 400),
        (2, 4, 633),
        (3, 3, 5),
        (2, 5, 10);

select * from productSupplier;

insert into seller (SocialName, AbstName, CNPJ, CPF, Location, Contact)
values  ('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
		('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 21957895),
        ('Kids World', null, 456789123654485, null, 'São Paulo', 11986574840);
        
select * from seller;

insert into productSeller (idPSeller, idProduct, ProdQuantity)
values  (1, 6, 80),
		(2, 7, 10);
        
select * from  productSeller;

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
 
 
-- recuperar quantos pedidos foram realizados pelos clientes?
select c.idClient, Fname, count(*) as Number_of_orders from clients c inner join orders o on c.idClient = o.idOrderClient
		                inner join productOrder p on p.idPoOrder = o.idOrderClient
                        group by idClient;