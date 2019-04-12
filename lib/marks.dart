import 'package:flutter/material.dart';

class Marks extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: (){
      Navigator.pop(context);
    },

    child : Scaffold(

        appBar: new AppBar(
          title: new Text("Marks Submission"),
          backgroundColor: Colors.redAccent,
          leading: IconButton(icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          }),
        ),
        resizeToAvoidBottomPadding: true,

        body: ListView(


          children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(left:8.0, right: 8.0 , top: 30.0),
                child: new ListTile(
                title: new TextFormField(

                  decoration: new InputDecoration(
                      labelText: 'Course Code',
                      hintText: 'COMS 3007',
                      border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left:8.0, right: 8.0 , top: 5.0),
                child: new ListTile(
                  title: new TextFormField(

                  decoration: InputDecoration(
                    labelText: 'Module Name',
                    hintText: 'Machine Learning',
                    border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.text,
                    style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
              ),

              Padding(
                padding: const EdgeInsets.only(left:8.0, right: 8.0 , top: 5.0),
                child: new ListTile(
                  title: new TextFormField(

                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Test 1',
                    border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.text,
                    style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
              ),

              Padding(
                padding: const EdgeInsets.only(left:8.0, right: 8.0 , top: 5.0),
                child: new ListTile(
                  title: new TextFormField(

                  decoration: InputDecoration(
                    labelText: 'Marks',
                    hintText: '100%',
                    border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
                    style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
              ),

              Padding(
                padding: const EdgeInsets.only(left:8.0, right: 8.0 , top: 5.0),
                child: new ListTile(
                  title: new TextFormField(

                  decoration: InputDecoration(
                    labelText: 'Test Date',
                    hintText: '17/02/2017',
                    border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.datetime,
                    style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
              ),


              Padding(
                padding: const EdgeInsets.only(left:50.0, right: 50.0 , top: 10.0),
                child : new ListTile(
                    title: new RaisedButton(
                    child: const Text('Submit' , style: TextStyle(fontWeight: FontWeight.bold),),
                    color: Theme.of(context).accentColor,
                    elevation: 8.0,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    splashColor: Colors.blueGrey,
                    onPressed: () {
                      // Perform some action
                    },
                  ),
                ),
              ),

          ],
        ),

      )
    );
  }
}