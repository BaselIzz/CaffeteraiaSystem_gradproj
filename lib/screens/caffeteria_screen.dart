import 'package:flutter/material.dart';

class Caffeteriascreen extends StatefulWidget {
  const Caffeteriascreen({Key? key}) : super(key: key);

  @override
  State<Caffeteriascreen> createState() => _CaffeteriascreenState();
}

class _CaffeteriascreenState extends State<Caffeteriascreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Caffeteria  var "),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Color.fromRGBO(123, 104, 238, 1),
              size: 30.0,
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 25,
                mainAxisExtent: 175,
                childAspectRatio: 0.1),
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 12),
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Image.network(
                                  "https://media.istockphoto.com/photos/cafeteria-picture-id654161580",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                'title',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Theme.of(context).primaryColor),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Time to ready",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
