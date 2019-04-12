import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

class Docs extends StatefulWidget {

  @override
  DocsState createState() {
    return new DocsState();
  }
}

class DocsState extends State<Docs> {

  String _fileName = 'No File Selected';
  String _path = '...';

  void _openFileExplorer() async {
    if (FileType.CUSTOM != FileType.CUSTOM || true) {

      try {
        _path = await FilePicker.getFilePath(type: FileType.CUSTOM, fileExtension: "pdf");
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
    }

    setState(() {
      _fileName = _path != null ? _path.split('/').last : '...';
    });

  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        appBar: new AppBar(title: new Text("Upload Documents"), backgroundColor: Colors.redAccent,),

        body:
        SingleChildScrollView(
          child: new Center(
              child: new Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[


                    new Padding(
                      padding: const EdgeInsets.only(top: 50.0,),
                      child: new RaisedButton(
                        color: Theme.of(context).accentColor,
                        elevation: 4.0,
                        onPressed: () => _openFileExplorer(),
                        child: new Text("Choose File ..."),
                      ),
                    ),

                    new Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: new Text(
                        'File Name : ${_fileName}',
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),


                    new Padding(
                      padding: const EdgeInsets.only(top: 50.0,),
                      child: new RaisedButton(
                        color: Theme.of(context).accentColor,
                        elevation: 4.0,
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        splashColor: Colors.blueGrey,
                        onPressed: () => debugPrint("Working"),
                        child: new Text("Send"),
                      ),
                    ),
//                    new Text(
//                      _fileName,
//                      textAlign: TextAlign.center,
//                    ),
                  ],

                ),
              )),

        ),


    );
  }
}