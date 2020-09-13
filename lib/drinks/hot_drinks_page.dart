import 'package:estructura_practica_1/drinks/item_hot_drinks_details.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class HotDrinksPage extends StatelessWidget {
  final List<ProductHotDrinks> drinksList;
  HotDrinksPage({
    Key key,
    @required this.drinksList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
      ),
      body: ListView.builder(
        itemCount: drinksList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              return Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ItemHotDrinksDetails(
                    selectedDrink: drinksList[index],
                  ),
                ),
              );
            },
            child: ItemHotDrinks(
              drink: drinksList[index],
            ),
          );
        },
      ),
    );
  }
}
