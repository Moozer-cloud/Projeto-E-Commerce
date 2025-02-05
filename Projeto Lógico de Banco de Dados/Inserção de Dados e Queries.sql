-- Inserção de Dados e Queries - Projeto E-Commerce

use ecommerce;
show tables;

-- Cliente
-- idClient / FName / Minit / Lname / CPF / Address / Bdate
insert into Clients ( Fname, Minit, Lname, CPF, Address, Bdate)
	values('Moozer','C','Veiga', 11111111111,'BR116 Km39, Vila do Pião - SJ','1991-12-25'),
		  ('Madalena','C','Veiga',22222222222, 'BR116 Km39, Vila do Pião - SJ','1965-01-03'),
		  ('Hadassa','A','Fernandes',33333333333, 'Vila Nova, Vila do Pião - Sap','2003-11-25'),
		  ('Igor','S','Ferreira',44444444444, 'R Delphin Morreira, Várzea - TRS','2000-01-01'),
		  ('Marina','O','Silva',55555555555, 'R Rio Grande do Norte, Araras - TRS','1995-02-05'),
		  ('João','P','Silveira',66666666666, 'R Conceição Martins, Barra do Imbuí - TRS','2005-05-20');

select idClient as Identificação_Cliente, concat(Fname, ' ', Minit, ' ', Lname) as Nome_Usuário, CPF, Address as Endereço, Bdate as Data_Nascimento from Clients
	order by (CPF);

-- Produto
-- idProduct / Pname / Classification_Kids / Category ('Moda', 'Eletrônico', 'Móveis', 'Hobbies', 'Alimentos', 'Tecnologia') / Assessment / Size / Price
insert into Product (Pname, Classification_Kids, Category, Assessment, Size, Price)
	values('Camisa Nike P', false,'Moda','4',null,'80.50'),
		  ('iPhone 16 Pro 512Mb', false,'Eletrônico','5',null ,'9500'),
          ('Cama BOX', false,'Móveis','3','50x150x200','1599.99'),
          ('Carabina PCP M25 Thumder Black', false,'Hobbies','5',null ,'3568.99'),
          ('Piscina de Plástico', true,'Hobbies','3','35x300x300','555'),
          ('Whey Protein Morango', false,'Alimentos','4',null ,'160.99'),
          ('Barra de Chocolate', true,'Alimentos','5',null ,'9.99'),
          ('Drone 4k', false,'Tecnologia','2',null ,'550.50');

select * from Product;

-- Cartão
-- idCard / CPF / NumCard / TypeCard (Crédito ou Débito) / NameCard / DateCard / SecurityCode
insert into Card (CPFcard, NumCard, TypeCard, NameCard, DateCard, SecurityCode)
	values('11111111111','1111111111111111','Crédito','Moozer C Veiga','2030-11-01','123'),
		  ('33333333333','2222222222222222','Crédito','Hadassa A Fernandes','2031-11-01','456'),
          ('55555555555','3333333333333333',Default,'Marina O Silva','2032-11-01','789');

select * from Card;

-- Pagamento
-- idPayment / idClient / idCard / TypePayment (PIX ou Boleto)
insert into Payments (idClient, idCard, TypePayment)
	values('1', '1', null),
		  ('3', '3', null),
          ('5', null, 'PIX'),
          ('6', null, 'Boleto');

select * from Payments;

-- Entrega
-- idDelivery / DeliveryStatus (Em processamento, cancelado, confirmado, enviado, entregue)
insert into Delivery (DeliveryStatus)
	values('Enviado'),
		  ('Confirmado'),
          (default),
          ('Entregue');

select * from Delivery;
          
-- Pedido
-- idOrder / idOrderClient / idDelivery / OrderDescription / SendValue / Paymentcash (defaul)
insert into Orders (idOrderClient, idDelivery, OrderDescription, SendValue, Paymentcash)
	values('1', '1', 'Compra via App', '0', '0'),
		  ('3', '2', 'Compra via App', '15', '1'),
          ('5', '3', 'Compra via Web Site', '20', '1'),
          ('6', '4', 'Compra via Web Site', default, '0');

select * from Orders;
select concat(Fname, ' ', Minit, ' ', Lname) as Nome_Usuário, CPF, OrderDescription from clients as C, Orders as O
	where c.idClient = idOrderClient;
    
select count(*) from clients as C, Orders
	where c.idClient = idOrderClient;
	
-- Estoque
-- idProdStorage / StorageLocation / Quantify
insert into ProductStorage (StorageLocation, Quantify)
	values('Rio de Janeiro', 500),
		  ('Rio de Janeiro', 750),
          ('Rio de Janeiro', 250),
          ('Rio de Janeiro', default);

select * from ProductStorage;

-- Produto em Estoque (Loc.)
-- idStock / idProductST / Address
insert into ProductStock (idStock, idProductST, Address)
	values(1, 10,'Avenida Brasil - Rio de Janeiro'),
		  (2, 11,'Avenida Lúcio Meira - Teresópolis'),
          (3, 15,'Avenida Ipiranga - Petrópolis'),
          (4, 13,'Avenida Alberto Braune - Friburgo');

select * from ProductStock;

-- Fornecedor
-- idSupplier / SocialName / CNPJ / Contact
insert into Supllier (SocialName, CNPJ, Contact)
	values('Alegria & Alegria', '111111111111111', '11111111111'),
		  ('Comprou Sorriu', '222222222222222', '22222222222'),
          ('Eletrônicos Ferreira', '333333333333333', '33333333333'),
          ('Móveis Sempre', '444444444444444', '44444444444'),
          ('Loja 3 Irmãos', '555555555555555', '55555555555');

select * from Supllier;

-- Vendedor PJ
-- idSellerPJ / CNPJ / SocialName / TradeName / Address / Contact / StartDate
insert into SellerPJ (CNPJ, SocialName, TradeName, Address, Contact, StartDate)
	values('111111111111112', 'Catão Alegria', 'CA', 'Avenida Lúcio Meira - Teresópolis', '11111111112', '2000-01-01'),
		  ('111111111111113', 'Super Promo', 'SP', 'Avenida Ipiranga - Petrópolis', '11111111113', '2001-01-01'),
          ('111111111111114', 'Loja Godoi', 'LG', 'Avenida Brasil - Rio de Janeiro', '11111111114', '2002-01-01');

select * from SellerPJ;

-- Vendedor PF
-- idSellerPF / CPF / TradeName / Address / Contact / StartDate
insert into SellerPF (CPF, TradeName, Address, Contact, StartDate)
	values('11111111112', 'Roberto Augusto', 'Avenida Brasil - Rio de Janeiro', '21111111111', '2000-01-01'),
		  ('11111111113', 'Lilian Sobrinho', 'Avenida Brasil - Rio de Janeiro', '31111111111', '2001-01-01'),
          ('11111111114', 'Martins Filho', 'Avenida Lúcio Meira - Teresópolis', '41111111111', '2002-01-01'),
          ('11111111115', 'Juarez Junior', 'Avenida Ipiranga - Petrópolis', '51111111111', '2000-01-01'),
          ('11111111116', 'Alberto Roberto', 'Avenida Alberto Braune - Friburgo', '61111111111', '2001-01-01');

select * from SellerPF;

-- Vendedor Terceiro
-- idSeller / idSellerPJ / idSellerPF
insert into Seller (idSellerPJ, idSellerPF)
	values('1', null),
		  ('2', null),
          ('3', null),
          (null, '1'),
          (null, '2'),
          (null, '3'),
          (null, '4'),
          (null, '5');

select * from Seller;

-- Produtos por Terceiros
-- idProductSeller / idProduct / QuantifyProduct
insert into ProductSeller (idProductSeller, idProduct, QuantifyProduct)
	values(1, 9, 100),
		  (1, 10, 50),
          (2, 11, 40),
          (3, 12, 600),
          (4, 13, default),
          (5, 14, default),
          (6, 15, 13),
          (7, 16, 5),
          (8, 15, 322);

select * from ProductSeller;

-- Produto Fornecedor
-- idProductSU / idPSupplier / ProdQuantify
insert into ProductSupplier (idProductSU, idPSupplier, ProdQuantity)
	values(9 ,1 , 10),
		  (10 ,1 , 5),
          (11 ,2 , 100),
          (12 ,2 , default),
          (13 ,3 , 9),
          (14 ,4 , 520),
          (15 ,5 , 120),
          (16 ,5 , 110);

select * from ProductSupplier;

-- Relação Produto/Pedido
-- idProductO / idOrderP / PoQuantity / StatusRPP (Disponível. Fora de Estoque)
insert into ProductOrder (idProductO, idOrderP, PoQuantity, StatusRPP)
	Values(9, 1, 1, default),
		  (10, 2, 2, default),
          (11, 4, 2, default),
          (12, 3, 1, default),
          (13, 3, 1, default),
          (14, 3, 3, default),
          (15, 4, 1, default),
          (16, 2, 2, default);

select * from ProductOrder;

select * from clients left outer join orders on idClient = idOrderClient;

select * from Orders;
-- Pedidos foram realizados pelos Clientes
select * from clients as C 
	inner join Orders as O on C.idClient = O.idOrderClient
	inner join ProductOrder as P on P.idOrderP = O.idOrder;
