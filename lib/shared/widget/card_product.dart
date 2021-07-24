import 'package:carrinho_de_compras/modules/cart/cart_page.dart';
import 'package:carrinho_de_compras/shared/models/card_model.dart';
import 'package:carrinho_de_compras/shared/utils/extensions.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key? key,
    required this.cardProduct,
    required this.add,
    required this.remove,
  }) : super(key: key);

  final CardModel cardProduct;
  final Function add;
  final Function remove;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          alignment: Alignment.bottomLeft,
          width: 60.0,
          height: 60.0,
          child: ClipOval(
            child: Image.network(cardProduct.product.image, fit: BoxFit.contain,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade300,
          ),
        ),
        title: Center(child: Text(cardProduct.product.name)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(cardProduct.product.price.reais()),
          ],
        ),
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
                      add(cardProduct.product);
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
                            remove(cardProduct.product);
                          },
                        )
                      : Container(
                          child: IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.white,
                            onPressed: () {
                              remove(cardProduct.product);
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
