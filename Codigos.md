# Trabalho Aula 2 de Programação - Módulo 2 - Inteli


**Aqui fizemos a primerira interação com análise de dados dentro do Supabase. Aqui colocarei os códigos utilizados para fazer tabelas, além de um exemplo de código para fazer um teste de análoise de dados.**

Código utilizado para criar a lista de alunos.
```javascriprt
CREATE TABLE alunos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  turma TEXT NOT NULL,
  curso TEXT NOT NULL,
  data_nascimento DATE
);
```
Código utilizado para criar a lista de cursos
```javascriprt
CREATE TABLE cursos (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  duracao_anos INT
);
```

Código utilizado para criar a lista de matriculas.
```javascriprt
CREATE TABLE matriculas (
  id SERIAL PRIMARY KEY,
  aluno_id INT REFERENCES alunos(id) ON DELETE CASCADE,
  curso_id INT REFERENCES cursos(id) ON DELETE CASCADE,
  data_matricula DATE DEFAULT CURRENT_DATE
);
```

**Agora teremos códigos que insere dados à nossas listas.**

Código para adiocionar os alunos, com id, nome, turma, curso e data de nascimento especificados.
```javascriprt
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
```
Código para adiocionar os cursos, com id, nome do curso e tempo de demora para finalizá-lo.
```javascriprt
INSERT INTO cursos (nome, duracao_anos)
VALUES ('Engenharia da Computação', 4),
       ('Ciências da Computação', 4),
       ('Sistema e Informação', 4);
```
Código para adcionarar as matrículas, com o id do aluno, id do curso que ele faz e a data de finalização do curso.
```javascriprt
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

```
**Para testar nosso banco de dados, use esse exemplo de código**

Código para pegar o nome de cada aluno, o nome do curso de cada um e o ano de conclusão de cada um.
```javascriprt
SELECT a.nome AS aluno, c.nome AS curso, m.data_matricula
FROM matriculas m
JOIN alunos a ON m.id_alunos = a.id
JOIN curso c ON m.id_curso = c.id;
```

Fiz do jeito mais simples possível, mas quero colocar mais dados e mais jeitos de análisar os dados, como selecionar alunos com idade maior que 18 anos, então é provável que eu mude um pouco o que está aqui. Fiz desse jeito porque comecei a Dev mais cedo, mas pretendo colocar mais coisas até o final do dia ou na semana para praticar. Obrigado.