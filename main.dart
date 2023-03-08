void main() {
  Produto produto1 = Produto("Café", 7.50);
  Produto produto2 = Produto("Feijão ", 20.99);

  PedidoItems pedidoitem1 = PedidoItems(quantidade: 3, produto: produto1);
  pedidoitem1.calcTotalItem();

  PedidoItems pedidoitem2 = PedidoItems(quantidade: 5, produto: produto2);
  pedidoitem2.calcTotalItem();

  Pedido pedidoteste =
      Pedido(data: DateTime.now(), items: [pedidoitem1, pedidoitem2]);

  print("///////////////////////////////////");
  print("Lista de itens do pedido: \n");
  pedidoteste.listarItems();
  print("///////////////////////////////////\n");
  print("Total pedido: R\$ ${pedidoteste.calcTotalPedido()}\n");
  print("Obrigado pela preferência! Volte sempre! :)\n");
  print("///////////////////////////////////");
}

class Produto {
  String descricao;
  double preco;

  Produto(this.descricao, this.preco);
}

class PedidoItems extends Produto {
  late double quantidade;
  late double total;
  late Produto produto;

  PedidoItems({
    required this.quantidade,
    required this.produto,
  }) : super(produto.descricao, produto.preco);

  calcTotalItem() {
    this.total = produto.preco * quantidade;
  }
}

class Pedido {
  late DateTime data;
  late double total;
  late List<PedidoItems> items;

  Pedido({
    required this.data,
    required this.items,
  });

  calcTotalPedido() {
    this.total = items.map((item) => item.total).reduce((i, j) => i + j);
    var totalString = total.toStringAsFixed(2);
    return totalString;
  }

  listarItems() {
    items
        .map((produto) => print(
            "${produto.descricao} QTD ${produto.quantidade} R\$ ${produto.preco} \n"))
        .toList();
  }
}
