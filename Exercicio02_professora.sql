 --1. Apresentar o nomes dos produtos em ordem crescente.
	SELECT nome  
        from produto 
        order by nome;

--2. Apresentar os nomes dos produtos, a quantidade em estoque 
--	 e o preço para os produtos que tem quantidade em estoque superior a 50 ou com preço inferior a 10.

	select nome, quantidade_estoque, preco 
        from produto 
        where quantidade_estoque >50 or preco < 10; 

--3. Apresentar o código do pedido, a data do pedido e o nome do cliente.

	select p.id_pedido, p.data_pedido, c.nome 
        from cliente c 
	 inner join pedido p on c.id_cliente = p.id_cliente;

	select id_pedido, data_pedido, nome 
        from cliente 
	  inner join pedido on cliente.id_cliente = pedido.id_cliente;



--4. Apresentar o código do pedido, o código do produto, 
--   o nome do produto, o preço de venda, ordenar pelo código do pedido.

	select pp.id_pedido, pp.id_produto, produto.nome, pp.valor_venda
	from pedido_produto pp
    inner join produto on pp.id_produto = produto.id_produto 
    order by pp.id_pedido;

--5. Apresentar os nomes dos produtos que foram pedidos em quantidade superior a 10.

	select distinct  prod.nome 
        from pedido_produto pp 
	  inner join produto prod on pp.id_produto = prod.id_produto
        where pp.quantidade > 10;

--6. Apresentar o código do pedido, a data, o nome do cliente para 
      os pedidos do produto de código 1.

	select pp.id_pedido, ped.data_pedido, c.nome 
	from pedido_produto pp 
         inner join pedido ped on pp.id_pedido = ped.id_pedido
	 inner join cliente c on ped.id_cliente = c.id_cliente
	where pp.id_produto = 1;

--7. Apresentar o código do pedido, a data, o nome do cliente para os pedidos do produto mesa.

	select ped.id_pedido, ped.data_pedido, c.nome 
	from pedido ped 
          inner join pedido_produto pp on pp.id_pedido = ped.id_pedido
	  inner join produto prod on pp.id_produto = prod.id_produto
	  inner join cliente c on ped.id_cliente = c.id_cliente
	where prod.nome = 'mesa';

--8. Apresentar o código do pedido, o nome do cliente e a 
data do pedido para os pedidos que ainda não foram entregues.
	
	select ped.id_pedido, c.nome, ped.data_pedido
        from pedido ped 
          inner join cliente c on c.id_cliente = ped.id_cliente
	where data_entrega is null;

--9. Apresentar o código do pedido, nome do cliente, nome do produto, 
--total produto (quantidade*preço do produto).
-- Ordenar pelo código do pedido e pelo nome do produto.

	select ped.id_pedido, c.nome, prod.nome, 
         (pp.quantidade * pp.valor_venda) as total_produto 
	from pedido ped 
          inner join cliente c on ped.id_cliente = c.id_cliente
	  inner join pedido_produto pp on pp.id_pedido = ped.id_pedido
	  inner join produto prod on prod.id_produto = pp.id_produto
	order by ped.id_pedido, prod.nome;


	
