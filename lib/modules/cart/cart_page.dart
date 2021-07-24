import 'package:carrinho_de_compras/modules/cart/cart_controller.dart';
import 'package:carrinho_de_compras/shared/utils/extensions.dart';
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
                itemBuilder: (_, index) => ListTile(
                  title: Center(
                      child: Text(widget.controller.list[index].product.name)),
                  trailing:
                      Text(widget.controller.list[index].product.price.reais()),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      child: Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.add),
                            color: Colors.black,
                            onPressed: () {
                              widget.controller.addItem(
                                  widget.controller.list[index].product);
                            },
                          ),
                          Text(widget.controller.list[index].quantity
                              .toString()),
                          IconButton(
                            icon: const Icon(Icons.remove),
                            color: Colors.black,
                            onPressed: () {
                              widget.controller.removeItem(
                                  widget.controller.list[index].product);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              );
      }),
    );
  }
}
