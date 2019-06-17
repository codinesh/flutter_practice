import 'package:flutter/material.dart';
import 'models/dog.dart';

class AddDog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddDogState();
  }
}

class _AddDogState extends State<AddDog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  submit(BuildContext context) {
    if (nameController.text.isEmpty) {
      print('Empty name.');
    } else {
      var newDog = Dog(nameController.text, 'location', 'description');
      Navigator.of(context).pop(newDog);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new dog'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
          color: Colors.black38,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 32),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                      controller: nameController,
                      onChanged: (v) {
                        nameController.text = v;
                        print(nameController.text);
                      },
                      decoration: InputDecoration(
                        labelText: 'Name the Pup',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                      decoration: InputDecoration(
                    labelText: "Pup's location",
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'All about the pup',
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
