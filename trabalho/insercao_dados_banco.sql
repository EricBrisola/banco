USE JogoRpg;

INSERT INTO Guilda (nome) VALUES 
('Os Guardiões do salgadinho'), 
('Caçadores de xique xique'), 
('Destruidores de lar');

INSERT INTO Personagem (idGuilda, hp, nome, forca, stamina, classe) VALUES 
(1, 350, 'Arthas', 15, 15, 'Guerreiro'), 
(2, 400, 'Morgana', 12, 14, 'Mago'), 
(3, 310, 'Kael', 13, 12, 'Ladrão'), 
(1, 380, 'Tharion', 16, 17, 'Guerreiro'), 
(2, 360, 'Sylvia', 14, 16, 'Necromante'), 
(3, 370, 'Garen', 17, 13, 'Guerreiro');

UPDATE Guilda SET idLider = 1 WHERE id = 1; -- Arthas
UPDATE Guilda SET idLider = 2 WHERE id = 2; -- Morgana
UPDATE Guilda SET idLider = 3 WHERE id = 3; -- Kael

INSERT INTO Item (nome, descricao) VALUES 
('Espada Longa', 'Uma espada de lâmina longa, usada por guerreiros experientes.'), 
('Cajado Arcano', 'Cajado mágico que amplifica o poder das magias.'), 
('Adaga Afiada', 'Uma adaga pequena e mortal para ataques rápidos.'), 
('Elmo de Ferro', 'Elmo resistente para proteção contra ataques físicos.'), 
('Poção de Cura', 'Restaura parte do HP perdido durante batalhas.'), 
('Escudo de Madeira', 'Escudo leve que reduz o dano físico recebido.');

INSERT INTO Categoria (nome) VALUES 
('Espada'), 
('Cajado'), 
('Adaga');

INSERT INTO Arma (idItem, categoria, dano, multiplicador, atributoEscalador) VALUES 
(1, 1, 25, 0.25, 'FOR'), -- Espada Longa
(2, 2, 30, 0.15, 'INT'), -- Cajado Arcano
(3, 3, 22, 0.18, 'DES'); -- Adaga Afiada

INSERT INTO Consumivel (idItem, valorEfeito, efeito) VALUES 
(5, 50, 'Recupera HP'); -- Poção de Cura

INSERT INTO Elemento (nome) VALUES 
('Fogo'), 
('Gelo'), 
('Aço');

INSERT INTO Armadura (idItem, idElemento, valorDefesa) VALUES 
(4, 1, 30), -- Elmo de Ferro (Elemento: Fogo)
(6, 2, 25); -- Escudo de Madeira (Elemento: Gelo)

INSERT INTO TipoInimigo (nome) VALUES 
('Orc'), 
('Troll'), 
('Dragão');

INSERT INTO Inimigo (idTipoInimigo) VALUES 
(1), (2), (3), (1), (2), (3);

INSERT INTO Raid (nome, boss, nivel) VALUES 
('Caverna das Sombras', 'Dragão Negro', 100), 
('Fortaleza dos Orcs', 'Mestre Orc', 200);

INSERT INTO RaidPossuiInimigo (idRaid, idInimigo) VALUES 
(1, 1), 
(1, 3), 
(2, 2), 
(2, 4);

INSERT INTO Necromante (idPersonagem, mana) VALUES 
(5, 40); -- Sylvia

INSERT INTO TipoMortoVivo (nome) VALUES 
('Esqueleto'), 
('Zumbi'), 
('Fantasma');

INSERT INTO MortoVivo (idTipoMortoVivo, idMestre) VALUES 
(1, 1), 
(2, 1), 
(3, 1);

INSERT INTO Ladrao (idPersonagem, destreza) VALUES 
(3, 30);

INSERT INTO Guerreiro (idPersonagem, defesa) VALUES 
(1, 25), 
(4, 40), 
(6, 35);

INSERT INTO Mago (idPersonagem, mana) VALUES 
(2, 45); -- Morgana

INSERT INTO Categoria (nome) VALUES
('Lança'),
('Machado'),
('Arco');

INSERT INTO Arma (idItem, categoria, dano, multiplicador, atributoEscalador) VALUES
(4, 4, 28, 0.2, 'FOR'),
(5, 5, 35, 0.25, 'FOR'),
(6, 6, 27, 0.15, 'DES'); 

INSERT INTO Elemento (nome) VALUES
('Água'),
('Vento'),
('Terra');

INSERT INTO TipoInimigo (nome) VALUES
('Demônio'),
('Besta'),
('Autômato');

INSERT INTO TipoMortoVivo (nome) VALUES
('Ghoul'),
('Espectro'),
('Yokai');

INSERT INTO Raid (nome, boss, nivel) VALUES
('Fortaleza Sombria', 'Senhor das Sombras', 150),
('Abismo Gélido', 'Rainha do Gelo', 200),
('Campos Desolados', 'Ceifador', 120);


