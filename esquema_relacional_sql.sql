create database ecommerce;

use ecommerce;

-- criar tabela cliente
CREATE TABLE clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(50),
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);
desc clients;

alter table clients auto_increment = 1;

drop table clients;

-- criar tabela produto
-- size  = dimensão do produto
CREATE TABLE product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(30) NOT NULL,
    Classification_kids BOOL DEFAULT FALSE,
    Category ENUM('Eletronico', 'Vestuário', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,
    avaliação FLOAT DEFAULT 0,
    size VARCHAR(10)
);

drop table product;
desc product;


-- criar tabela pedido
-- para ser continuado no desafio
CREATE TABLE payments (
    idClient INT,
    idPayment INT,
    typePayment ENUM('Boleto', 'Cartão', 'Dois cartões'),
    limitAvaiable FLOAT,
    PRIMARY KEY (idClient , idPayment)
);


-- criar tabela pedido
CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    orderStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
    orderDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 10,
    paymentCash BOOL DEFAULT FALSE,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient)
        REFERENCES clients (idClient)
);

drop table orders;
desc orders;
-- criar tabela estoque
CREATE TABLE productStorage (
    idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    StorageLocation VARCHAR(255),
    Quantity INT DEFAULT 0
);

-- criar tabela fornecedor
CREATE TABLE supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    Contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

desc supplier;

-- criar a tabela vendedor
CREATE TABLE Seller (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    AbstName VARCHAR(255),
    CNPJ CHAR(15),
    CPF CHAR(9),
    Location VARCHAR(255),
    Contact CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);

drop table productseller;
-- criar tabela produto_vendedor
CREATE TABLE productSeller (
    idPSeller INT,
    idProduct INT,
    ProdQuantity INT DEFAULT 1,
    PRIMARY KEY (idPSeller , idProduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPSeller)
        REFERENCES Seller (idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idProduct)
        REFERENCES Product (idProduct)
);

desc productSeller;


drop table productOrder;

CREATE TABLE productOrder (
    idPoProduct INT,
    idPoOrder INT,
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPoProduct , idPoOrder),
    CONSTRAINT fk_productorder_seller FOREIGN KEY (idPoProduct)
        REFERENCES product (idProduct),
    CONSTRAINT fk_productorder_product FOREIGN KEY (idPoOrder)
        REFERENCES orders (idOrder)
);

CREATE TABLE storageLocation (
    idLProduct INT,
    idLStorage INT,
    Location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idLProduct , idLStorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (idLProduct)
        REFERENCES product (idProduct),
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLStorage)
        REFERENCES productStorage(idProdStorage)
);

CREATE TABLE productSupplier (
    idPsSupplier INT,
    idPsProduct INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (idPsSupplier , idPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier)
        REFERENCES supplier (idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct)
        REFERENCES product (idProduct)
);


show tables;