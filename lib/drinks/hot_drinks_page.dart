import 'package:estructura_practica_1/drinks/item_hot_drinks_details.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

import '../colors.dart';

class HotDrinksPage extends StatefulWidget {
  final List<ProductHotDrinks> drinksList;

  HotDrinksPage({
    Key key,
    @required this.drinksList,
  }) : super(key: key);

  @override
  _HotDrinksPageState createState() => _HotDrinksPageState();
}

class _HotDrinksPageState extends State<HotDrinksPage> {
  ProductHotDrinks selectedDrink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkBlue,
        title: Text("Bebidas"),
      ),
      body: ListView.builder(
        itemCount: widget.drinksList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              return Navigator.of(context)
                  .push(
                MaterialPageRoute(
                  builder: (context) => ItemHotDrinksDetails(
                    selectedDrink: widget.drinksList[index],
                  ),
                ),
              )
                  .then(
                (value) {
                  if (value != null) Navigator.of(context).pop(value);
                },
              );
            },
            child: ItemHotDrinks(
              drink: widget.drinksList[index],
            ),
          );
        },
      ),
    );
  }
}
