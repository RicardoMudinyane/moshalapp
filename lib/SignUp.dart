import 'package:flutter/material.dart';
import 'package:moshal/home_dashboard.dart';
import 'dart:async';
import 'package:moshal/api_service.dart';

class SignUpPage extends StatefulWidget {

  static String tag = 'signup-page';

  @override
  SignUpPageState createState() => SignUpPageState();

}


class SignUpPageState extends State<SignUpPage>  with SingleTickerProviderStateMixin {

  String _email, _password ,_name, _surname, _gender, _degree, _faculty, _university, _yos, _cellPhone, _cpassword, _dob;



  static const String emailRegExpString =
      r'[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\@[a-zA-Z0-9][a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+';

  static final RegExp emailRegExp =
  new RegExp(emailRegExpString, caseSensitive: false);
  final _formKey = new GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  ApiService apiService;

  DateTime date = new DateTime.now();
  TimeOfDay time = new TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: new DateTime(1980),
        lastDate: new DateTime(2030)
    );

    if (picked != null && picked != date){

      print(" SELECTED DATE :  ${date}");
      setState(() {
       date = picked;
//       _dob = date.year.toString() +"-"+ date.month.toString() +"-"+ date.day.toString();
       _dob =  date.year.toString()+"-"+
           date.month.toString() +"-"+
           date.day.toString();

     });
    }

  }

  List<DropdownMenuItem<String>> lisGender = [];
  String selectedGen = null;
  void  loadData(){
    lisGender = [];

    lisGender.add( new DropdownMenuItem(
      child: new Text("Male"),
      value: "Male",
    ));

    lisGender.add( new DropdownMenuItem(
      child: new Text("Female"),
      value: "Female",
    ));

  }

  List<DropdownMenuItem<String>> lisUni = [];
  String selectedUni = null;
  void  loadData1(){
    lisUni = [];

    lisUni.add( new DropdownMenuItem(
      child: new Text("Wits"),
      value: "Wits",
    ));

    lisUni.add( new DropdownMenuItem(
      child: new Text("UP"),
      value: "UP",
    ));

    lisUni.add( new DropdownMenuItem(
      child: new Text("UFS"),
      value: "UFS",
    ));

    lisUni.add( new DropdownMenuItem(
      child: new Text("KZN"),
      value: "KZN",
    ));

    lisUni.add( new DropdownMenuItem(
      child: new Text("NMU"),
      value: "NMU",
    ));

    lisUni.add( new DropdownMenuItem(
      child: new Text("Rhodes"),
      value: "Rhodes",
    ));

    lisUni.add( new DropdownMenuItem(
      child: new Text("Stellenbosch"),
      value: "Stellenbosch",
    ));

//    lisUni.add( new DropdownMenuItem(
//      child: new Text("Stellenbosch"),
//      value: "eight",
//    ));

    lisUni.add( new DropdownMenuItem(
      child: new Text("UCT"),
      value: "UCT",
    ));

  }

  List<DropdownMenuItem<String>> lisFac  = [];
  String selectedFac = null;
  void  loadData2(){
    lisFac = [];

    lisFac.add( new DropdownMenuItem(
      child: new Text("Science"),
      value: "Science",
    ));

    lisFac.add( new DropdownMenuItem(
      child: new Text("Engineering"),
      value: "Engineering",
    ));

    lisFac.add( new DropdownMenuItem(
      child: new Text("Law"),
      value: "Law",
    ));

    lisFac.add( new DropdownMenuItem(
      child: new Text("Commerce"),
      value: "Commerce",
    ));

    lisFac.add( new DropdownMenuItem(
      child: new Text("Humanity"),
      value: "Humanity",
    ));


  }


  @override
  void initState() {
    super.initState();
    apiService = new ApiService();
  }

  @override
  void dispose() {
    super.dispose();
//    _loginButtonController.dispose();
  }


  @override
  Widget build(BuildContext context) {

    loadData();
    loadData1();
    loadData2();

    final name = TextField(
      autocorrect: true,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Name',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0,20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          )
      ),
      onChanged: (s) => _name = s,
    );

    final surname = TextField(
      autocorrect: true,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Surname',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0,20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          )
      ),onChanged: (s) => _surname = s,
    );

    final email = TextField(
//      autocorrect: true,
      keyboardType: TextInputType.emailAddress,

      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0,20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          )
      ),
      onChanged: (s) => _email = s,
//      validator: (s) =>
//      emailRegExp.hasMatch(s) ? null : 'Invalid email address!',
    );

    final degree = TextField(
      autocorrect: true,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Degree',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0,20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          )
      ),
      onChanged: (s) => _degree = s,
    );

    final yos = TextField(
      keyboardType: TextInputType.number,

      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Year Of Study',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0,20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          )
      ),onChanged: (s) => _yos = s.toString(),
    );

    final phoneNumber = TextField(
      keyboardType: TextInputType.number,

      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Phone Number',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0,20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          )
      ),onChanged: (s) => _cellPhone = s.toString(),
    );



    final password = TextField(

        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0 ,20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          ),

        ),
        obscureText: true,
        onChanged: (s) => _password = s,
    );

    final cpassword = TextField(

        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Confirm Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0 ,20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          ),

        ),
        obscureText: true,
      onChanged: (s) => _cpassword = s,
    );

    final signupbutton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.white,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 150.0,
          height: 42.0,
          onPressed: (){

            _register();
            Navigator.of(context).pushNamed(Dashboard.tag);
          },
          color: Colors.indigo,
          child: Text('Sign Up', style: TextStyle(color: Colors.white),),
        ),
      ),
    );


    return new Scaffold(

      backgroundColor: Colors.white,
      appBar: new AppBar(title: new Text("Register"), backgroundColor: Colors.redAccent,),

      body: Center(

        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[

            SizedBox(height: 8.0,),
            name,
            SizedBox(height: 8.0,),
            surname,
            SizedBox(height: 8.0,),
            email,
            SizedBox(height: 8.0,),

            Container(
              color: Colors.cyan,
            ),
            DropdownButton(
                value: selectedGen,
                items: lisGender,
                hint: Text("Gender"),
                onChanged: (value){
                  _gender = value;
                  selectedGen = value;
                  setState(() {
                  });
                },

            ),

            SizedBox(height: 8.0,),
            // DOB

            Row(
              children: <Widget>[

                FlatButton(
                  onPressed: () {_selectDate(context);},
                  color: Colors.cyan,

                  child: Row(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      SizedBox(width: 5.0,),
                      Text("DOB")
                    ],
                  ),

                ),

                SizedBox(width: 30.0,),
                Text(" : "+ date.year.toString()+"-"+
                    date.month.toString() +"-"+
                    date.day.toString()  ,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),

              ],
            ),

            SizedBox(height: 8.0,),

            // University
            Container(
              color: Colors.cyan,
              child: DropdownButton(
                value: selectedUni,
                items: lisUni,
                hint: Text("University"),
                onChanged: (value){
                  selectedUni = value;
                  _university = value;
                  setState(() {
                  });
                },

              ),
            ),


            SizedBox(height: 8.0,),

            // Faculty //
            Container(
              color: Colors.cyan,
              child:  DropdownButton(
                value: selectedFac,
                items: lisFac,
                hint: Text("Faculty"),
                onChanged: (value){
                  selectedFac = value;
                  _faculty = value;
                  setState(() {
                  });
                },
              ),
            ),

            SizedBox(height: 8.0,),
            degree,
            SizedBox(height: 8.0,),
            yos,
            SizedBox(height: 8.0,),
            phoneNumber,
            SizedBox(height: 8.0,),
            password,
            SizedBox(height: 8.0,),
            cpassword,
            SizedBox(height: 24.0,),
            signupbutton,

          ],

        ),
      ),

    );
  }
  void _register() {
//
//    if (!_formKey.currentState.validate()) {
//      _scaffoldKey.currentState.showSnackBar(
//        new SnackBar(content: new Text('Invalid information')),
//      );
//      return;
//    }
//
//    _formKey.currentState.save();
//    _loginButtonController.reset();
//    _loginButtonController.forward();

    debugPrint(" $_name $_surname, $_email, $_gender, $_dob, $_university, $_faculty, $_degree, $_yos, $_cellPhone , $_password , $_cpassword");
//    apiService.loginUser(_email, _password);
 apiService.registerUser(_name, _surname, _email, _gender, _dob, _university, _faculty, _degree, _yos, _cellPhone , _password , _cpassword);
//    .then((Response response) {
////      _loginButtonController.reverse();
//      _scaffoldKey.currentState
//          .showSnackBar(
//        new SnackBar(content: new Text(response.message)),
//      )
//          .closed
//          .then((_) => Navigator.of(context).pop());
//    }).catchError((error) {
////      _loginButtonController.reverse();
//      final message =
//      error is MyHttpException ? error.message : 'Unknown error occurred';
//      _scaffoldKey.currentState.showSnackBar(
//        new SnackBar(content: new Text(message)),
//      );
//    });
  }
}