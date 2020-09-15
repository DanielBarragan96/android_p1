import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/desserts/desserts_page.dart';
import 'package:estructura_practica_1/drinks/hot_drinks_page.dart';
import 'package:estructura_practica_1/grains/grains_page.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';
import 'package:estructura_practica_1/profile.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _scaffoldkey = GlobalKey<ScaffoldState>();
  Map<String, dynamic> productsList = {
    "bebidas": List<ProductHotDrinks>(),
    "granos": List<ProductGrains>(),
    "postres": List<ProductDessert>()
  };
  List<ProductItemCart> cartList = new List<ProductItemCart>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      drawer: Drawer(
        child: Profile(
          cartList: cartList,
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Cart(productsList: cartList);
                  },
                ),
              );
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: ItemHome(
              title: "Bebidas calientes",
              image: "https://i.imgur.com/XJ0y9qs.png",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Granos",
              image: "https://i.imgur.com/5MZocC1.png",
            ),
          ),
          GestureDetector(
            onTap: _openDessertPage,
            child: ItemHome(
              title: "Postres",
              image: "https://i.imgur.com/fI7Tezv.png",
            ),
          ),
          GestureDetector(
            onTap: () {
              _snackBarTazas();
            },
            child: ItemHome(
              title: "Tazas",
              image: "https://i.imgur.com/fMjtSpy.png",
            ),
          ),
        ],
      ),
    );
  }

  void _openHotDrinksPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return HotDrinksPage(
            drinksList: ProductRepository.loadProducts(ProductType.BEBIDAS),
          );
        },
      ),
    ).then(
      (item) => _addItemToCart(item),
    );
  }

  void _openGrainsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return GrainsPage(
            grainsList: ProductRepository.loadProducts(ProductType.GRANO),
          );
        },
      ),
    ).then(
      (item) => _addItemToCart(item),
    );
  }

  void _openDessertPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DessertsPage(
            dessertList: ProductRepository.loadProducts(ProductType.POSTRES),
          );
        },
      ),
    ).then(
      (item) => _addItemToCart(item),
    );
  }

  void _snackBarTazas() {
    _scaffoldkey.currentState
      //para esconder el snackbar actual
      ..hideCurrentSnackBar()
      //mostrar dialogo
      ..showSnackBar(SnackBar(
        content: Text("Proximamente"),
        duration: Duration(milliseconds: 1000),
      ));
  }

  bool _addItemToCart(dynamic item) {
    if (item is ProductHotDrinks ||
        item is ProductGrains ||
        item is ProductDessert) {
      cartList.add(
        ProductItemCart(
          productTitle: item.productTitle,
          productAmount: item.productAmount + 1,
          productPrice: item.productPrice,
          productImage: item.productImage,
        ),
      );
    }
    return true;
  }
}
