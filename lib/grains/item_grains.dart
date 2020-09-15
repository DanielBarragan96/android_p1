import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grain;
  ItemGrains({
    Key key,
    @required this.grain,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
  ProductGrains grain;
  bool fav;
  @override
  void initState() {
    grain = widget.grain;
    fav = grain.liked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kDrakBrown,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: MediaQuery.of(context).size.height / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              bottom: 10,
              right: 10,
              left: MediaQuery.of(context).size.width / 2,
              child: Image.network(
                grain.productImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: MediaQuery.of(context).size.width / 2 - 35,
              left: 0,
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Grano"),
                        SingleChildScrollView(
                          child: Text(
                            "${widget.grain.productTitle}",
                          ),
                        ),
                        Text(
                          "${widget.grain.productPrice}",
                        ),
                      ],
                    ),
                  ),
                ),
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
          ],
        ),
      ),
    );
  }

  void updateFav() {
    fav = fav ? false : true;
  }
}
