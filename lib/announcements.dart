import 'package:flutter/material.dart';

class Announcements extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        appBar: new AppBar(title: new Text("Announcements")),

        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int blockIdx) {
            print("Building block $blockIdx");
            return new Column(
              children: [
                Padding(
                    child: Text("Block $blockIdx"),
                    padding: EdgeInsets.all(8.0)
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int childIdx) {
                    print("Building block $blockIdx child $childIdx");
                    return Container(
                      color: Colors.lightBlue,
                      margin: new EdgeInsets.symmetric(
                          vertical: 70.0,
                          horizontal: 40.0
                      ),
                      child: Text("Child $childIdx"),
                      padding: EdgeInsets.only(left: 2.0, right: 8.0, top: 8.0, bottom: 8.0),
                    );
                  },
                ),
              ],
            );
          },
        ),



    );
  }
}