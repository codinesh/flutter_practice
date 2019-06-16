import 'package:flutter/material.dart';
import 'models/dog.dart';

class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard(this.dog);

  @override
  _DogCardState createState() => _DogCardState(dog);
}

class _DogCardState extends State<DogCard> {
  Dog dog;
  String renderUrl;
  _DogCardState(this.dog);

  void initState() {
    super.initState();
    renderDogPic();
  }

  void renderDogPic() async {
    await dog.getImageUrl();

    if (mounted) {
      setState(() {});
      renderUrl = dog.imageUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Contaner(
      height: 115,
      child: Stack(
        children: <Widget>[
          Positioned(child: dogImage),
        ],
      ),
    );
  }

  Widget get dogImage {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(renderUrl ?? ''),
        ),
      ),
    );
  }

  Widget get dogCard {
    return Container(
      width: 290,
      height: 115,
      child: Card(
        color: Colors.black87,
        child: Padding(
            padding: const EdgeInsets.only(top: 0.8, bottom: 8.0, left: 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  widget.dog.name,
                  style: Theme.of(context).textTheme.headline,
                ),
                Text(widget.dog.location,
                    style: Theme.of(context).textTheme.subhead),
                Row(
                  children: <Widget>[
                    Icon(Icons.star),
                    Text(':${widget.dog.rating}/10')
                  ],
                )
              ],
            )),
      ),
    );
  }
}
