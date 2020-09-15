import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import 'item_desserts.dart';
import 'item_desserts_details.dart';

class DessertsPage extends StatelessWidget {
  final List<ProductDessert> dessertList;
  DessertsPage({
    Key key,
    @required this.dessertList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkBlue,
        title: Text("Postres"),
      ),
      body: ListView.builder(
        itemCount: dessertList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              return Navigator.of(context)
                  .push(
                MaterialPageRoute(
                  builder: (context) => ItemDessertsDetails(
                    selectedDrink: dessertList[index],
                  ),
                ),
              )
                  .then(
                (value) {
                  if (value != null) Navigator.of(context).pop(value);
                },
              );
            },
            child: ItemDessert(
              dessert: dessertList[index],
            ),
          );
        },
      ),
    );
  }
}
