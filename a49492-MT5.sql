--
-- Trabalho : MT5
--
-- CRIACAO DA BASE DE DADOS
--
-- Tabela dos clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Morada VARCHAR(255),
    Localidade VARCHAR(100),
    CodigoPostal VARCHAR(20),
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);

-- Tabela de pagamentos
CREATE TABLE Pagamentos (
    PagamentoID INT PRIMARY KEY,
    TipoPagamento VARCHAR(50)
);

-- Tabela de produtos
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Descricao TEXT,
    Preco DECIMAL(10, 2),
    Categoria VARCHAR(50),
    IVA DECIMAL(5, 2)
);

-- Tabela das encomendas
CREATE TABLE Encomendas (
    EncomendaID INT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE,
    DataPronta DATE,
    DataEnviada DATE,
    PagamentoID INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (PagamentoID) REFERENCES Pagamentos(PagamentoID)
);

-- Tabela EncomendaProdutos 
CREATE TABLE EncomendaProdutos (
    EncomendaID INT,
    ProdutoID INT,
    Quantidade INT,
    FOREIGN KEY (EncomendaID) REFERENCES Encomendas(EncomendaID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID),
    PRIMARY KEY (EncomendaID, ProdutoID)
);
--
-- INSERCAO DE DADOS
--

-- Inserção de Clientes
INSERT INTO Clientes (ClienteID, Nome, Morada, Localidade, CodigoPostal, Email, Telefone)
VALUES 
(1, 'João Paulo', 'Largo de Santa Luzia', 'Lisboa', '1100-487', 'paulinho@gmail.com', '912761398');

-- Inserção de Tipos de Pagamento
INSERT INTO Pagamentos (PagamentoID, TipoPagamento)
VALUES 
(1, 'MB'),
(2, 'VISA'),
(3, 'PayPal');

-- Inserção de Produtos
INSERT INTO Produtos (ProdutoID, Nome, Descricao, Preco, Categoria, IVA)
VALUES 
(1, 'Macieira Cream garrafa', 'Bebidas espirituosas', 18.00, 'Categoria 1', 23.00),
(2, 'T-shirt Gant', 'Roupa', 40.00, 'Categoria 2', 13.00);

-- Inserção de Encomendas
INSERT INTO Encomendas (EncomendaID, ClienteID, DataPedido, DataPronta, DataEnviada, PagamentoID)
VALUES 
(123, 1, '2024-05-20', '2024-05-22', '2024-05-23', 2);

-- Inserção de Produtos na Encomenda
INSERT INTO EncomendaProdutos (EncomendaID, ProdutoID, Quantidade)
VALUES 
(123, 1, 2), -- 2 Garrafas de macieira cream
(123, 2, 1); -- 1 T-shirt

--
--  CRIACAO E VISUALIZACAO DA ENCOMENDA
--

-- Consulta para extrair a informação relacionada com a encomenda 123
SELECT 
    e.EncomendaID,
    e.DataPedido,
    e.DataPronta,
    e.DataEnviada,
    c.Nome AS NomeCliente,
    c.Morada,
    c.Localidade,
    c.CodigoPostal,
    c.Email,
    c.Telefone,
    p.TipoPagamento,
    ep.ProdutoID,
    pr.Nome AS NomeProduto,
    pr.Descricao,
    ep.Quantidade,
    pr.Preco,
    pr.IVA,
    (ep.Quantidade * pr.Preco) AS Subtotal,
    ((ep.Quantidade * pr.Preco) * (1 + pr.IVA / 100)) AS TotalComIVA
FROM 
    Encomendas e
JOIN 
    Clientes c ON e.ClienteID = c.ClienteID
JOIN 
    Pagamentos p ON e.PagamentoID = p.PagamentoID
JOIN 
    EncomendaProdutos ep ON e.EncomendaID = ep.EncomendaID
JOIN 
    Produtos pr ON ep.ProdutoID = pr.ProdutoID
WHERE 
    e.EncomendaID = 123;
