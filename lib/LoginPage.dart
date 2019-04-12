import 'package:flutter/material.dart';
import 'package:moshal/home_dashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:io' as io;
import 'dart:convert' as convert;
import 'package:moshal/SignUp.dart';
import 'package:moshal/api_service.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_button/progress_button.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  LoginPageState createState() => LoginPageState();
}

Future<http.Response> fetchPost() {
  return http.get('https://jsonplaceholder.typicode.com/posts/1');
}

void main() {
  io.HttpClient()
      .getUrl(Uri.parse('https://swapi.co/api/people/1'))
      .then((req) => req.close())
      .then((res) => res.transform(convert.Utf8Decoder()).listen(print));
}

void test(username, password) {
  var client = new http.Client();

  client.post("https://jsonplaceholder.typicode.com/posts", body: {
    "name": username,
    "body": password,
    "bodyId": "1"
  }).then((response) {
    print("Response status: ${response.statusCode}");
    print("Response bodyL ${response.body}");
  });
}

class LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  String _email, _password;
  ApiService apiService;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _eml = TextEditingController();
  final _pass = TextEditingController();
  bool _validate_eml = false;
  bool _validate_pass = false;
  String errorM = "";
  bool isLoading = false;
  bool showPassword = true;
  @override
  void initState() {
    super.initState();
    apiService = new ApiService();
  }

  @override
  void dispose() {
    _eml.dispose();
    _pass.dispose();
    super.dispose();
//    _loginButtonController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.jpeg'),
      ),
    );

    final email = TextField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: _eml,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        errorText: _validate_eml ? 'Email is required' : null,
      ),
      onChanged: (s) => _email = s,
    );

    final password = TextField(

      autofocus: false,
      controller: _pass,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        suffixIcon: new IconButton(icon: new Icon(showPassword ? Icons.visibility_off : Icons.visibility), onPressed:() =>  setState(() => showPassword = !showPassword)),
        errorText: _validate_pass ? 'Password is required' : null,
      ),
      obscureText: showPassword,
      onChanged: (s) => _password = s,
    );

//      final loginbutton = ProgressButton(
//        child: Text("Login"),
//        onPressed: _signin(),
//        buttonState: ButtonState.normal,
//        backgroundColor: Theme.of(context).primaryColor,
//        progressColor: Theme.of(context).primaryColor,
//      );
    final loginbutton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: isLoading
          ? ButtonTheme(
              minWidth: 10.0,
              height: 50.0,
              buttonColor: Colors.white,
              highlightColor: Colors.white,
              splashColor: Colors.red,
              child: RaisedButton(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
                shape: CircleBorder(),
                color: Colors.white,
              ))
          : Material(
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: Colors.white,
              elevation: 5.0,
              child: MaterialButton(
                minWidth: 150.0,
                height: 42.0,
                onPressed: () => {
                      _signin(),
                    },
                color: Colors.indigo,
                child: Text(
                  'Log In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
    );
    final erro =
        Text(errorM, style: TextStyle(color: Colors.red, fontSize: 12.0));

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot Password',
        style: TextStyle(color: Colors.blueAccent),
      ),
      onPressed: () {},
    );

    final register = FlatButton(
      child: Text(
        'Register Here',
        style: TextStyle(color: Colors.blueAccent),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(SignUpPage.tag);
      },
    );

    return new Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(
              height: 48.0,
            ),
            email,
            SizedBox(
              height: 8.0,
            ),
            password,
            SizedBox(
              height: 5.0,
            ),
            erro,
            forgotLabel,
            SizedBox(
              height: 15.0,
            ),
            loginbutton,
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Or ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                register,
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _signin() {
//      debugPrint(" $_password , $_email");
    setState(() {
      isLoading = true;
    });
    if (_eml.text.isEmpty) {
      setState(() {
        _validate_eml = true;
        isLoading = false;
      });
    } else {
      setState(() {
        _validate_eml = false;
      });
    }

    if (_pass.text.isEmpty) {
      setState(() {
        _validate_pass = true;
        isLoading = false;
      });
    } else {
      setState(() {
        _validate_pass = false;
      });
    }

    if (!_eml.text.isEmpty && !_pass.text.isEmpty) {
      apiService.loginUser(_email, _password).then((value) {
        if (value == 404) {
          setState(() {
            isLoading = false;
            errorM = "Email or password is incorrect ";

            return;
          });
          Fluttertoast.showToast(
              msg: "Login Failed",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.blueAccent,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          setState(() {
            isLoading = false;
            errorM = "";
            return;
          });

          Fluttertoast.showToast(
              msg: "Login Successful",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.blueAccent,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.of(context).pushNamed(Dashboard.tag);
          return;
        }
      });
    }
  }
}
