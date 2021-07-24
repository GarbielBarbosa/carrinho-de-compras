import 'package:carrinho_de_compras/modules/cart/cart_controller.dart';
import 'package:carrinho_de_compras/shared/widget/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CartPage extends StatefulWidget {
  final CartController controller;
  CartPage({Key? key, required this.controller}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(builder: (_) {
        return widget.controller.list.isEmpty
            ? Center(child: Text("OPS! Seu carrinho está vazio"))
            : ListView.builder(
                itemCount: widget.controller.list.length,
                itemBuilder: (_, index) => CardProduct(
                    cardProduct: widget.controller.list[index],
                    add: widget.controller.addItem,
                    remove: widget.controller.removeItem),
              );
      }),
    );
  }
}
