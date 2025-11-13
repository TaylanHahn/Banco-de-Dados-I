-- 1. Recuperar o nome do cliente, o nome da agencia, o numero da conta, tipo (poupança ou Conta Corrente) e o saldo.

SELECT cli.nome, ag.nome AS agencia, ct.numero_conta, ct.tipo
FROM cliente_cc cli
INNER JOIN agencia ag ON cli.id_agencia = ag.id_agencia
INNER JOIN conta ct ON cli.id_cliente = ct.id_cliente;


-- 2. Recuperar o total de clientes da agencia Cavalhada.

SELECT count(cli.id_cliente) AS total
FROM cliente_cc cli
INNER JOIN agencia ag ON cli.id_agencia = ag.id_agencia
WHERE ag.nome = 'Cavalhada';


-- 3. Recuperar o nome da agencia e o total de clientes.

SELECT ag.nome, count(cli.id_agencia)
FROM agencia ag 
INNER JOIN cliente_cc cli ON ag.id_agencia = cli.id_agencia
GROUP BY ag.nome;


-- 4.Recuperar o nome dos cliente da agencia Petropolis e o somatorio dos seus emprestimos. ( se o cliente não tiver empréstimos deve aparecer somatório zero)

SELECT cli.nome, ag.nome, NVL(SUM(emp.valor),0)
FROM cliente_cc cli
INNER JOIN agencia ag ON cli.id_agencia = ag.id_agencia
LEFT OUTER JOIN emprestimo emp ON cli.id_cliente = emp.id_cliente
WHERE ag.nome = 'Petropolis'
GROUP BY cli.nome, ag.nome;


-- 5. Recuperar o nome dos clientes que realizaram mais de dois empréstimos no ano de 2019 com valor superior a R$ 10.000,00.

SELECT cli.nome AS nome_cliente 
FROM cliente_cc cli
INNER JOIN emprestimo emp ON cli.id_cliente = emp.id_cliente
WHERE emp.valor > 10000 AND emp.data_emprestimo
BETWEEN to_date('01/01/2018','dd/mm/yyyy') AND to_date('31/12/2018','dd/mm/yyyy')
GROUP BY cli.nome
HAVING COUNT(emp.id_emprestimo)>2;
