import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../pay.dart';

class ItemHotDrinksDetails extends StatefulWidget {
  final ProductHotDrinks selectedDrink;
  ItemHotDrinksDetails({Key key, @required this.selectedDrink})
      : super(key: key);
  @override
  _ItemHotDrinksDetailsState createState() => _ItemHotDrinksDetailsState();
}

class _ItemHotDrinksDetailsState extends State<ItemHotDrinksDetails> {
  ProductHotDrinks selectedDrink;
  ProductSize size;
  @override
  void initState() {
    selectedDrink = widget.selectedDrink;
    size = selectedDrink.productSize;
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
                          selectedDrink.productImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.favorite),
                        color:
                            selectedDrink.liked ? Colors.red : Colors.black38,
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
                  "${selectedDrink.productTitle}",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Text(
                "${selectedDrink.productDescription}",
                style: Theme.of(context).textTheme.bodyText2,
              ),
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
                                updateSize(ProductSize.CH);
                                setState(() {});
                              },
                              child: Container(
                                height: 30,
                                width: 50,
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                color: (size == ProductSize.CH)
                                    ? Colors.purple[200]
                                    : Colors.white10,
                                child: Center(child: Text("CH")),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                updateSize(ProductSize.M);
                                setState(() {});
                              },
                              child: Container(
                                height: 30,
                                width: 50,
                                color: (size == ProductSize.M)
                                    ? Colors.purple[200]
                                    : Colors.white10,
                                child: Center(child: Text("M")),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                updateSize(ProductSize.G);
                                setState(() {});
                              },
                              child: Container(
                                height: 30,
                                width: 50,
                                color: (size == ProductSize.G)
                                    ? Colors.purple[200]
                                    : Colors.white10,
                                child: Center(child: Text("G")),
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
                              "\$${selectedDrink.productPrice}",
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
                        selectedDrink.productSize = size;
                        selectedDrink.productAmount++;
                        Navigator.of(context).pop(selectedDrink);
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
    selectedDrink.liked = (selectedDrink.liked) ? false : true;
  }

  void updateSize(ProductSize newSize) {
    size = newSize;
    selectedDrink.productPrice = selectedDrink.productPriceCalculator();
  }
}
