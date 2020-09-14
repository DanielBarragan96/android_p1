import 'package:estructura_practica_1/colors.dart';
import 'package:flutter/material.dart';

enum PayMethod { CARD, PAYPAL, GIFT }

class Pay extends StatefulWidget {
  Pay({Key key}) : super(key: key);

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  var _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Pagos'),
        backgroundColor: kDarkBlue,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Text(
              "Elige tu método de pago:",
              style: TextStyle(fontSize: 25),
            ),
            margin: EdgeInsets.only(bottom: 10, top: 30, left: 20, right: 20),
          ),
          GestureDetector(
            onTap: () {
              successfulOrder(context, PayMethod.CARD);
            },
            child: Container(
              decoration: BoxDecoration(
                color: kDrakBrown,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: MediaQuery.of(context).size.height / 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      bottom: 10,
                      left: 10,
                      right: MediaQuery.of(context).size.width / 2,
                      child: Image.network(
                        "https://img.icons8.com/ios/452/bank-card-back-side.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: 30,
                      bottom: 10,
                      left: MediaQuery.of(context).size.width / 2,
                      right: 0,
                      child: Text("Tarjeta de crédito"),
                    ),
                    Positioned(
                      top: 3,
                      bottom: 0,
                      right: 5,
                      left: 0,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              successfulOrder(context, PayMethod.PAYPAL);
            },
            child: Container(
              decoration: BoxDecoration(
                color: kDrakBrown,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: MediaQuery.of(context).size.height / 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      bottom: 10,
                      left: 10,
                      right: MediaQuery.of(context).size.width / 2,
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/a/a4/Paypal_2014_logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: 30,
                      bottom: 10,
                      left: MediaQuery.of(context).size.width / 2,
                      right: 0,
                      child: Text("PayPal"),
                    ),
                    Positioned(
                      top: 3,
                      bottom: 0,
                      right: 5,
                      left: 0,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              successfulOrder(context, PayMethod.GIFT);
            },
            child: Container(
              decoration: BoxDecoration(
                color: kDrakBrown,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: MediaQuery.of(context).size.height / 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      bottom: 10,
                      left: 10,
                      right: MediaQuery.of(context).size.width / 2,
                      child: Image.network(
                        "https://www.iconfinder.com/data/icons/everyday-objects-1/128/gift-card-512.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: 30,
                      bottom: 10,
                      left: MediaQuery.of(context).size.width / 2,
                      right: 0,
                      child: Text("Tarjeta de crédito"),
                    ),
                    Positioned(
                      top: 3,
                      bottom: 0,
                      right: 5,
                      left: 0,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void successfulOrder(BuildContext context, PayMethod payMethod) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                "https://malvern.dist.sdlmedia.com/distributions/?o=0d834772-4941-4ed4-83d3-8acf836f66b8?qualitylevel=60&width=1920",
                fit: BoxFit.cover,
              ),
              Text("Su pago se realizo con exito"),
            ],
          ),
        );
      },
    );
  }
}
