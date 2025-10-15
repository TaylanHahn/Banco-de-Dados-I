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

insert into funcionario(id_funcionario,nome,salario,id_departamento) values(s_funcionario.nextval,'Ana',2000,1);

insert into funcionario(id_funcionario,nome,salario,id_departamento) values(s_funcionario.nextval,'Pedro',3000,1);

insert into funcionario(id_funcionario,nome,salario,id_departamento) values(s_funcionario.nextval,'Maria',4000,2);

select * from funcionario;
select * from departamento;

delete from departamento where id_departamento = 1;

--O registro foi deletado? Porque?

-- Exemplo 2
alter table funcionario drop constraint FK_id_departamento;

alter table funcionario add constraint FK_id_departamento foreign key (id_departamento) 
            references departamento (id_departamento) ON DELETE CASCADE;

delete from departamento where id_departamento = 1;

--O departamento 1 foi execluído? E os funcionários do departamento 1 o que aconteceu com eles?


