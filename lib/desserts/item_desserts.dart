import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class ItemDessert extends StatefulWidget {
  final ProductDessert dessert;
  ItemDessert({
    Key key,
    @required this.dessert,
  }) : super(key: key);

  @override
  _ItemDessertState createState() => _ItemDessertState();
}

class _ItemDessertState extends State<ItemDessert> {
  ProductDessert dessert;
  bool fav;
  @override
  void initState() {
    dessert = widget.dessert;
    fav = dessert.liked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kDrakBrown,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: MediaQuery.of(context).size.height / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              bottom: 10,
              right: 10,
              left: MediaQuery.of(context).size.width / 2,
              child: Image.network(
                dessert.productImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: MediaQuery.of(context).size.width / 2 - 35,
              left: 0,
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Postre",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            child: Text(
                              "${widget.dessert.productTitle}",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "\$${widget.dessert.productPrice}",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 3,
              bottom: 0,
              right: 5,
              left: 0,
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.favorite),
                  color: fav ? Colors.red : Colors.black38,
                  onPressed: () {
                    updateFav();
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateFav() {
    fav = fav ? false : true;
  }
}
