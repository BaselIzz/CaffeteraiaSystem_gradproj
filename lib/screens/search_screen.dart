import 'package:flutter/material.dart';
import 'package:new_project/screens/caffeteria_screen.dart';
import 'package:new_project/model/caffeteria.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({Key? key}) : super(key: key);

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  static List<Caffeteria> caffelist_item = [
    Caffeteria(
      "Alloum",
      "https://media.istockphoto.com/photos/cafeteria-picture-id654161580",
    ),
    Caffeteria(
      "Alloum",
      "https://media.istockphoto.com/photos/cafeteria-picture-id654161580",
    ),
    Caffeteria(
      "tyjara",
      "https://media.istockphoto.com/photos/cafeteria-picture-id654161580",
    ),
    Caffeteria(
      "adab",
      "https://media.istockphoto.com/photos/cafeteria-picture-id654161580",
    ),
    Caffeteria(
      "Alloum",
      "https://media.istockphoto.com/photos/cafeteria-picture-id654161580",
    ),
    Caffeteria(
      "Alloum",
      "https://media.istockphoto.com/photos/cafeteria-picture-id654161580",
    ),
    Caffeteria(
      "Alloum",
      "https://media.istockphoto.com/photos/cafeteria-picture-id654161580",
    ),
    Caffeteria(
      "Alloum",
      "https://media.istockphoto.com/photos/cafeteria-picture-id654161580",
    ),
    Caffeteria(
      "Alloum",
      "https://media.istockphoto.com/photos/cafeteria-picture-id654161580",
    ),
  ];
  final fieldText = TextEditingController();
  List<Caffeteria> display_list = List.from(caffelist_item);
  void clearText() {
    fieldText.clear();
  }

  void updatelist(String value) {
    // this is for the filter cafeteria
    setState(() {
      display_list = caffelist_item
          .where((element) => element.caffeteria_name!
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Caffeteria Mangment System",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: fieldText,
              onChanged: (value) => updatelist(value),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 13),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 0.8),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30.0,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      clearText();
                      updatelist("");
                      ;
                    });
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 25,
                  mainAxisExtent: 175,
                  childAspectRatio: 0.1),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              itemCount: display_list.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Caffeteriascreen()));
                  },
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
                                    display_list[index]
                                        .caffeteria_url
                                        .toString(),
                                    fit: BoxFit.fill),
                              ),
                              Text(
                                display_list[index].caffeteria_name.toString(),
                                style: const TextStyle(
                                    fontSize: 14.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
