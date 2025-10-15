-- Criação dos INSERTS do exercicio 01

-- CLiente

insert into cliente(id_cliente, nome, endereco, telefone)
  values(s_cliente.nextval, 'Taylan', 'Rua Blabla', '51888877777');

insert into cliente(id_cliente, nome, endereco, telefone)
  values(s_cliente.nextval, 'Geromel', 'Rua Heuheu', '5122224444');

insert into cliente(id_cliente, nome, endereco, telefone)
  values(s_cliente.nextval, 'Kannemann', 'Rua Gremio', '5100001111');

-- PRODUTO

insert into produto(id_produto, nome, preco, quantidade_estoque)
  values(s_produto.nextval, 'PC Gamer', 15000, 25);

insert into produto(id_produto, nome, preco, quantidade_estoque)
  values(s_produto.nextval, 'PC HP', 6500, 10);

insert into produto(id_produto, nome, preco, quantidade_estoque)
  values(s_produto.nextval, 'MacBook', 10000, 13);


-- Pedido
insert into pedido(id_pedido, id_cliente, data_pedido, data_entrega)
values(s_pedido.nextval, 101, to_date('10/10/2025 20:00','dd/mm/yyyy hh24:mi'), to_date('15/10/2025 15:00','dd/mm/yyyy hh24:mi'));

insert into pedido(id_pedido, id_cliente, data_pedido, data_entrega)
values(s_pedido.nextval, 102, to_date('01/10/2025 07:00','dd/mm/yyyy hh24:mi'), to_date('13/10/2025 10:00','dd/mm/yyyy hh24:mi'));

insert into pedido(id_pedido, id_cliente, data_pedido, data_entrega)
values(s_pedido.nextval, 103, to_date('07/10/2025 16:45','dd/mm/yyyy hh24:mi'), to_date('09/10/2025 13:22','dd/mm/yyyy hh24:mi'));



-- Pedido_produto

insert into pedido_produto(id_pedido, id_produto, quantidade, valor_venda)
  values(s_pedido.nextval, 1010, 2, 13000);

insert into pedido_produto(id_pedido, id_produto, quantidade, valor_venda)
  values(s_pedido.nextval, 1010, 2, 13000);

insert into pedido_produto(id_pedido, id_produto, quantidade, valor_venda)
  values(s_pedido.nextval, 1010, 2, 13000);










