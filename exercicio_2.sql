Criação dos INSERTS do exercicio 01
-----------------------------------------------------------------------------------------
# insert CLiente

insert into cliente(id_cliente, nome, endereco, telefone)
  values(s_cliente.nextval, 'Taylan', 'Rua Blabla', '51888877777');

insert into cliente(id_cliente, nome, endereco, telefone)
  values(s_cliente.nextval, 'Geromel', 'Rua Heuheu', '5122224444');

insert into cliente(id_cliente, nome, endereco, telefone)
  values(s_cliente.nextval, 'Kannemann', 'Rua Gremio', '5100001111');

# insert Produto

insert into produto(id_produto, nome, preco, quantidade_estoque)
  values(s_produto.nextval, 'PC Gamer', 15000, 25);

insert into produto(id_produto, nome, preco, quantidade_estoque)
  values(s_produto.nextval, 'PC HP', 6500, 10);

insert into produto(id_produto, nome, preco, quantidade_estoque)
  values(s_produto.nextval, 'MacBook', 10000, 13);


# insert Pedido
insert into pedido(id_pedido, id_cliente, data_pedido, data_entrega)
  values();

insert into pedido(id_pedido, id_cliente, data_pedido, data_entrega)
  values();

insert into pedido(id_pedido, id_cliente, data_pedido, data_entrega)
  values();



# insert Pedido_produto

insert into pedido_produto(id_pedido, id_produto, quantidade, valor_venda)
  values(s_pedido.nextval, 1010, 2, 13000);

insert into pedido_produto(id_pedido, id_produto, quantidade, valor_venda)
  values(s_pedido.nextval, 1010, 2, 13000);

insert into pedido_produto(id_pedido, id_produto, quantidade, valor_venda)
  values(s_pedido.nextval, 1010, 2, 13000);










