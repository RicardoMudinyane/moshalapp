import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

class Lost extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                child: SimpleFoldingCell(
                    frontWidget: FrontWidget(),
                    innerTopWidget: InnerWidget(),
                    innerBottomWidget: BottomWidget(),

                    cellSize: Size(MediaQuery.of(context).size.width, 150),
                    padding: EdgeInsets.all(8.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container InnerWidget(){

    return Container(
      color: Colors.indigoAccent,

      alignment: Alignment.center,

      child: Container(
        child: Column(

          children: <Widget>[

            Container(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text("Details" , style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.cyan),),
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: <Widget>[

                    Container(
                      child: Icon(Icons.timelapse,
                        color: Colors.cyan,
                      ),
                    ),
                    Container(
                      child: Text("Interviews and Career guidances" , style: TextStyle(fontSize: 20.0, color: Colors.white),),
                    ),

                  ],
                ),
              ),
            ),

            Container(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: <Widget>[

                      Container(
                        child: Icon(Icons.place,
                          color: Colors.cyan,
                        ),
                      ),
                      Container(
                        child: Text("WAM " , style: TextStyle(fontSize: 20.0, color: Colors.white),),
                      ),

                    ],
                  ),
                )
            ),

            Container(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: <Widget>[

                      Container(
                        child: Icon(Icons.timelapse,
                          color: Colors.cyan,
                        ),
                      ),
                      Container(
                        child: Text("09:00 - 11:00" , style: TextStyle(fontSize: 20.0, color: Colors.white),),
                      ),

                    ],
                  ),
                )
            ),


          ],
        ),
      ),
    );

  }

  Container BottomWidget(){

    return Container(
      color: Colors.blueAccent,
      alignment: Alignment.center,

      child: Container(
        child: Column(

          children: <Widget>[

            Container(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text("Speaker" , style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.cyan),),
              ),
            ),
            Container(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(

                    children: <Widget>[
                      Container(
                        child: Icon(Icons.person,
                          color: Colors.cyan,
                        ),
                      ),
                      Container(
                        child: Text("Muimeleli" , style: TextStyle(fontSize: 20.0, color: Colors.white),),
                      ),

                    ],
                  ),
                )
            ),


          ],
        ),
      ),

    );

  }


  Container FrontWidget(){

      return Container(
        color: Colors.white,
        alignment: Alignment.center,

        child: Row(
          children: <Widget>[

            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.indigoAccent,
                ),

                child: Container(
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[


                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Today", style: TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold),),
                            ),
                          ),

                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("09:00 AM", style: TextStyle(color: Colors.white, fontSize: 18.0,fontWeight: FontWeight.bold),),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),

              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blueAccent,
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Container(
                      child: Text(" Interviews and Career guidances", style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold)),
                    ),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Container(
                            child: Icon(
                              Icons.place,
                              color: Colors.redAccent,
                              size: 20.0,
                            ),
                          ),

                          Container(
                            child: Text(" Wits Art Museum", style: TextStyle(color: Colors.limeAccent, fontSize: 20.0, fontWeight: FontWeight.bold)),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      );
  }
}