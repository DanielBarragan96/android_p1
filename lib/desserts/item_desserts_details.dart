import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:flutter/material.dart';

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
                      color: Colors.orange,
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
                          fit: BoxFit.fill,
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
                child: Text("${selectedDessert.productTitle}"),
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
                        Text("Porción"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                updateSize(ProductSlice.HALF);
                                setState(() {});
                              },
                              child: Container(
                                height: 24,
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
                                height: 24,
                                width: 50,
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
                                height: 24,
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
                        Text("Precio"),
                        Text("\$${selectedDessert.productPrice}"),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text("AGREGAR AL CARRITO"),
                      color: Colors.yellow[200],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text("COMPRAR AHORA"),
                      color: Colors.purple[200],
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
