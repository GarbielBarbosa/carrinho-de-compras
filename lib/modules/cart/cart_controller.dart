import 'dart:developer';

import 'package:carrinho_de_compras/shared/models/card_model.dart';
import 'package:carrinho_de_compras/shared/models/product_model.dart';
import 'package:mobx/mobx.dart';
part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  @observable
  var list = ObservableList<CardModel>();

  int total = 0;

  @observable
  String listLength = "0";

  @action
  void addItem(ProductModel product) {
    final index = list.indexWhere((e) => e.product == product);
    if (index >= 0) {
      list[index] =
          CardModel(product: product, quantity: list[index].quantity + 1);
    } else {
      final CardModel cardModel = CardModel(product: product, quantity: 1);
      list.add(cardModel);
    }
    updateSizeList();
  }

  @action
  void removeItem(ProductModel product) {
    final index = list.indexWhere((e) => e.product == product);
    if (list[index].quantity <= 1) {
      list.removeAt(index);
    } else {
      list[index] =
          CardModel(product: product, quantity: list[index].quantity - 1);
    }
    updateSizeList();
  }

  updateSizeList() {
    int sizeList = 0;
    list.forEach((e) => sizeList += e.quantity);
    listLength = sizeList.toString();
  }
}
