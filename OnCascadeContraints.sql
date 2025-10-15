-- Exemplo 1
drop table funcionario;
drop table departamento;
drop sequence s_funcionario;
drop sequence s_departamento;

Create table departamento
(id_departamento NUMBER constraint PK_departamento PRIMARY KEY, 
 nome varchar2(10)
);

Create table funcionario 
(id_funcionario NUMBER constraint pk_funcionario PRIMARY KEY, 
 nome VARCHAR2(10) NOT NULL, 
 salario NUMBER,
 id_departamento  NUMBER);

alter table funcionario add constraint FK_id_departamento foreign key (id_departamento) 
            references departamento (id_departamento);

CREATE SEQUENCE s_funcionario nocache;
CREATE SEQUENCE s_departamento nocache;

insert into departamento(id_departamento,nome) values(s_departamento.nextval, 'Rh');
insert into departamento values(s_departamento.nextval, 'Vendas');

insert into funcionario(id_funcionario,nome,salario,id_departamento) values(s_funcionario.nextval,'Ana',3000,1);

insert into funcionario(id_funcionario,nome,salario,id_departamento) values(s_funcionario.nextval,'Pedro',6000,1);

insert into funcionario(id_funcionario,nome,salario,id_departamento) values(s_funcionario.nextval,'Maria',5000,2);

drop table departamento;

-- Porque a tabela não foi eliminada?


-- Exemplo 2

select table_name, constraint_name, constraint_type
from user_constraints
where table_name in ('FUNCIONARIO','DEPARTAMENTO');

COL constraint_source FORMAT A38 HEADING "Constraint Name:| Table.Column"
COL references_column FORMAT A38 HEADING "References:| Table.Column"
 
SELECT   uc.constraint_name||CHR(10)
||      '('||ucc1.TABLE_NAME||'.'||ucc1.column_name||')' constraint_source
,       'REFERENCES'||CHR(10)
||      '('||ucc2.TABLE_NAME||'.'||ucc2.column_name||')' references_column
FROM     user_constraints uc
,        user_cons_columns ucc1
,        user_cons_columns ucc2
WHERE    uc.constraint_name = ucc1.constraint_name
AND      uc.r_constraint_name = ucc2.constraint_name
AND      ucc1.POSITION = ucc2.POSITION -- Correction for multiple column primary keys.
AND      uc.constraint_type = 'R'
AND      uc.TABLE_NAME in ('FUNCIONARIO','DEPARTAMENTO')
ORDER BY ucc1.TABLE_NAME
,        uc.constraint_name;

drop table departamento cascade constraints;

--O que aconteceu?

SELECT   uc.constraint_name||CHR(10)
||      '('||ucc1.TABLE_NAME||'.'||ucc1.column_name||')' constraint_source
,       'REFERENCES'||CHR(10)
||      '('||ucc2.TABLE_NAME||'.'||ucc2.column_name||')' references_column
FROM     user_constraints uc
,        user_cons_columns ucc1
,        user_cons_columns ucc2
WHERE    uc.constraint_name = ucc1.constraint_name
AND      uc.r_constraint_name = ucc2.constraint_name
AND      ucc1.POSITION = ucc2.POSITION -- Correction for multiple column primary keys.
AND      uc.constraint_type = 'R'
AND      uc.TABLE_NAME in ('FUNCIONARIO','DEPARTAMENTO')
ORDER BY ucc1.TABLE_NAME
,        uc.constraint_name;

Select * from funcionario;

