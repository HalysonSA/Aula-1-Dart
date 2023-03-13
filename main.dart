void main() {
  Produto produto1 = Produto(descricao: "Cafe", preco: 20);
  Produto produto2 = Produto(descricao: "Feijão", preco: 32);

  PedidoItem pedidoitem1 = PedidoItem(quantidade: 3, produto: produto1);
  PedidoItem pedidoitem2 = PedidoItem(quantidade: 5, produto: produto2);

  Pedido pedidoteste =
      Pedido(data: DateTime.now(), itens: [pedidoitem1, pedidoitem2]);

  print("///////////////////////////////////");
  print("Lista de itens do pedido: \n");
  pedidoteste.listarItems();

  print("///////////////////////////////////\n");

  var data = pedidoteste.data.toString();

  var dataconvertida = data.substring(0, 10).split('-');

  var dia = dataconvertida[2];
  var mes = dataconvertida[1];
  var ano = dataconvertida[0];
  print("${dia}/${mes}/${ano}");

  print("Total pedido: R\$ ${pedidoteste.TotalPedido()}\n");
  print("Obrigado pela preferência! Volte sempre! :)\n");
  print("///////////////////////////////////");
}

class Produto {
  String descricao;
  double preco;

  Produto({required this.descricao, required this.preco});
}

class PedidoItem extends Produto {
  double quantidade;
  Produto produto;

  PedidoItem({
    required this.quantidade,
    required this.produto,
  }) : super(descricao: produto.descricao, preco: produto.preco);

  double total() => quantidade * preco;
}

class Pedido {
  DateTime data;
  List<PedidoItem> itens;
  late double total;

  Pedido({
    required this.data,
    required this.itens,
  });

  TotalPedido() {
    //this.total = items.map((item) => item.calcTotal()).reduce((i, j) => i + j);
    this.total = itens.fold(0, (item, e) => item + e.total());
    var totalString = total.toStringAsFixed(2);
    return totalString;
  }

  listarItems() {
    itens
        .map((produto) => print(
            "${produto.descricao} QTD ${produto.quantidade} R\$ ${produto.preco} \n"))
        .toList();
  }
}
