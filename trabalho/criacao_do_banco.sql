CREATE DATABASE JogoRpg;

USE JogoRpg;

CREATE TABLE IF NOT EXISTS Raid(
	id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(45) NOT NULL,
    boss VARCHAR(45) NOT NULL,
    nivel INT NOT NULL CHECK (nivel > 0 AND nivel < 500)
);

CREATE TABLE IF NOT EXISTS TipoInimigo(
	id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS Inimigo(
	id INT AUTO_INCREMENT PRIMARY KEY, 
    idTipoInimigo INT NOT NULL,
    CONSTRAINT fk_tipoInimigo FOREIGN KEY (idTipoInimigo) REFERENCES TipoInimigo (id)
);

CREATE TABLE IF NOT EXISTS RaidPossuiInimigo(
	idRaid INT NOT NULL, 
    idInimigo INT NOT NULL,
    PRIMARY KEY (idRaid, idInimigo),
    CONSTRAINT fk_raid FOREIGN KEY (idRaid) REFERENCES Raid (id),
    CONSTRAINT fk_inimigo FOREIGN KEY (idInimigo) REFERENCES Inimigo (id)
);

CREATE TABLE IF NOT EXISTS Guilda (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(45) NOT NULL,
    idLider INT 
);

CREATE TABLE IF NOT EXISTS Personagem (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    idGuilda INT,
    hp INT NOT NULL CHECK (hp >= 300),
    nome VARCHAR(100) NOT NULL,
    forca INT NOT NULL CHECK (forca >= 10),
    stamina INT NOT NULL CHECK (stamina >= 10),
    classe ENUM('Ladrão', 'Mago', 'Guerreiro', 'Necromante') NOT NULL,
	CONSTRAINT fk_guilda FOREIGN KEY (idGuilda) REFERENCES Guilda (id)
);

ALTER TABLE Guilda ADD CONSTRAINT fk_lider FOREIGN KEY (idLider) REFERENCES Personagem (id);

CREATE TABLE IF NOT EXISTS Item (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(45) NOT NULL,
    descricao MEDIUMTEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS PersonagemPossuiItem (
   idPersonagem INT NOT NULL, 
   idItem INT NOT NULL,
   CONSTRAINT fk_personagem FOREIGN KEY (idPersonagem) REFERENCES Personagem (id),
   CONSTRAINT fk_item FOREIGN KEY (idItem) REFERENCES Item (id)
);

CREATE TABLE IF NOT EXISTS Categoria (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS Arma (
	id INT AUTO_INCREMENT PRIMARY KEY,
    idItem INT NOT NULL,
    categoria INT NOT NULL,
    dano INT NOT NULL CHECK (dano >= 20),
    multiplicador FLOAT(3,2) NOT NULL CHECK (multiplicador >= 0.10 AND multiplicador <= 0.30),
    atributoEscalador ENUM('FOR', 'DES', 'INT', 'STA') DEFAULT 'FOR',
    CONSTRAINT fk_tipoItemArma FOREIGN KEY (idItem) REFERENCES Item (id),
    CONSTRAINT fk_categoriaArma FOREIGN KEY (categoria) REFERENCES Categoria (id)
);

CREATE TABLE IF NOT EXISTS Consumivel (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    idItem INT NOT NULL,
    valorEfeito INT NOT NULL,
    efeito VARCHAR(45) NOT NULL,
    CONSTRAINT fk_tipoItemConsumivel FOREIGN KEY (idItem) REFERENCES Item (id)
);

CREATE TABLE IF NOT EXISTS Elemento (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS Armadura (
	id INT AUTO_INCREMENT PRIMARY KEY, 
    idItem INT NOT NULL,
    idElemento INT NOT NULL,
    valorDefesa INT NOT NULL CHECK (valorDefesa >= 20 AND valorDefesa <= 50),
    CONSTRAINT fk_tipoItemArmadura FOREIGN KEY (idItem) REFERENCES Item (id),
    CONSTRAINT fk_elemento FOREIGN KEY (idElemento) REFERENCES Elemento (id)
);

CREATE TABLE IF NOT EXISTS Ladrao (
	id INT AUTO_INCREMENT PRIMARY KEY,
    idPersonagem INT NOT NULL,
	destreza INT NOT NULL CHECK (destreza >= 20 AND destreza <= 50),
    CONSTRAINT fk_personagemLadrao FOREIGN KEY (idPersonagem) REFERENCES Personagem (id),
    CONSTRAINT uq_personagemLadrao UNIQUE (idPersonagem)
);

CREATE TABLE IF NOT EXISTS Mago (
	id INT AUTO_INCREMENT PRIMARY KEY,
    idPersonagem INT NOT NULL,
	mana INT NOT NULL CHECK (mana >= 20 AND mana <= 50),
    CONSTRAINT fk_personagemMago FOREIGN KEY (idPersonagem) REFERENCES Personagem (id),
    CONSTRAINT uq_personagemMago UNIQUE (idPersonagem)
);

CREATE TABLE IF NOT EXISTS Guerreiro (
	id INT AUTO_INCREMENT PRIMARY KEY,
    idPersonagem INT NOT NULL,
	defesa INT NOT NULL CHECK (defesa >= 20 AND defesa <= 50),
    CONSTRAINT fk_personagemGuerreiro FOREIGN KEY (idPersonagem) REFERENCES Personagem (id),
    CONSTRAINT uq_personagemMago UNIQUE (idPersonagem)
);

CREATE TABLE IF NOT EXISTS Necromante (
	id INT AUTO_INCREMENT PRIMARY KEY,
    idPersonagem INT NOT NULL,
	mana INT NOT NULL CHECK (mana >= 20 AND mana <= 50),
    CONSTRAINT fk_personagemNecromante FOREIGN KEY (idPersonagem) REFERENCES Personagem (id),
    CONSTRAINT uq_personagemNecromante UNIQUE (idPersonagem)
);

CREATE TABLE IF NOT EXISTS TipoMortoVivo (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS MortoVivo (
	id INT AUTO_INCREMENT PRIMARY KEY,
    idTipoMortoVivo INT NOT NULL,
	idMestre INT NOT NULL,
    CONSTRAINT fk_mestre FOREIGN KEY (idMestre) REFERENCES Necromante (id)
);








