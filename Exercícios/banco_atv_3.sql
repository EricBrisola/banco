SELECT nome, cpf
	FROM medicos
    WHERE idade < 40 and especialidade <> "ortopedia";

SELECT *
	FROM consultas
    WHERE consulta_data > '2024-06-18' and (hora between '12:00' and '18:00');
    
SELECT nome, idade
	FROM pacientes 
    WHERE cidade <> "Florianopolis";
    
SELECT consulta_data, hora
	FROM consultas
    WHERE consulta_data < "2024-06-13" or consulta_data > "2024-06-19";
    
SELECT nome, (idade * 12) AS idade_em_meses
	FROM pacientes;

SELECT MAX(salario) AS maior_salario, MIN(salario) AS menor_salario
		FROM funcionarios
        WHERE cidade = "Florianopolis";
        
SELECT MAX(hora) as ultima_consulta
	FROM consultas
	WHERE consulta_data = "2024-06-14";

SELECT ROUND(AVG(idade), 0) AS media_idade_medico, COUNT(DISTINCT nroa) AS qntd_ambulatorios_atendidos
	FROM  medicos;
    
SELECT codf, nome, (salario * 0.88) AS salario_liquido
	FROM funcionarios
	WHERE salario > 1200;
    
SELECT nome
	FROM funcionarios
    WHERE nome LIKE '%a';
    
SELECT nome, idade
	FROM funcionarios
    WHERE CAST(cpf AS CHAR) LIKE "%6%";
    
SELECT nome, cidade
	FROM medicos
    UNION
SELECT nome, cidade
	FROM funcionarios;