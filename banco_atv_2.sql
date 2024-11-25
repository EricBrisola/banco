INSERT INTO funcionarios (codf, nome, idade, cidade, salario, cpf)
	VALUES 
    (1, "Rita", 32, "Florianopolis", 1200, 20000100000),
    (2, "Maria", 55, "Palhoca", 1220, 30000110000),
    (3, "Caio", 45, "Biguacu", 1100, 41000100000),
    (4, "Denise", 26, "Florianopolis", 1300, 51000110000),
    (5, "Paula", 33, "Florianopolis", 2500, 61000111000),
    (6, "Carlos", 44, "Joinville", 1200, 30120120231);

DELETE FROM funcionarios
	WHERE codf < 7;
    
ALTER TABLE ambulatorio
	MODIFY COLUMN andar tinyint;

INSERT INTO ambulatorio (nroa, andar, capacidade)
	VALUES 
    (1, 1, 30),
    (2, 1, 50),
    (3, 2, 40),
    (4, 2, 25),
    (5, 2, 55);
    
INSERT INTO pacientes (codp, nome, idade, cidade, cpf)
	VALUES
    (1, "Ana", 20, "Florianopolis", 20000200000),
    (2, "Paulo", 24, "Palhoca", 20000220000),
    (3, "Lucia", 30, "Biguacu", 22000200000),
    (4, "Carlos", 28, "Joinville", 11000110000);
    
INSERT INTO medicos (codm, nome, idade, especialidade, cidade, cpf, nroa)
	VALUES
    (1, "João", 40, "ortopedia", "Florianopolis", 10000100000, 1),
    (2, "Maria", 42, "traumatologia", "Blumenau", 10000110000, 2),
    (3, "Pedro", 51, "pediatria", "São Jose", 11000100000, 2),
    (4, "Carlos", 28, "ortopedia", "Joinville", 11000110000, null),
    (5, "Márcia", 33, "neurologia", "Biguacu", 11000111000, 3);
    
    
INSERT INTO consultas (codm, codp, consulta_data, hora, doenca)
	VALUES
    (1, 1, "2024-06-12", '14:00', "gripe"),
    (1, 4, "2024-06-13", '10:00', "tendinite"),
    (2, 1, "2024-06-13", '09:00', "fratura"),
    (2, 2, "2024-06-13", '11:00', "fratura"),
    (2, 3, "2024-06-14", '14:00', "traumatismo"),
    (2, 4, "2024-06-14", '20:00', "checkup"),
    (3, 1, "2024-06-19", '18:00', "gripe"),
    (3, 3, "2024-06-12", '10:00', "virose"),
    (3, 4, "2024-06-19", '13:00', "virose"),
    (4, 4, "2024-06-20", '13:00', "tendinite"),
    (4, 4, "2024-06-22", '19:30', "dengue");
    
    
UPDATE pacientes
	SET cidade = "Ilhota"
    WHERE codp = 2;

UPDATE consultas
	SET consulta_data = '2024-07-04',
		hora = '12:00'
	WHERE codm = 1 AND codp = 4;
    
UPDATE pacientes
	SET	 idade = idade + 1
    WHERE codp = 1;
    
UPDATE consultas
	SET hora = addtime(hora, '01:30')
    WHERE codm = 3 and codp = 4;
    
UPDATE consultas
	SET hora = subtime(hora, '00:30')
    WHERE codm = 3 and codp = 4;
    
DELETE FROM funcionarios
	WHERE codf = 6;

DELETE FROM consultas
	WHERE hora > '19:00';
    
UPDATE medicos
	SET ativo = 0
    WHERE cidade = 'Joinville' or
    cidade = 'Biguacu';
    
UPDATE medicos
	SET	nome = CONCAT(nome, " Dantas")
    WHERE nome = "Maria";

    


    


