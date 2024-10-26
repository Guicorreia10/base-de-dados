-- TRABALHO: MT2--
--
--RESPOSTA QUESTÃ0 5.1--
SELECT produto.idp, produto.nome FROM produto
LEFT JOIN compras ON produto.idp = compras.idp
GROUP BY produto.idp, produto.nome
HAVING COUNT(compras.idc) < 10;

--Resposta	Questão 5.2--
SELECT c.nome, c.nif, c.telemovel FROM comprador c
WHERE c.telemovel LIKE '21%' OR c.telemovel LIKE '22%' AND c.idc IN (
SELECT idc FROM compras
 WHERE idp IN (SELECT idp FROM stock
 WHERE  preco = (  SELECT  MAX(preco)FROM  stock  )
            )
    )
GROUP BY  c.nome,  c.nif,  c.telemovel
ORDER BY COUNT(*) DESC;

--RESPOSTA QUESTÃO 5.3--
SELECT v.nome AS nomedovendedor, p.nome AS nomedoproduto, p.descricao AS descricaodoproduto, s.quantidade AS quantidadeemstock
FROM vendedor v
JOIN stock s ON v.idv = s.idv
JOIN produto p ON s.idp = p.idp
ORDER BY s.quantidade DESC;


--Resposta Questão 5.4
SELECT v.nome AS nomeDOvendedor, SUM(s.quantidade * s.preco * (1 + p.taxa_iva)) AS faturacao_total
FROM vendedor v
JOIN  stock s ON v.idv = s.idv
JOIN produto p ON s.idp = p.idp
JOIN compras c ON s.idp = c.idp AND s.idv = c.idv
GROUP BY v.nome
ORDER BY faturacao_total DESC;

--RESPOSTA QUESTÃO 5.5--
SELECT p.nome AS nomeDOproduto,  SUM(c.quantidade) AS quantidade_vendida
FROM  produto p
LEFT JOIN compras c ON p.idp = c.idp
GROUP BY  p.nome
ORDER BY  quantidade_vendida ASC;