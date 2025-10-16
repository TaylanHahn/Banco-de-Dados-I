select f.nome,d.nome
from funcionario inner join departamento d
on f.id_departamento = d.id_departamento;

-- É possível dar um apelido (como uma variavel local) para a tabela. 
-- No caso, funcionario agora é 'f' e departamento 'd'
