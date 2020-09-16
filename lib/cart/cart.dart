import 'package:estructura_practica_1/pay.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

import '../colors.dart';

class Cart extends StatefulWidget {
  final List<ProductItemCart> productsList;
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  var _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    for (var item in widget.productsList) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("Lista de compras"),
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height,
          ),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  itemCount: widget.productsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemCart(
                      onAmountUpdated: _priceUpdate,
                      product: widget.productsList[index],
                      index: index,
                      onDeleteCard: _removeCard,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text("Total:"),
                    Text("\$$_total MX"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                height: 40,
                child: MaterialButton(
                  onPressed: () {
                    if (widget.productsList.length > 0) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Pay(payNow: false);
                          },
                        ),
                      ).then(
                        (value) {
                          if (value) widget.productsList.clear();
                        },
                      );
                    } else {
                      //TODO Mensaje de no hay productos
                      _carritoVacio();
                    }
                  },
                  child: Text("PAGAR"),
                  color: kDrakBrown,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(
      () {
        _total += newItemPrice;
      },
    );
  }

  void _removeCard(int index) {
    int amount = widget.productsList[index].productAmount;
    double price = widget.productsList[index].productPrice;
    double total = amount * price;
    _priceUpdate(-total);
    widget.productsList.removeAt(index);
    setState(() {});
  }

  void _carritoVacio() {
    _scaffoldkey.currentState
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text("Para poder pagar agregue elementos al carrito"),
        duration: Duration(milliseconds: 1000),
        behavior: SnackBarBehavior.floating,
      ));
  }
}
