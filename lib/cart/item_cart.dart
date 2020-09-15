import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class ItemCart extends StatefulWidget {
  final ProductItemCart product;
  final ValueChanged<double> onAmountUpdated;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(24),
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kDarkOrange, kLightOrange],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 10,
              bottom: 10,
              left: 10,
              right: MediaQuery.of(context).size.width / 2,
              child: Image.network(
                widget.product.productImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10,
              bottom: 10,
              left: MediaQuery.of(context).size.width / 2 - 30,
              right: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${widget.product.productTitle}"),
                        Text("${widget.product.productSize}"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.remove_circle,
                          ),
                          onPressed: _remProd,
                        ),
                        Text("${widget.product.productAmount}"),
                        IconButton(
                          icon: Icon(
                            Icons.add_circle_outline,
                          ),
                          onPressed: _addProd,
                        ),
                        Text("\$ ${widget.product.productPrice}"),
                      ],
                    ),
                  ),
                ],
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
            Container(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                //TODO remove item cart
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    setState(
      () {
        if (widget.product.productAmount > 0) {
          --widget.product.productAmount;
          widget.onAmountUpdated(-1 * widget.product.productPrice);
        }
      },
    );
  }

  void updateFav() {
    fav = fav ? false : true;
  }
}
