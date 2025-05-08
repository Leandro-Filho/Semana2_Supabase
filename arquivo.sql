CREATE TABLE cursos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  duracao_anos INT
);

CREATE TABLE alunos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  turma TEXT NOT NULL,
  curso TEXT NOT NULL,
  data_nascimento DATE
);

CREATE TABLE matriculas (
  id SERIAL PRIMARY KEY,
  aluno_id INT REFERENCES alunos(id) ON DELETE CASCADE,
  curso_id INT REFERENCES cursos(id) ON DELETE CASCADE,
  data_matricula DATE DEFAULT CURRENT_DATE
);

INSERT INTO alunos (nome, turma, curso, data_de_nascimento)
VALUES
('Leandro Precaro', '1B', 'Engenharia da Computação', '2006-12-30'),
('Thulio Bacco', '1B', 'Ciências da Computação', '2006-08-22'),
('Antônio André', '1A', 'Ciências da Computação', '2005-04-10'),
('Diego Figueiredo', '1B', 'Ciências da Computação', '2005-11-09'),
('Eduardo Jesus', '1A', 'Sistema e Informação', '2005-01-30'),
('Messias Fernandes', '1A', 'Engenharia da Computação', '2006-03-28'),
('Gabriel Bartmanovi', '1B', 'Ciências da Computação', '2005-06-04'),
('Vinícius Maciel', '1A', 'Engenharia da Computação', '2007-06-07'),
('Yuri Boczar', '1A', 'Ciências da Computação', '2007-03-18'),
('Breno Silva', '1B', 'Ciências da Computação', '2005-12-18');

INSERT INTO cursos (nome, duracao_anos)
VALUES ('Engenharia da Computação', 4),
       ('Ciências da Computação', 4),
       ('Sistema e Informação', 4);

       INSERT INTO matriculas (aluno_id, curso_id)
VALUES (1, 1),
       (2, 2),
       (3, 2),
       (4, 2),
       (5, 3),
       (6, 1),
       (7, 2),
       (8, 1),
       (9, 2),
       (10, 2);

       SELECT a.nome AS aluno, c.nome AS curso, m.data_matricula
FROM matriculas m
JOIN alunos a ON m.id_alunos = a.id
JOIN curso c ON m.id_curso = c.id;