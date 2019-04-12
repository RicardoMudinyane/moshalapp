import 'package:flutter/material.dart';

class Messaging extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        appBar: new AppBar(title: new Text('Messaging')),

        body:

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.send ,color: Colors.blueAccent, size: 37.0,),
                hintText: 'Type a message',
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(40.0),
                  ),
                )
            ),
          ),
        ),



    );
  }
}