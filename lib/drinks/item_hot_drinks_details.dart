import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:flutter/material.dart';

class ItemHotDrinksDetails extends StatefulWidget {
  final ProductHotDrinks selectedDrink;
  ItemHotDrinksDetails({Key key, @required this.selectedDrink})
      : super(key: key);
  @override
  _ItemHotDrinksDetailsState createState() => _ItemHotDrinksDetailsState();
}

class _ItemHotDrinksDetailsState extends State<ItemHotDrinksDetails> {
  ProductHotDrinks selectedDrink;
  @override
  void initState() {
    selectedDrink = widget.selectedDrink;
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
                        child: Image.network(selectedDrink.productImage),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: Text("${selectedDrink.productTitle}"),
              ),
              Text("${selectedDrink.productDescription}"),
              SizedBox(
                height: 48,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text("Color"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              color: Colors.blue,
                            ),
                            Container(
                              height: 24,
                              width: 24,
                              color: Colors.blue,
                            ),
                            Container(
                              height: 24,
                              width: 24,
                              color: Colors.blue,
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
                        Text("\$${selectedDrink.productPrice}"),
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
}
