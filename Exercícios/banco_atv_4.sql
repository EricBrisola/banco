USE clinica;

SELECT m.nome, m.cpf
	FROM medicos m 
    JOIN pacientes p ON m.cpf = p.cpf; 
    
SELECT m.nome AS nome_medico, f.nome AS nome_funcionario, f.cidade AS cidade_comum
	FROM medicos m
    JOIN funcionarios f 
    ON m.cidade = f.cidade;
    
SELECT p.codp, p.nome, c.hora
	FROM pacientes p
    JOIN consultas c
    ON p.codp = c.codp
    WHERE c.hora > '14:00';
 
SELECT a.nroa AS numero, a.andar AS andar, m.especialidade
	FROM ambulatorio a
    JOIN medicos m 
    ON a.nroa = m.nroa
    WHERE m.especialidade = 'ortopedia' AND m.ativo = 1;

SELECT p.nome, p.cpf
	FROM pacientes p
    JOIN consultas c
    ON p.codp = c.codp
	WHERE consulta_data BETWEEN  "2024-06-13" AND  "2024-06-16";
    
SELECT m.nome, m.idade
	FROM medicos m
    JOIN consultas c
    ON m.codm = c.codm
    JOIN pacientes p
    ON p.codp = c.codp
    WHERE p.nome = 'Ana';
    
SELECT m.codm, m.nome
	FROM medicos m
    JOIN ambulatorio a
    ON m.nroa = a.nroa
    WHERE nome != 'Pedro' 
    AND m.nroa = (
		SELECT nroa 
		FROM medicos 
		WHERE nome = 'Pedro');
        
SELECT p.nome AS paciente, p.cpf
	FROM pacientes p 
    JOIN consultas c
    ON p.codp = c.codp
    JOIN medicos m
    ON c.codm = m.codm
    WHERE m.especialidade = 'ortopedia' AND c.consulta_data < '2024-06-21';
    
SELECT f.nome, f.salario
	FROM funcionarios f
    WHERE nome != 'Denise'
    AND f.cidade = (
		SELECT cidade 
		FROM funcionarios
        WHERE nome = 'Denise')
    AND f.salario > (
		SELECT salario
        FROM funcionarios
        WHERE nome = 'Denise');

SELECT a.*, m.nome AS medico
	FROM ambulatorio a
    LEFT JOIN medicos m
    ON a.nroa = m.nroa;
    
SELECT c.consulta_data, c.hora, m.nome AS medico, p.nome AS paciente, a.nroa
	FROM consultas c
    LEFT JOIN medicos m
    ON c.codm = m.codm
    RIGHT JOIN pacientes p
    ON c.codp = p.codp
    LEFT JOIN ambulatorio a
    ON a.nroa = m.nroa;
    
/* 
segunda maneira de fazer

SELECT c.consulta_data, c.hora, m.nome AS medico, p.nome AS paciente, a.nroa
	FROM consultas c
	LEFT JOIN medicos m ON c.codm = m.codm
	LEFT JOIN pacientes p ON c.codp = p.codp
	LEFT JOIN ambulatorio a ON a.nroa = m.nroa;
*/

SELECT m.nome, m.cpf
	FROM medicos m
    WHERE m.cpf IN (
		SELECT p.cpf
		FROM pacientes p
        );
        
SELECT p.codp, p.nome
	FROM pacientes p
    WHERE p.codp IN (
		SELECT c.codp
        FROM consultas c
        WHERE hora > '14:00'
        );

SELECT a.nroa, a.andar
	FROM ambulatorio a
    WHERE NOT EXISTS (
		SELECT m.nroa
        FROM medicos m
        WHERE m.nroa = a.nroa
    );
    
SELECT a.nroa, a.andar, a.capacidade
	FROM ambulatorio a
    WHERE a.capacidade > (
		SELECT MIN(a.capacidade)
        FROM ambulatorio a
    );

SELECT m.nome, m.cpf
	FROM medicos m
	JOIN ambulatorio a
    ON m.nroa = a.nroa
    WHERE a.capacidade > (
		SELECT MIN(a.capacidade)
		FROM ambulatorio a
		WHERE a.andar = 1
    );
    
SELECT m.nome AS doutor, m.cpf, COUNT(DISTINCT p.codp) AS pacientes_menores_de_25_atendidos
	FROM medicos m
    JOIN consultas c
    ON m.codm = c.codm
    JOIN pacientes p
    ON c.codp = p.codp
    WHERE p.idade < 25
    GROUP BY m.nome, m.cpf
	HAVING COUNT(p.codp) >= (
		SELECT COUNT(DISTINCT p.codp)
		FROM pacientes p
		WHERE p.idade < 25
		);
