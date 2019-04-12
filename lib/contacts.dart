import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {


  @override
  ContactsState createState() {
    return new ContactsState();
  }
}

class ContactsState extends State<Contacts> {

  final Key keyOne = PageStorageKey('pageOne');

  int currentTab = 0;

  PageOne one;
  List<Widget> pages;
  Widget currentPage;

  List<Data> dataList;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    dataList = [
      Data(1, false, "Jodi Bailey" , "Cm@moshalscholarship.org", "+27 82 490 8837"),
      Data(2, false, "Shanaaz Kapery Randeria" , "WITSPSC@moshalscholarship.org" , "+ 27 78 695 7192"),
      Data(3, false, "Val Jansen" ,"FO@moshalscholarship.org" ,"+27 82 653 7032"),
      Data(4, false, "Serena Padayachee", "CCS@moshalscholarship.org", "+27 82 666 1841" ),
      Data(5, false, "Nicole Petersen" , "CCS@moshalscholarship.org", "+27 82 666 1841"),
      Data(6, false, "Simon Hove" , "UPPC@moshalscholarship.org", "+ 27 78 695 7192"),
      Data(7, false, "Mandy Waller" , "UKZNPC@moshalscholarship.org", "+ 27 78 695 7192"),
      Data(8, false, "Debra Cairns" , "ECPC@moshalscholarship.org", "+ 27 78 695 7192"),
      Data(9, false, "Carien Smit" , "UFSPC@moshalscholarship.org", "+ 27 78 695 7192"),
      Data(10, false, "Nokuthula Zama" , "WCPC@moshalscholarship.org", "+ 27 78 695 7192"),
    ];
    one = PageOne(
      key: keyOne,
      dataList: dataList,
    );


    pages = [one];

    currentPage = one;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        appBar: new AppBar(title: new Text("Contacts"), backgroundColor: Colors.redAccent,),

        body: PageStorage(
          child: currentPage,
          bucket: bucket,
        ),
//        currentTab = index;
//        currentPage = pages[index];
//


    );
  }
}

class PageOne extends StatefulWidget {
  final List<Data> dataList;
  PageOne({
    Key key,
    this.dataList,
  }) : super(key: key);

  @override
  PageOneState createState() => PageOneState();
}

class PageOneState extends State<PageOne> {

  @override
  Widget build(BuildContext context) {
    double full_width = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: widget.dataList.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            key: PageStorageKey('${widget.dataList[index].id}'),
            title: Text(widget.dataList[index].title),

            children: <Widget>[
              Container(

                color: index % 2 == 0 ? Colors.blueAccent : Colors.blueAccent,
                height: 50.0,
                width: full_width,

                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[


                new Padding(
                padding: const EdgeInsets.only(top: 5.0,),
                   child: Text(widget.dataList[index].email, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 5.0,),
                  child: Text(widget.dataList[index].phone, style: TextStyle(fontWeight: FontWeight.bold),  textAlign: TextAlign.center),
                ),



                  ],
                ),
              ),
            ],
          );
        });
  }
}

class Data {
  final int id;
  bool expanded;
  final String title;
  final String email;
  final String phone;
  Data(this.id, this.expanded, this.title, this.email, this.phone);
}