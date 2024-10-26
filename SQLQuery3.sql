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

 Select Distinct Nome
 FROM Ciclista C, Organizacao O
 WHERE C.IDC = 0.IDC
 AND 0.Funcao = 'Organizador'
 AND C.IDC NOT IN (SELECT P.IDC FROM Participacao P WHERE P.IDE = 0.IDE)
                   

