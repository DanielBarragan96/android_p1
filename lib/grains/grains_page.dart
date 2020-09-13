import 'package:estructura_practica_1/colors.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:flutter/material.dart';

import 'item_grains.dart';
import 'item_grains_details.dart';

class GrainsPage extends StatelessWidget {
  final List<ProductGrains> grainsList;
  GrainsPage({
    Key key,
    @required this.grainsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkBlue,
        title: Text("Granos"),
      ),
      body: ListView.builder(
        itemCount: grainsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              return Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ItemGrainsDetails(
                    selectedGrain: grainsList[index],
                  ),
                ),
              );
            },
            child: ItemGrains(
              grain: grainsList[index],
            ),
          );
        },
      ),
    );
  }
}
