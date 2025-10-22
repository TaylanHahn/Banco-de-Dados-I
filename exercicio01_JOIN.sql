drop table cargo;

create table cargo (id_cargo number 
  constraint pk_cargo primary key,nome varchar2(10));

insert into cargo 
  values(400,'Gerente');

insert into cargo 
  values(401,'Operador');

alter table funcionario
  add id_cargo number;

alter table funcionario 
  add constraint fk_cargo foreign key(id_cargo) references cargo;

update funcionario 
  set id_cargo=400
  where id_funcionario=100;

update funcionario
  set id_cargo=401
  where id_funcionario in (101,102);

select f.nome,d.nome,cargo.nome
  from funcionario f 
  inner join departamento d on f.id_departamento = d.id_departamento 
  inner join cargo on cargo.id_cargo=f.id_cargo;
