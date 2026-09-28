INSERT INTO clientes (nome, cpf, email, telefone) VALUES
('Alexandre Santos','10000000001','alexandre@email.com','98990000001'),
('Bruno Silva','10000000002','bruno@email.com','98990000002'),
('Carlos Souza','10000000003','carlos@email.com','98990000003'),
('Daniel Oliveira','10000000004','daniel@email.com','98990000004'),
('Eduardo Lima','10000000005','eduardo@email.com','98990000005'),
('Felipe Costa','10000000006','felipe@email.com','98990000006'),
('Gabriel Rocha','10000000007','gabriel@email.com','98990000007'),
('Henrique Alves','10000000008','henrique@email.com','98990000008'),
('Igor Martins','10000000009','igor@email.com','98990000009'),
('Joao Pereira','10000000010','joao@email.com','98990000010'),
('Lucas Mendes','10000000011','lucas@email.com','98990000011'),
('Marcos Ribeiro','10000000012','marcos@email.com','98990000012'),
('Nathan Gomes','10000000013','nathan@email.com','98990000013'),
('Pedro Carvalho','10000000014','pedro@email.com','98990000014'),
('Rafael Ferreira','10000000015','rafael@email.com','98990000015');

INSERT INTO enderecos
(id_cliente, rua, numero, cidade, estado, cep) VALUES
(1,'Rua A','10','Sao Luis','MA','65000001'),
(2,'Rua B','20','Sao Luis','MA','65000002'),
(3,'Rua C','30','Sao Luis','MA','65000003'),
(4,'Rua D','40','Sao Luis','MA','65000004'),
(5,'Rua E','50','Sao Luis','MA','65000005'),
(6,'Rua F','60','Sao Luis','MA','65000006'),
(7,'Rua G','70','Sao Luis','MA','65000007'),
(8,'Rua H','80','Sao Luis','MA','65000008'),
(9,'Rua I','90','Sao Luis','MA','65000009'),
(10,'Rua J','100','Sao Luis','MA','65000010'),
(11,'Rua K','110','Sao Luis','MA','65000011'),
(12,'Rua L','120','Sao Luis','MA','65000012'),
(13,'Rua M','130','Sao Luis','MA','65000013'),
(14,'Rua N','140','Sao Luis','MA','65000014'),
(15,'Rua O','150','Sao Luis','MA','65000015');

INSERT INTO categorias (nome, descricao) VALUES
('Eletronicos','Produtos eletronicos'),
('Informatica','Computadores e perifericos'),
('Celulares','Smartphones'),
('Acessorios','Acessorios diversos'),
('Games','Produtos para jogos'),
('Moveis','Moveis para casa'),
('Eletrodomesticos','Produtos domesticos'),
('Livros','Livros diversos'),
('Esportes','Produtos esportivos'),
('Moda','Roupas e acessorios'),
('Beleza','Produtos de beleza'),
('Automotivo','Produtos automotivos'),
('Brinquedos','Brinquedos infantis'),
('Casa','Produtos para casa'),
('Audio','Produtos de audio');

INSERT INTO fornecedores (nome, cnpj, email) VALUES
('Tech Brasil','20000000000001','tech@email.com'),
('Info Store','20000000000002','info@email.com'),
('Mobile Center','20000000000003','mobile@email.com'),
('Game House','20000000000004','game@email.com'),
('Casa Mix','20000000000005','casa@email.com'),
('Mega Shop','20000000000006','mega@email.com'),
('Digital World','20000000000007','digital@email.com'),
('Smart Tech','20000000000008','smart@email.com'),
('Brasil Imports','20000000000009','imports@email.com'),
('Center Store','20000000000010','center@email.com'),
('Top Eletronicos','20000000000011','top@email.com'),
('Fast Supply','20000000000012','fast@email.com'),
('Master Shop','20000000000013','master@email.com'),
('Global Store','20000000000014','global@email.com'),
('Prime Distribuidora','20000000000015','prime@email.com');

INSERT INTO produtos
(id_categoria, id_fornecedor, nome, descricao, preco, estoque) VALUES
(1,1,'Televisao 50','Smart TV 50 polegadas',2500,20),
(2,2,'Notebook','Notebook 15 polegadas',3500,15),
(3,3,'Smartphone','Smartphone 128GB',1800,30),
(4,4,'Mouse','Mouse sem fio',80,50),
(5,5,'Controle','Controle para videogame',250,25),
(6,6,'Mesa','Mesa para escritorio',700,10),
(7,7,'Geladeira','Geladeira frost free',3200,8),
(8,8,'Livro SQL','Livro sobre SQL',90,40),
(9,9,'Bicicleta','Bicicleta esportiva',1200,12),
(10,10,'Camisa','Camisa masculina',100,50),
(11,11,'Perfume','Perfume importado',300,20),
(12,12,'Pneu','Pneu automotivo',450,16),
(13,13,'Boneco','Boneco colecionavel',150,25),
(14,14,'Cadeira','Cadeira para escritorio',500,18),
(15,15,'Fone','Fone bluetooth',200,35);

INSERT INTO pedidos
(id_cliente, id_endereco, status) VALUES
(1,1,'PAGO'),
(2,2,'ENVIADO'),
(3,3,'ENTREGUE'),
(4,4,'PENDENTE'),
(5,5,'PAGO'),
(6,6,'ENVIADO'),
(7,7,'ENTREGUE'),
(8,8,'PAGO'),
(9,9,'PENDENTE'),
(10,10,'ENVIADO'),
(11,11,'ENTREGUE'),
(12,12,'PAGO'),
(13,13,'PENDENTE'),
(14,14,'PAGO'),
(15,15,'ENVIADO');

INSERT INTO itens_pedido
(id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1,1,1,2500),
(2,2,1,3500),
(3,3,2,1800),
(4,4,2,80),
(5,5,1,250),
(6,6,1,700),
(7,7,1,3200),
(8,8,2,90),
(9,9,1,1200),
(10,10,3,100),
(11,11,1,300),
(12,12,2,450),
(13,13,2,150),
(14,14,1,500),
(15,15,2,200);

INSERT INTO pagamentos
(id_pedido, metodo, valor, status) VALUES
(1,'PIX',2500,'APROVADO'),
(2,'CARTAO',3500,'APROVADO'),
(3,'CARTAO',3600,'APROVADO'),
(4,'PIX',160,'PENDENTE'),
(5,'BOLETO',250,'APROVADO'),
(6,'PIX',700,'APROVADO'),
(7,'CARTAO',3200,'APROVADO'),
(8,'PIX',180,'APROVADO'),
(9,'CARTAO',1200,'PENDENTE'),
(10,'PIX',300,'APROVADO'),
(11,'BOLETO',300,'APROVADO'),
(12,'CARTAO',900,'APROVADO'),
(13,'PIX',300,'PENDENTE'),
(14,'CARTAO',500,'APROVADO'),
(15,'PIX',400,'APROVADO');

INSERT INTO cupons (codigo, desconto, validade) VALUES
('DESC5',5,'2026-12-31'),
('DESC10',10,'2026-12-31'),
('DESC15',15,'2026-12-31'),
('DESC20',20,'2026-12-31'),
('DESC25',25,'2026-12-31'),
('DESC30',30,'2026-12-31'),
('DESC7',7,'2026-12-31'),
('DESC12',12,'2026-12-31'),
('DESC18',18,'2026-12-31'),
('DESC22',22,'2026-12-31'),
('DESC27',27,'2026-12-31'),
('DESC32',32,'2026-12-31'),
('DESC35',35,'2026-12-31'),
('DESC40',40,'2026-12-31'),
('DESC50',50,'2026-12-31');

INSERT INTO transportadoras (nome, cnpj, telefone) VALUES
('Entrega Rapida','30000000000001','98991000001'),
('TransLog','30000000000002','98991000002'),
('Brasil Express','30000000000003','98991000003'),
('Mega Entregas','30000000000004','98991000004'),
('Fast Delivery','30000000000005','98991000005'),
('Logistica Brasil','30000000000006','98991000006'),
('Rota Express','30000000000007','98991000007'),
('Speed Cargo','30000000000008','98991000008'),
('TransBrasil','30000000000009','98991000009'),
('MoveLog','30000000000010','98991000010'),
('Entrega Mais','30000000000011','98991000011'),
('Carga Certa','30000000000012','98991000012'),
('Log Fast','30000000000013','98991000013'),
('Brasil Cargo','30000000000014','98991000014'),
('Prime Entregas','30000000000015','98991000015');

INSERT INTO avaliacoes
(id_cliente, id_produto, nota, comentario) VALUES
(1,1,5,'Excelente produto'),
(2,2,4,'Muito bom'),
(3,3,5,'Produto excelente'),
(4,4,4,'Bom produto'),
(5,5,5,'Muito bom'),
(6,6,4,'Gostei'),
(7,7,5,'Excelente'),
(8,8,4,'Boa compra'),
(9,9,5,'Muito bom'),
(10,10,3,'Produto razoavel'),
(11,11,5,'Excelente'),
(12,12,4,'Bom produto'),
(13,13,5,'Gostei bastante'),
(14,14,4,'Boa cadeira'),
(15,15,5,'Som excelente');