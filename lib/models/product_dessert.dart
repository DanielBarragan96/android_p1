import 'dart:math';
import 'package:flutter/foundation.dart';

enum ProductSlice { HALF, SINGLE, DOUBLE }

class ProductDessert {
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  ProductSlice productSlice; // tamano del producto
  double productPrice; // precio del producto autocalculado
  final int productAmount; // cantidad de producto por comprar
  final bool liked;

  ProductDessert({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productSlice,
    @required this.productAmount,
    this.liked = false,
  }) {
    // inicializa el precio de acuerdo al weight del producto
    productPrice = productPriceCalculator();
  }

  double productPriceCalculator() {
    if (this.productSlice == ProductSlice.HALF)
      return (40 + Random().nextInt(40)).toDouble();
    if (this.productSlice == ProductSlice.SINGLE)
      return (60 + Random().nextInt(60)).toDouble();
    if (this.productSlice == ProductSlice.DOUBLE)
      return (80 + Random().nextInt(80)).toDouble();
    return 9999.0;
  }
}
