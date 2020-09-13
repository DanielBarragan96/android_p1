import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:flutter/material.dart';

class ItemGrainsDetails extends StatefulWidget {
  final ProductGrains selectedGrain;
  ItemGrainsDetails({Key key, @required this.selectedGrain}) : super(key: key);
  @override
  _ItemGrainsDetailsState createState() => _ItemGrainsDetailsState();
}

class _ItemGrainsDetailsState extends State<ItemGrainsDetails> {
  ProductGrains selectedGrain;
  bool fav;
  ProductWeight size;
  @override
  void initState() {
    selectedGrain = widget.selectedGrain;
    fav = selectedGrain.liked;
    size = selectedGrain.productWeight;
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
                          selectedGrain.productImage,
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
                child: Text("${selectedGrain.productTitle}"),
              ),
              Text("${selectedGrain.productDescription}"),
              SizedBox(
                height: 48,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text("Tamaño"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                updateSize(ProductWeight.CUARTO);
                                setState(() {});
                              },
                              child: Container(
                                height: 24,
                                width: 50,
                                color: (size == ProductWeight.CUARTO)
                                    ? Colors.purple[200]
                                    : Colors.white10,
                                child: Center(child: Text("250 g")),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                updateSize(ProductWeight.KILO);
                                setState(() {});
                              },
                              child: Container(
                                height: 24,
                                width: 50,
                                color: (size == ProductWeight.KILO)
                                    ? Colors.purple[200]
                                    : Colors.white10,
                                child: Center(child: Text("1 Kg")),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("Precio"),
                        Text("\$${selectedGrain.productPrice}"),
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

  void updateSize(ProductWeight newSize) {
    size = newSize;
    selectedGrain.productPrice = selectedGrain.productPriceCalculator();
  }
}
