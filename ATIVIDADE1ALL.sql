CREATE DATABASE Atividade1;

USE Atividade1;

CREATE TABLE Departamento(
	IdDepto INT NOT NULL PRIMARY KEY,
	NomeDepto VARCHAR(15) NOT NULL,
	Gerente INT NOT NULL,
	Divisao VARCHAR(10) NOT NULL,
	Local VARCHAR(15)
);

CREATE TABLE Empregado(
	IdEmpregado INT NOT NULL PRIMARY KEY,
	NomeEmpregado VARCHAR(20),
	IdDepto INT NOT NULL,
	Cargo VARCHAR(6) NOT NULL,
	Tempo_Emp INT NULL,
	Salario DECIMAL(10,2) NULL,
	Comissao DECIMAL(10,2) NULL
);


INSERT INTO Departamento 
VALUES(1, 'Administrativo', 2, 'Leste', 'S�o Paulo' ),
	  (2, 'Log�stico', 4, 'Sul', 'Minas Gerais'),
	  (3, 'Jur�dico', 1, 'Sudeste', 'Espirito Santo'),
	  (4, 'Comercial', 4, 'Oeste', 'Rio de Janeiro'),
	  (5, 'Marketing', 4, 'Norte', 'S�o Paulo')

SELECT * FROM Departamento; 

INSERT INTO Empregado 
VALUES	( 1, 'Lucas Silva', 2, 'VENDAS', 2, 1570, 100),  
		( 2, 'Jo�o Pereira', 3, 'ADV', 6, 7600, 290),
		( 3, 'Douglas Aguiar', 5, 'GER', 1.6, 5400, 580),  
		( 4, 'Diego Souza', 4, 'ATEND', 0.7, 1800, 900),  
		( 5, 'Marcelo Lomba', 2, 'VENDAS', 5, 9800, 355),  
		( 6, 'Anna Alvarez', 4, 'GER', 1.7, 1200, 1200),  
		( 7, 'Neymar Jr', 5, 'ADM', 0.5, 5570, 435),  
		( 8, 'Thiago Neves', 1, 'GER', 5, 7570, 432),  
		( 9, 'Jo�o Paulo', 3, 'ADV', 4, 8570, 876),  
		( 10, 'Kauan Rodrigo', 5, 'GER', 2, 1770, 873),
		( 11, 'Casimiro Ant�nio', 3, 'Fiscal', 9, 9070, 257),
		( 12, 'Yeferson Soteldo', 1, 'ADM', 3, 3800, 573),
		( 13, 'Gabriel Barbosa', 5, 'ATEND', 0.8, 1870, 873),
		( 14, 'Lucas Paquet�', 5, 'ATEND', 2, 1600, null),
		( 15, 'Lionel Messias', 2, 'VENDAS', 1, 2070, 1873) 

SELECT * FROM Empregado;

-- 1.Lista Nome e sal�rio de todos os Empregados.

SELECT NomeEmpregado, Salario 
FROM Empregado;

-- 2.Lista Nome e Local de todos os Departamentos.

SELECT NomeDepto, Local 
FROM Departamento; 

-- 3.Lista Nome, sal�rio e comiss�o dos Empregados com salario maior que 1.800

SELECT NomeEmpregado, Salario, Comissao 
FROM Empregado
WHERE Salario > 1800;

-- 4.Lista Nome, divis�o e Local dos Departamentos da divis�o SUL. 

SELECT NomeDepto, Divisao, Local 
FROM Departamento
WHERE Divisao = 'Sul';

-- 5.Lista Nome, departamento, salario e cargo dos Empregados com cargo GER e sal�rio menor que 2.000.

SELECT E.NomeEmpregado, D.NomeDepto, E.Salario, E.Cargo 
FROM Empregado as E JOIN Departamento as D
ON E.IdDepto = D.IdDepto
WHERE E.Cargo = 'GER' AND E.Salario < 2000;

-- 6.Lista todos os dados dos Empregados com cargo ATEND ou sal�rio entre 1.800 e 2.000.

SELECT * FROM Empregado
WHERE Cargo = 'ATEND' or Salario BETWEEN 1800 AND 2000;

-- 7.Lista Nome, Sal�rio, comiss�o e remunera��o total (Sal�rio + Comiss�o) de todos os empregados. 

SELECT NomeEmpregado, Salario, Comissao, (Salario + Comissao) as 'RemuneracaoTotal'
FROM Empregado;

-- 8.Lista Nome, Sal�rio, comiss�o e remunera��o total (Sal�rio + Comiss�o) de todos os empregados com sal�rio maior que 2.000 ou comiss�o maior que 700.

SELECT NomeEmpregado, Salario, Comissao, (Salario + Comissao) as 'RemuneracaoTotal'
FROM Empregado
WHERE Salario > 2000 or Comissao > 700;

-- 9.Lista Nome, Sal�rio, comiss�o e remunera��o total de todos os empregados com remunera��o total menor que 1.800. 

SELECT NomeEmpregado, Salario, Comissao, (Salario + Comissao) as RemuneracaoTotal
FROM Empregado
GROUP BY NomeEmpregado, Salario, Comissao
HAVING (Salario + Comissao) < 1800;

-- 10.Lista Nome e cargo dos Empregados que o nome comece com a letra D.

SELECT NomeEmpregado, Cargo 
FROM Empregado
WHERE NomeEmpregado LIKE 'D%';

-- 11.Lista Nome e cargo dos Empregados que o nome tenha N como terceira letra.

SELECT NomeEmpregado, Cargo 
FROM Empregado
WHERE NomeEmpregado LIKE '__n%';

-- 12.Lista Nome e cargo dos Empregados que o nome tenha N (mai�scula ou min�scula) como terceira letra 

SELECT NomeEmpregado, Cargo 
FROM Empregado
WHERE NomeEmpregado LIKE '__N%';

-- 13. Lista Nome, Sal�rio, comiss�o e remunera��o total  (Sal�rio + Comiss�o) de todos os empregados com sal�rio maior que 2.000 ou comiss�o maior que 800. Apresenta o resultado classificado em ordem alfab�tica de nome.

SELECT NomeEmpregado, Salario, Comissao, (Salario + Comissao) as 'RemuneracaoTotal' 
FROM Empregado
WHERE Salario > 2000 OR Comissao > 800
ORDER BY NomeEmpregado ASC;

-- 14.Lista Nome, Sal�rio, comiss�o e remunera��o total (Sal�rio + Comiss�o) de todos os empregados com sal�rio maior que 2.000 ou comiss�o maior que 800.
--  Apresenta o resultado classificado em ordem crescente de salario.

SELECT NomeEmpregado, Salario, Comissao, (Salario + Comissao) as 'RemuneracaoTotal'
FROM Empregado
WHERE Salario > 2000 OR Comissao > 800
ORDER BY Salario ASC;

-- 15.Lista Nome, Sal�rio, comiss�o e remunera��o total (Sal�rio + Comiss�o)  de todos os empregados com sal�rio maior que 2.000 ou comiss�o maior que 800. 
-- Apresenta o resultado classificado em ordem decrescente de salario.

SELECT NomeEmpregado, Salario, Comissao, (Salario + Comissao) as 'RemuneracaoTotal'
FROM Empregado
WHERE Salario > 2000 OR Comissao > 800
ORDER BY Salario DESC;

-- 16.Lista Nome, Sal�rio, comiss�o e remunera��o total (Sal�rio + Comiss�o) de todos os empregados com sal�rio maior que 2.000 ou comiss�o maior que 800. 
-- Apresenta o resultado classificado em ordem crescente de remunera��o total

SELECT NomeEmpregado, Salario, Comissao, (Salario + Comissao) as 'RemuneracaoTotal'
FROM Empregado
WHERE Salario > 2000 OR Comissao > 800
ORDER BY RemuneracaoTotal ASC;

-- 17.Lista Nome, Sal�rio, comiss�o e remunera��o total de todos os empregados com sal�rio maior que 2.000 ou comiss�o maior que 800. 
-- Apresenta o resultado classificado em ordem crescente de departamento e em cada departamento, em ordem decrescente de salario. 

SELECT E.NomeEmpregado, E.Salario, E.Comissao, (E.Salario + E.Comissao) as 'RemuneracaoTotal'
FROM Empregado as E JOIN Departamento as D
ON E.IdDepto = D.IdDepto
WHERE E.Salario > 2000 or E.Comissao > 800
ORDER BY D.NomeDepto ASC, E.Salario DESC  

-- 18.Lista o maior sal�rio, o menor sal�rio e a m�dia dos sal�rios de todos os Empregados.

SELECT MAX(Salario) as 'Maior-Salario', MIN(Salario) as 'Menor-Salario', AVG(Salario) as 'M�dia-Salarial' FROM Empregado

-- 19.Lista o maior sal�rio, o menor sal�rio, a m�dia dos sal�rios e a quantidade dos Empregados com cargo GER ou VENDAS.

SELECT MAX(Salario) as 'Maior-Salario', MIN(Salario) as 'Menor-Salario', AVG(Salario) as 'M�dia-Salarial', COUNT(IdEmpregado) AS 'Empregados-GER-OR-VENDAS'
FROM Empregado
WHERE Cargo = 'GER' OR Cargo = 'VENDAS'

-- 20.Lista  o cargo, o maior sal�rio, o menor sal�rio, a m�dia dos sal�rios e a quantidade dos Empregados para cada cargo

SELECT Cargo, MAX(Salario) as 'Maior-Salario', MIN(Salario) as 'Menor-Salario', AVG(Salario) as 'M�dia-Salarial', COUNT(IdEmpregado) as 'QNT-CARGO'
FROM Empregado
GROUP BY Cargo;

-- 21.Lista  o departamento, o maior sal�rio, o menor sal�rio, a m�dia dos sal�rios e a quantidade dos Empregados para cada departamento
	
SELECT D.NomeDepto, MAX(E.Salario) as 'Maior-Salario', MIN(E.Salario) as 'Menor-Salario', AVG(E.Salario) as 'M�dia-Salarial', COUNT(E.IdEmpregado) as 'QNT-DEPTO'
FROM Empregado as E JOIN Departamento as D
ON E.IdDepto = D.IdDepto
group by D.NomeDepto

-- 22.Lista  o departamento, o maior sal�rio, o menor sal�rio, a m�dia dos sal�rios e a quantidade dos Empregados para cada departamento, 
-- considerando somente empregados com sal�rio maior que 1.800

SELECT D.NomeDepto, MAX(E.Salario) as 'Maior-Salario', MIN(E.Salario) as 'Menor-Salario', AVG(E.Salario) as 'M�dia-Salarial', COUNT(E.IdEmpregado) as 'QNT-DEPTO'
FROM Empregado as E JOIN Departamento as D
ON E.IdDepto = D.IdDepto
WHERE E.Salario > 1800
group by D.NomeDepto

-- 23. Lista  o departamento, o cargo, o maior sal�rio, o menor sal�rio, a m�dia dos sal�rios e a quantidade dos Empregados para cada cargo dentro de cada departamento

SELECT D.NomeDepto, E.Cargo, MAX(E.Salario) as 'MaiorSalario', MIN(E.Salario) as 'MenorSalario', AVG(E.Salario) as 'MediaSalarial', COUNT(E.IdEmpregado) as 'QntEmpregado'
FROM Empregado as E JOIN Departamento as D
ON E.IdDepto = D.IdDepto
GROUP BY D.NomeDepto,  E.Cargo; 

-- 24.Lista  o departamento, o maior sal�rio, o menor sal�rio, a m�dia dos sal�rios e a quantidade dos Empregados, apresentando somente departamentos que tenham pelo menos 5 empregados. 

SELECT D.NomeDepto, MAX(E.Salario) 'MaiorSalario', MIN(E.Salario) as 'MenorSalario', AVG(E.Salario) as 'MediaSalarial', COUNT(E.IdEmpregado) as 'QntEMPREGADO'
FROM Empregado as E JOIN Departamento as D
ON E.IdDepto = D.IdDepto
GROUP BY D.NomeDepto
HAVING COUNT(D.IdDepto)>= 5

-- 25.Lista  o departamento, o maior sal�rio, o menor sal�rio, a m�dia dos sal�rios e a quantidade dos Empregados com sal�rio maior que 1.400, apresentando somente departamentos que tenham pelo menos 3 empregados nessa condi��o.

SELECT D.NomeDepto, MAX(E.Salario) as 'Maior', MIN(E.Salario) as 'Menor', AVG(E.Salario) as 'MediaSalarial', COUNT(E.IdEmpregado) as 'Qnt-Empregados' 
FROM Empregado as E JOIN Departamento as D
ON E.IdDepto = D.IdDepto
WHERE E.Salario > 1400 
GROUP BY D.NomeDepto
HAVING COUNT(E.IdEmpregado) >= 3;

-- 26.Lista todos os dados dos Empregados que n�o tem comiss�o (aus�ncia de valor).

SELECT * FROM Empregado
WHERE Comissao is NULL;

-- 27.Lista nome e sal�rio dos empregados com sal�rio menor que a m�dia dos sal�rios

SELECT NomeEmpregado, Salario 
FROM Empregado
WHERE Salario < (SELECT AVG(Salario) FROM Empregado)

-- 28.Lista os c�digos de departamento que tenham empregados com sal�rio maior que a m�dia de todos os sal�rios (sem repetir c�digos de departamento).

SELECT DISTINCT IdDepto FROM Empregado
WHERE Salario > (SELECT AVG(Salario) FROM Empregado);

-- 29.Lista nome e sal�rio dos empregados que tenham o menor sal�rio em seu departamento

 SELECT E.NomeEmpregado, E.Salario
 FROM Empregado as E JOIN Departamento as D
 ON E.IdDepto = D.IdDepto
 WHERE E.Salario IN(SELECT MIN(E.Salario) FROM Empregado AS E GROUP BY E.IdDepto)
 ORDER BY D.IdDepto ASC;

-- 30.Lista quantos empregados em cada departamento tem sal�rio maior que a m�dia de todos os sal�rios

SELECT	COUNT(E.IdEmpregado) as 'QntEmpregados', D.NomeDepto 
FROM Empregado as E JOIN Departamento as D 
ON E.IdDepto = D.IdDepto
WHERE E.Salario > (SELECT AVG(Salario) FROM Empregado)
GROUP BY D.NomeDepto




