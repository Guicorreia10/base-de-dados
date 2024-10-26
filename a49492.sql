
-- Trabalho : MT1

--Resposta Questão 5.1

SELECT 
    (SELECT Nome FROM Ciclista WHERE IDC = O.IDC) AS Ciclista, O.Funcao,
    (SELECT Nome_Evento FROM Evento WHERE IDE = O.IDE) AS Rota, O.IDE
FROM Organizacao O
WHERE O.IDE IN (SELECT IDE FROM Evento WHERE Tipo_Evento = 'Passeio');


--Resposta questão 5.2

SELECT * FROM Ciclista
WHERE Telefone LIKE '92%' OR (Telefone IS NULL AND Email IS NOT NULL);


-- Resposta questão 5.3

SELECT E.IDE AS IDT, E.Data_Evento AS Data_Tour, E.Nome_Evento AS Designacao, P.IDL, 
       (SELECT Nome_Local FROM Lugar WHERE IDL = P.IDL) AS Lugar,
       (SELECT Info FROM Lugar WHERE IDL = P.IDL) AS Informação
FROM Evento E, Percurso P WHERE E.IDE = P.IDE 
  AND P.IDL IN (
    SELECT IDL 
    FROM Lugar 
    WHERE Nome_Local LIKE 'Barr%' 
      AND Info IS NOT NULL
  );


  -- Resposta Questão 5.4



SELECT nome, IDL_residencia FROM TblCiclista
WHERE DATEDIFF( Year,Data_nascimento, Getdate()) < 18


-- Resposta 5.5

SELECT C.IDC, C.nome AS Ciclista, C.IDL_residencia AS Onde_vive, DATEDIFF(YEAR, C.Data_nascimento, GETDATE()) AS Idade, 
    (SELECT C1.nome FROM TblCiclista AS C1 WHERE C1.IDC = (SELECT IDC_A FROM TblParente WHERE IDC_B = C.IDC AND Tipo LIKE 'Mae')) AS Nome_Mae FROM TblCiclista AS C
WHERE DATEDIFF(YEAR, C.Data_nascimento, GETDATE()) < 18;


 