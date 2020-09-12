import 'package:flutter/material.dart';

class ItemGrainsDetails extends StatefulWidget {
  ItemGrainsDetails({Key key}) : super(key: key);
  @override
  _ItemGrainsDetailsState createState() => _ItemGrainsDetailsState();
}

class _ItemGrainsDetailsState extends State<ItemGrainsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle Grano"),
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
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {},
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: FlutterLogo(
                          size: 160,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: Text("Titulo del producto"),
              ),
              Text("Lorem ipsum dolor sit amet consectetur adipiscing elit,"
                  "diam aliquet dui semper integer lacinia velit taciti, eget nisl hac "
                  "suspendisse erat purus. Eu odio dignissim leo elementum phasellus "
                  "libero accumsan, suspendisse facilisis consequat sociosqu nibh hac "
                  "curabitur nulla, augue lectus bibendum tempus urna sociis. "
                  "Pellentesque varius bibendum arcu imperdiet accumsan tempor "
                  "a at vel sapien eleifend et duis, rhoncus eros sociis nullam "
                  "molestie blandit netus ultrices morbi quam augue lacus."),
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
                        Text("\$69"),
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
                      child: Text("Boton 1"),
                      color: Colors.yellow[200],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text("Boton 2"),
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
