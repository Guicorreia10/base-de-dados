--8. SELECT DISTINCT Nome_Local FROM Lugar 
--10SELECT C.Nome,C.Idade, L.Nome_Local From Ciclista C,Lugar L
--10where L.IDL = IDL_Residencia

--11SELECT DISTINCT C.Nome,C.Idade, L.Nome_Local From Ciclista C,Lugar L
--11where L.IDL = IDL_Residencia

--12SELECT DISTINCT C.Nome,C.Idade, L.Nome_Local From Ciclista C
--12INNER JOIN Lugar L ON L. IDL = C.IDL_Residencia

--13SELECT L.IDL,L.Nome_Local,C.Nome FROM Lugar L
--13LEFT JOIN Ciclista C ON (C.IDL_Residencia = L.IDL)

/*14SELECT DISTINCT IDC
FROM Organizacao
WHERE Funcao = 'Coordenador'
Intersect
SELECT IDC
FROM Organizacao
WHERE Funcao = 'Organizador'*/

/*SELECT Distinct B1.Modelo
From Bicicleta B1, Bicicleta B2
WHERE B1.Modelo = B2.Modelo
 And B1.IDC <> B2.IDC*/

 /*Select Distinct Nome
 FROM Ciclista C, Organizacao O
 WHERE C.IDC = 0.IDC
 AND 0.Funcao = 'Organizador'
 AND C.IDC NOT IN (SELECT P.IDC FROM Participacao P WHERE P.IDE = 0.IDE)*/


/*SELECT
	FROM Evento E
	WHERE ( SELECT IDL
	FROM Percurso
	WHERE IDE= E.IDE
	AND Ordem= (SELECT MAX (Ordem)
	FROM Percurso WHERE IDE = E.IDE))

(SELECT IDL FROM Percurso
*/

/*38SELECT*
FROM Evento E
WHERE(SELECT Count(DISTINCT IDL)
FROM Percurso
WHERE E.IDE = IDE) >5*/


/*
39SELECT IDE, Count(*) as N_Locais
From Percurso
GROUP BY IDE*/

/*SELECT DISTINCT IDE, Count(*) as N_Locais
From Percurso
GROUP BY IDE*/

/*40SELECT IDE, COUNT(*) as NPART, SUM(Valor_Inscricao) as receita
FROM Participacao
GROUP BY IDE ORDER BY SUM (Valor_Inscricao) DESC*/

/*42SELECT IDE, COUNT(*) as NPART, SUM(Valor_Inscricao) as receita
FROM Participacao
GROUP BY IDE 
HAVING Count(IDC) > 5
ORDER BY Receita DESC*/


/*SELECT C.Nome AS Nome_Ciclista
FROM Ciclista C
JOIN (
    SELECT IDC, COUNT(*) AS Total_Bicicletas
    FROM Bicicleta
    GROUP BY IDC
    HAVING COUNT(*) > 3
) AS B ON C.IDC = B.IDC;*/

/*SELECT IDE
FROM Evento
WHERE Dificuldade = (SELECT MAX(Dificuldade))*/


