import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grain;
  ItemGrains({
    Key key,
    @required this.grain,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("${widget.grain.productTitle}"));
  }
}
