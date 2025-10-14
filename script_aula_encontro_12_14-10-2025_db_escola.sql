USE DB_03360A_Eric;

-- # CRIAR TABELA DO REGISTRO DOS ALUNOS
CREATE TABLE ESCOLA_ALUNOS(
	ALUNO_ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    SOBRENOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(150) UNIQUE, -- UNIQUE trata o valor adicionado como único
    DATA_NASCIMENTO DATE,
    ATIVO BOOLEAN DEFAULT TRUE
);

-- # CRIAR TABELA DO REGISTRO DOS CURSOS
CREATE TABLE ESCOLA_CURSOS(
	CURSO_ID INT PRIMARY KEY AUTO_INCREMENT,
    TITULO VARCHAR(200) NOT NULL,
    DESCRICAO TEXT,
    CARGA_HORARIA INT,
    PRECO DECIMAL(10,2)
    );

-- # INSERIR REGISTROS NA TABELA DOS ALUNOS
INSERT INTO ESCOLA_ALUNOS (NOME, SOBRENOME, EMAIL, DATA_NASCIMENTO) VALUES 
	('Ana', 'Costa', 'ana.costa@email.com', '2000-01-10');
    
INSERT INTO ESCOLA_ALUNOS (NOME, SOBRENOME, EMAIL, DATA_NASCIMENTO, ATIVO) VALUES 
	('Pedro', 'Lima', 'pedro.lima@email.com', '1998-03-22', FALSE);

INSERT INTO ESCOLA_ALUNOS (NOME, SOBRENOME, EMAIL) VALUES 
	('Mariana', 'Souza', 'mariana.s@email.com');

INSERT INTO ESCOLA_ALUNOS (NOME, SOBRENOME, EMAIL, DATA_NASCIMENTO) VALUES 
	('Carlos', 'Gomes', 'carlos.g@email.com', '2001-11-05');

INSERT INTO ESCOLA_CURSOS (TITULO, DESCRICAO, CARGA_HORARIA, PRECO) VALUES 
	('Introdução ao SQL', 
    'Curso básico de SQL para iniciantes', 
    40, 
    299.90
    );
    
INSERT INTO ESCOLA_CURSOS (TITULO, DESCRICAO, CARGA_HORARIA, PRECO) VALUES 
	('Desenvolvimento Web com Python', 
    'Aprenda a criar aplicações web com Python e Django', 
    80, 
    599.90
    );
    
INSERT INTO ESCOLA_CURSOS (TITULO, DESCRICAO, CARGA_HORARIA, PRECO) VALUES 
	('Banco de Dados Avançado', 
    'Tópicos avançados em otimização e modelagem', 
    60, 
    450.00
    );
    
UPDATE ESCOLA_ALUNOS
	SET EMAIL = 'pedro.novo.email@email.com'
    WHERE ALUNO_ID = 2;

BEGIN;

-- TENTATIVA DE DESATIVAR 'MARIANA'
UPDATE ESCOLA_ALUNOS
	SET ATIVO = FALSE
    WHERE ALUNO_ID = 3;
ROLLBACK;

BEGIN; -- Estarta o BEGIN (Criamos aqui uma área de testes, como se fosse uma stage area no git)
-- Fazemos instruções de mudanças e fazemos os testes
UPDATE ESCOLA_CURSOS
	SET 
    CARGA_HORARIA = 45,
    PRECO = 320.00
    WHERE CURSO_ID = 1;
    
SELECT * FROM ESCOLA_ALUNOS; -- Verificamos se as mudanças foram corretas ou aceitas, caso não sejam ainda é possível reverter com um ROLLBACK antes do COMMIT
COMMIT; -- Se as mudanças forem favoráveis damos um COMMIT, ou seja, salvamos as mudanças e após isso não é possível mais reverter
ROLLBACK;

SELECT * FROM ESCOLA_ALUNOS;
SELECT * FROM ESCOLA_CURSOS;

