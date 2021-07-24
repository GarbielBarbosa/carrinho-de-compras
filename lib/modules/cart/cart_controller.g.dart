// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartController on _CartControllerBase, Store {
  final _$listAtom = Atom(name: '_CartControllerBase.list');

  @override
  ObservableList<CardModel> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<CardModel> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$listLengthAtom = Atom(name: '_CartControllerBase.listLength');

  @override
  String get listLength {
    _$listLengthAtom.reportRead();
    return super.listLength;
  }

  @override
  set listLength(String value) {
    _$listLengthAtom.reportWrite(value, super.listLength, () {
      super.listLength = value;
    });
  }

  final _$_CartControllerBaseActionController =
      ActionController(name: '_CartControllerBase');

  @override
  void addItem(ProductModel product) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.addItem');
    try {
      return super.addItem(product);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list},
listLength: ${listLength}
    ''';
  }
}
