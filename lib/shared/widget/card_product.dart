import 'package:carrinho_de_compras/modules/cart/cart_page.dart';
import 'package:carrinho_de_compras/shared/models/card_model.dart';
import 'package:carrinho_de_compras/shared/utils/extensions.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key? key,
    required this.cardProduct,
    required this.widget,
  }) : super(key: key);

  final CardModel cardProduct;
  final CartPage widget;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          alignment: Alignment.bottomLeft,
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade300,
            image: DecorationImage(
              fit: BoxFit.cover,
              alignment: Alignment.center,
              image: NetworkImage(
                cardProduct.product.image,
              ),
            ),
          ),
        ),
        title: Center(child: Text(cardProduct.product.name)),
        trailing: Text(cardProduct.product.price.reais()),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    color: Colors.white,
                    onPressed: () {
                      widget.controller.addItem(cardProduct.product);
                    },
                  ),
                ),
                Text(cardProduct.quantity.toString()),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),
                  child: cardProduct.quantity > 1
                      ? IconButton(
                          icon: const Icon(Icons.remove),
                          color: Colors.white,
                          onPressed: () {
                            widget.controller.removeItem(cardProduct.product);
                          },
                        )
                      : Container(
                          child: IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.white,
                            onPressed: () {
                              widget.controller.removeItem(cardProduct.product);
                            },
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
