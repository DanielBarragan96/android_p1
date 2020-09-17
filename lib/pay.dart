import 'package:estructura_practica_1/colors.dart';
import 'package:flutter/material.dart';

enum PayMethod { CARD, PAYPAL, GIFT }

class Pay extends StatefulWidget {
  final bool payNow;
  Pay({Key key, @required this.payNow}) : super(key: key);

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  var _scaffoldkey = GlobalKey<ScaffoldState>();
  bool payNow;

  @override
  void initState() {
    payNow = widget.payNow;
    super.initState();
  }

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
              style: Theme.of(context).textTheme.headline6,
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
                      child: Text(
                        "Tarjeta de crédito",
                        style: Theme.of(context).textTheme.headline5,
                      ),
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
                      child: Text(
                        "PayPal",
                        style: Theme.of(context).textTheme.headline5,
                      ),
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
                      child: Text(
                        "Tarjeta de regalo",
                        style: Theme.of(context).textTheme.headline5,
                      ),
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
    if (!payNow) {
      //limpiar carrito
      Navigator.of(context).pop(true);
    }
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          content: Container(
            child: Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    "coffee.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kWhite,
                    ),
                    child: Container(
                      color: kDarkBlue,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8,
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 20),
                                Container(
                                  color: kDarkBlue,
                                  height: 50,
                                  width: 50,
                                  padding: const EdgeInsets.all(5),
                                  child: Image.asset(
                                    "cupping.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  '¡Orden exitosa!',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Tu orden ha sido registrada para mas información busca en la opción historial de compras en el perfil.",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: FlatButton(
                              child: Text(
                                'ACCEPTAR',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
