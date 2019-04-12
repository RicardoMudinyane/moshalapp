import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {

  final String title;

  @override
  Gallery({this.title}) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new GalleryState();
  }
}

class GalleryState extends State<Gallery> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        appBar: new AppBar(title: new Text("Gallery"), backgroundColor: Colors.redAccent,),

        body: new GridView.extent(
            maxCrossAxisExtent: 150.0,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            padding: const EdgeInsets.all(5.0),
            children: _buildGridTiles(8),//Where is this function ?
          ),
        );
  }

}

List<Widget> _buildGridTiles(numberOfTiles) {
  List<Container> containers = new List<Container>.generate(numberOfTiles,
          (int index) {
        //index = 0, 1, 2,...
        final imageName = index < 9 ?
        'images/0${index + 1}.JPG' : 'images/${index + 1}.JPG';
        return new Container(
          child: new Image.asset(
              imageName,
              fit: BoxFit.fill
          ),
        );
      });
  return containers;
}
