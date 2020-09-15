import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

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
                    );
                  },
                ),
              ),
              Text("Total:"),
              Text("\$$_total MX"),
            ],
          ),
        ],
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }
}
