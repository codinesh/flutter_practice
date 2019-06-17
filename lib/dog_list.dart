import 'package:flutter/material.dart';
import 'dog_card.dart';
import 'models/dog.dart';

class DogList extends StatelessWidget {
  final List<Dog> doggos;

  DogList(this.doggos);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: doggos.length,
      itemBuilder: (context, index) {
        return DogCard(doggos[index]);
      },
    );
  }
}
