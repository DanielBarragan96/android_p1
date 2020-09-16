import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../pay.dart';

class ItemDessertsDetails extends StatefulWidget {
  final ProductDessert selectedDrink;
  ItemDessertsDetails({Key key, @required this.selectedDrink})
      : super(key: key);
  @override
  _ItemDessertsDetailsState createState() => _ItemDessertsDetailsState();
}

class _ItemDessertsDetailsState extends State<ItemDessertsDetails> {
  ProductDessert selectedDessert;
  bool fav;
  ProductSlice size;
  @override
  void initState() {
    selectedDessert = widget.selectedDrink;
    fav = selectedDessert.liked;
    size = selectedDessert.productSlice;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle"),
        backgroundColor: kDarkBlue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
                height: MediaQuery.of(context).size.height / 3,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [kDarkOrange, kLightOrange],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image.network(
                          selectedDessert.productImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Align(
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: Text(
                  "${selectedDessert.productTitle}",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Text("${selectedDessert.productDescription}"),
              SizedBox(
                height: 48,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Tamaño",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                updateSize(ProductSlice.HALF);
                                setState(() {});
                              },
                              child: Container(
                                height: 30,
                                width: 50,
                                color: (size == ProductSlice.HALF)
                                    ? Colors.purple[200]
                                    : Colors.white10,
                                child: Center(child: Text("Medio")),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                updateSize(ProductSlice.SINGLE);
                                setState(() {});
                              },
                              child: Container(
                                height: 30,
                                width: 50,
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                color: (size == ProductSlice.SINGLE)
                                    ? Colors.purple[200]
                                    : Colors.white10,
                                child: Center(child: Text("Uno")),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                updateSize(ProductSlice.DOUBLE);
                                setState(() {});
                              },
                              child: Container(
                                height: 30,
                                width: 50,
                                color: (size == ProductSlice.DOUBLE)
                                    ? Colors.purple[200]
                                    : Colors.white10,
                                child: Center(child: Text("Doble")),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Precio",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          child: Center(
                            child: Text(
                              "\$${selectedDessert.productPrice}",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        selectedDessert.productSlice = size;
                        Navigator.of(context).pop(selectedDessert);
                      },
                      child: Text(
                        "AGREGAR AL CARRITO",
                        style: TextStyle(color: kWhite),
                      ),
                      color: kDrakBrown,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Pay(payNow: true);
                            },
                          ),
                        );
                      },
                      child: Text(
                        "COMPRAR AHORA",
                        style: TextStyle(color: kWhite),
                      ),
                      color: kDrakBrown,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateFav() {
    fav = fav ? false : true;
  }

  void updateSize(ProductSlice newSize) {
    size = newSize;
    selectedDessert.productPrice = selectedDessert.productPriceCalculator();
  }
}
