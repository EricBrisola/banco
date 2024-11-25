USE JogoRpg;

CREATE USER 'admin_jogorpg'@'localhost' IDENTIFIED BY 'SenhaForteAdmin123';

CREATE USER 'usuario_jogorpg'@'localhost' IDENTIFIED BY 'SenhaUsuario123';

GRANT ALL PRIVILEGES ON JogoRpg.* TO 'admin_jogorpg'@'localhost';

GRANT SELECT, INSERT ON JogoRpg.* TO 'usuario_jogorpg'@'localhost';