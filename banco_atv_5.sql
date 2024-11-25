USE clinica;

/* a. Mostre os dados de todos os funcionários ordenados pelo
salário (decrescente) e pela idade (crescente). Buscar apenas
os três primeiros funcionários nesta ordem. */

SELECT * 
	FROM funcionarios f
    ORDER BY salario DESC, idade ASC
    LIMIT 3;

/* 
b. Mostre o nome dos médicos, o número e andar do
ambulatório onde eles atendem, ordenado pelo número do
ambulatório (crescente)
*/

SELECT m.nome, m.nroa, a.andar
	FROM medicos m
    JOIN ambulatorio a
    ON m.nroa = a.nroa
    ORDER BY a.nroa ASC;
    
/* 
c. Mostre o nome do médico e o nome dos pacientes com
consulta marcada, ordenado pela data e pela hora
(crescente). Buscar apenas as tuplas 3 a 5, nesta ordem.
*/

SELECT m.nome, p.nome, c.consulta_data, c.hora
	FROM medicos m
    JOIN consultas c
    ON m.codm = c.codm
    JOIN pacientes p
    ON c.codp = p.codp
    ORDER BY c.consulta_data ASC, c.hora ASC
    LIMIT 2, 3;
    
/* 
d. Mostre os nomes das doenças e a quantidade total de vezes
que foram diagnosticadas nas consultas.
*/

SELECT c.doenca, COUNT(*)
	FROM consultas c
    GROUP BY c.doenca;
    
/* 
e. Mostre as datas e a quantidade total de consultas em cada
data, para horários vespertinos, isto é, após às 12:00 horas.
*/

SELECT c.consulta_data, COUNT(*)
	FROM consultas c
    WHERE c.hora > "12:00"
    GROUP BY c.consulta_data;
    
/* 
f. Mostrar os andares onde existem ambulatórios e o total de
leitos (capacidade) por andar.
*/

SELECT a.andar, SUM(a.capacidade)
	FROM ambulatorio a
    GROUP BY a.andar;
    
/* 
g. Mostrar os andares onde existem ambulatórios e a soma de
capacidade no andar seja maior ou igual a 100.
*/

SELECT a.andar, SUM(a.capacidade) AS capacidade_andar
	FROM ambulatorio a
    GROUP BY a.andar
    HAVING SUM(a.capacidade) >= 100;
    
/* 
h. Mostrar o nome dos médicos que possuem mais de uma
consulta marcada.
*/
SELECT m.nome, COUNT(c.codm) AS num_consultas
	FROM medicos m
    JOIN consultas c
    ON m.codm = c.codm
    GROUP BY m.nome
    HAVING COUNT(c.codm) > 1;
    
/* 
i. Passar todas as consultas da paciente Ana para às 19:00
utilizando um único comando (sem consultar seu codp)
*/

UPDATE consultas c
	SET c.hora = "19:00"
    WHERE c.codp = (
    SELECT p.codp
	FROM pacientes p
    WHERE p.nome LIKE "Ana"
    );

/* 
j. Excluir os pacientes que não possuem consultas marcadas.
*/

DELETE FROM pacientes
WHERE codp NOT IN (
    SELECT codp
    FROM consultas
);

/* 
k. Passar todas as consultas do médico Pedro marcadas para o
período da manhã para o dia 21/06/2024, no mesmo horário.
Utilizar um único comando sem consultar o codm do médico.
*/

UPDATE consultas c
	SET consulta_data = "2024-06-21"
    WHERE c.hora BETWEEN "07:00" AND "12:00"
    AND c.codm = (
    SELECT m.codm
    FROM medicos m
    WHERE m.nome = "Pedro"
    );
    
/* 
l. O ambulatório 4 (nroa=4) foi transferido para o mesmo andar
do ambulatório 1 e sua capacidade é agora o dobro da
capacidade do ambulatório de maior capacidade da clínica.
Utilizar apenas as informações fornecidas para atualizar, sem
consultar e utilizar dados não fornecidos neste enunciado.
*/

UPDATE ambulatorio a
JOIN (
    SELECT 
        (SELECT b.andar FROM ambulatorio b WHERE b.nroa = 1) AS novo_andar,
        (SELECT MAX(c.capacidade) FROM ambulatorio c) AS maior_capacidade
) AS temp ON a.nroa = 4
SET 
    a.andar = temp.novo_andar, 
    a.capacidade = 2 * temp.maior_capacidade
WHERE a.nroa = 4;

# necessario criar uma tabela temporaria
