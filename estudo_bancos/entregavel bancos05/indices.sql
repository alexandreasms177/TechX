CREATE INDEX idx_clientes_email
ON clientes(email);

CREATE INDEX idx_produtos_categoria
ON produtos(id_categoria);

CREATE INDEX idx_produtos_fornecedor
ON produtos(id_fornecedor);

CREATE INDEX idx_produtos_preco
ON produtos(preco);

CREATE INDEX idx_pedidos_cliente
ON pedidos(id_cliente);

CREATE INDEX idx_pedidos_status
ON pedidos(status);

CREATE INDEX idx_pedidos_data
ON pedidos(data_pedido);

CREATE INDEX idx_itens_pedido
ON itens_pedido(id_pedido);

CREATE INDEX idx_itens_produto
ON itens_pedido(id_produto);

CREATE INDEX idx_pagamentos_status
ON pagamentos(status);

CREATE INDEX idx_avaliacoes_produto
ON avaliacoes(id_produto);