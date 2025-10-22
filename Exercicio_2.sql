-- 1. Apresentar o nomes dos produtos em ordem crescente.
SELECT NOME_PRODUTO
FROM PRODUTO
ORDER BY NOME_PRODUTO ASC;

-- 2. Apresentar os nomes dos produtos, a quantidade em estoque e o preço para os produtos
--    que tem quantidade em estoque superior a 50 ou com preço inferior a 10.
SELECT NOME_PRODUTO, QTD_ESTOQUE, PRECO_UNITARIO
FROM PRODUTO
WHERE QTD_ESTOQUE > 50 OR PRECO_UNITARIO < 10;

-- 3. Apresentar o código do pedido, a data do pedido e o nome do cliente.
SELECT P.ID_PEDIDO, P.DATA_PEDIDO, C.NOME_CLIENTE
FROM PEDIDO P
JOIN CLIENTE C ON P.ID_CLIENTE = C.ID_CLIENTE;

-- 4. Apresentar o código do pedido, o código do produto, o nome do produto, o preço de venda,
--    ordenar pelo código do pedido.
--    (Assumindo que 'preço de venda' está na tabela ITEM_PEDIDO)
SELECT IP.ID_PEDIDO, IP.ID_PRODUTO, PR.NOME_PRODUTO, IP.PRECO_VENDA
FROM ITEM_PEDIDO IP
JOIN PRODUTO PR ON IP.ID_PRODUTO = PR.ID_PRODUTO
ORDER BY IP.ID_PEDIDO;

-- 5. Apresentar os nomes dos produtos que foram pedidos em quantidade superior a 10.
SELECT DISTINCT PR.NOME_PRODUTO
FROM PRODUTO PR
JOIN ITEM_PEDIDO IP ON PR.ID_PRODUTO = IP.ID_PRODUTO
WHERE IP.QUANTIDADE > 10;

-- 6. Apresentar o código do pedido, a data, o nome do cliente para os pedidos do produto de código 1.
SELECT DISTINCT P.ID_PEDIDO, P.DATA_PEDIDO, C.NOME_CLIENTE
FROM PEDIDO P
JOIN CLIENTE C ON P.ID_CLIENTE = C.ID_CLIENTE
JOIN ITEM_PEDIDO IP ON P.ID_PEDIDO = IP.ID_PEDIDO
WHERE IP.ID_PRODUTO = 1;

-- 7. Apresentar o código do pedido, a data, o nome do cliente para os pedidos do produto mesa.
--    (Usando LOWER para ignorar maiúsculas/minúsculas no nome do produto)
SELECT DISTINCT P.ID_PEDIDO, P.DATA_PEDIDO, C.NOME_CLIENTE
FROM PEDIDO P
JOIN CLIENTE C ON P.ID_CLIENTE = C.ID_CLIENTE
JOIN ITEM_PEDIDO IP ON P.ID_PEDIDO = IP.ID_PEDIDO
JOIN PRODUTO PR ON IP.ID_PRODUTO = PR.ID_PRODUTO
WHERE LOWER(PR.NOME_PRODUTO) = 'mesa';

-- 8. Apresentar o código do pedido, o nome do cliente e a data do pedido
--    para os pedidos que ainda não foram entregues.
--    (Assumindo que uma entrega pendente tem a DATA_ENTREGA como NULL)
SELECT P.ID_PEDIDO, C.NOME_CLIENTE, P.DATA_PEDIDO
FROM PEDIDO P
JOIN CLIENTE C ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.DATA_ENTREGA IS NULL;

-- 9. Apresentar o código do pedido, nome do cliente, nome do produto,
--    total produto (quantidade*preço do produto).
--    Ordenar pelo código do pedido e pelo nome do produto.
--    (Assumindo que o preço a ser usado é o PRECO_VENDA do item no pedido)
SELECT
    P.ID_PEDIDO,
    C.NOME_CLIENTE,
    PR.NOME_PRODUTO,
    (IP.QUANTIDADE * IP.PRECO_VENDA) AS TOTAL_PRODUTO
FROM PEDIDO P
JOIN CLIENTE C ON P.ID_CLIENTE = C.ID_CLIENTE
JOIN ITEM_PEDIDO IP ON P.ID_PEDIDO = IP.ID_PEDIDO
JOIN PRODUTO PR ON IP.ID_PRODUTO = PR.ID_PRODUTO
ORDER BY P.ID_PEDIDO, PR.NOME_PRODUTO;
