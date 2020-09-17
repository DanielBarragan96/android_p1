import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class ItemCart extends StatefulWidget {
  final ProductItemCart product;
  final ValueChanged<double> onAmountUpdated;
  final int index;
  final ValueChanged<int> onDeleteCard;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
    @required this.index,
    @required this.onDeleteCard,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
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
                        Text(
                          "${widget.product.productTitle}",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SingleChildScrollView(
                          child: Text(
                            "${widget.product.productSize}",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
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
                        Text(
                          "\$ ${widget.product.productPrice}",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
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
                  color:
                      widget.product.productLiked ? Colors.red : Colors.black38,
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
                //remove item cart
                onPressed: () {
                  widget.onDeleteCard(widget.index);
                  setState(() {});
                },
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
    widget.product.productLiked = (widget.product.productLiked) ? false : true;
  }
}
