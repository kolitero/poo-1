void main() {
  teste1();
}

void teste1() {
  var produto = Produto(preco: 2.50, descricao: "nada", validade: "00");
  var produto1 = Produto(preco: 2.20, descricao: "nada", validade: "00");
  var produto2 = Produto(preco: 5.50, descricao: "nada", validade: "00");
  var item1 = Item(quantidade: 50, produto: produto);
  var item2 = Item(quantidade: 20, produto: produto1);
  var item3 = Item(quantidade: 20, produto: produto2);
  var venda = Venda(data: "nada", itens: [item1, item2, item3]);
  print(venda.total());
}

class Venda {
  String data;
  List<Item> itens;
  Venda({required this.data, required this.itens});
  double total() => itens.fold(0, (t, s) => t + s.total());
}

class Item {
  double quantidade;
  Produto produto;
  Item({required this.quantidade, required this.produto});
  double total() => quantidade * produto.preco;
}

class Produto {
  double preco;
  String descricao;
  String validade;
  Produto({required this.preco, required this.descricao, required this.validade});
}
