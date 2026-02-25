-- 1. Apresentar o nome do curso e as disciplinas.
SELECT nome_curso, nome_disciplina 
FROM curso cs
INNER JOIN disciplina dc ON cs.id_curso = dc.id_curso;

-- 2. Apresentar o nome do professor e a sua área
SELECT nome_professor, nome_area
FROM professor pf
INNER JOIN area ar ON pf.id_area = ar.id_area;

-- 3. Apresentar o código da turma, o semestre, o nome do aluno e a nota final
SELECT tur.id_turma, tur.semestre, al.nome_aluno, ta.media_final
FROM turma tur
INNER JOIN turma_aluno ta ON tur.id_turma = ta.id_turma
INNER JOIN aluno al ON ta.id_aluno = al.id_aluno;

-- 4. Apresentar o nome do aluno, o nome do curso para os alunos que já concluíram o curso.
SELECT al.nome_aluno, cs.nome_curso, ac.data_fim
FROM aluno al
INNER JOIN aluno_curso ac ON al.id_aluno = ac.id_aluno
INNER JOIN curso cs ON ac.id_curso = cs.id_curso
WHERE ac.data_fim IS NOT NULL;

-- 5. Apresentar código da turma , o nome da disciplina e o nome do professor
SELECT tur.id_turma, dc.nome_disciplina, pf.nome_professor
FROM turma tur
INNER JOIN disciplina dc ON tur.id_disciplina = dc.id_disciplina
INNER JOIN professor pf ON tur.id_professor = pf.id_professor;

-- 6. Apresentar o nome da disciplina e a nota_final das disciplinas cursadas pelo Aluno Bruno no semestre 2018/1;
SELECT dc.nome_disciplina, ta.media_final
FROM turma tur
INNER JOIN disciplina dc ON tur.id_disciplina = dc.id_disciplina
INNER JOIN turma_aluno ta ON tur.id_disciplina = dc.id_disciplina
INNER JOIN aluno al ON ta.id_aluno = al.id_aluno
WHERE al.nome_aluno = 'Bruno' AND tur.semestre = '2018/1';

-- 7. Apresentar o nome dos alunos que foram aprovados na disciplina de BDI no semestre de 2018/1;
SELECT al.nome_aluno, dc.nome_disciplina, ta.media_final
FROM turma tur
INNER JOIN disciplina dc ON tur.id_disciplina = dc.id_disciplina
INNER JOIN turma_aluno ta ON tur.id_disciplina = dc.id_disciplina
INNER JOIN aluno al ON ta.id_aluno = al.id_aluno
WHERE dc.nome_disciplina = 'BDI' AND ta.media_final >= 7;

-- 8. Apresentar o total de alunos matriculados nas turmas do semestre 2018/1.

-- 9. Apresentar a média geral na disciplina de BDI em 2018/1.

-- 10. Apresentar o código da turma, nome da disciplina e quantidade de alunos para as turma de 2018/1.

-- 11. Apresentar o código da turma, nome da disciplina para as turma de 2018/1 com mais de 30 alunos.

-- 12. Apresentar o nome da área e o total de cursos da área. Se a área não tiver nenhum curso deve aparecer o total de cursos 0.

-- 13. Apresentar o nome do professor e o total de disciplinas ministradas por este professor. Se o professor não ministrar nenhuma disciplina deve aparecer o valor 0.

-- 14. Apresentar o nome dos cursos e o total de turmas ofertadas em 2018/1. Se o curso não tiver nenhuma turma ele deve aparecer também com o total de turma 0.
