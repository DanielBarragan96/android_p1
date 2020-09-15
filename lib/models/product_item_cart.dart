import 'package:flutter/foundation.dart';
import 'package:estructura_practica_1/models/product_repository.dart';

class ProductItemCart {
  String productTitle;
  String productSize;
  int productAmount;
  double productPrice;
  String productImage;
  final ProductType typeOfProduct;

  ProductItemCart({
    this.typeOfProduct,
    @required this.productTitle,
    @required this.productSize,
    @required this.productAmount,
    @required this.productPrice,
    @required this.productImage,
  });
}
