import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle style = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
  );

  TextEditingController controllerInputEmail = new TextEditingController();
  TextEditingController controllerInputPass = new TextEditingController();

  Widget build(BuildContext) {
    final email = TextField(
      controller: controllerInputEmail,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          )),
    );

    final password = TextField(
      controller: controllerInputPass,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          )),
    );

    final String user = "Bebitu";
    final String pass = "iubire";

    final loginButton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.lightBlueAccent,
        child: MaterialButton(
        minWidth: MediaQuery
        .of(context)
        .size
        .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    onPressed: () {
      print(controllerInputPass.text);
      if (controllerInputEmail.text.toString() == user &&
          controllerInputPass.text.toString() == pass) {
        print("inside if");
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => SuccessPage()));
      } else {
        print("Else");
        return _errAlert(context);
      }
    },
    child: Text(
    "Login",
    textAlign: TextAlign.center,
    style: style.copyWith(
    color: Colors.blueAccent, fontWeight: FontWeight.bold),
    ),
    ),
    );
    return Scaffold(
    body: SingleChildScrollView(
    child: Center(
    child: Container(
    color: Colors.white,
    child: Padding(
    padding: const EdgeInsets.all(36.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    SizedBox(
    height: 155.0,
    child: Image.asset("assets/logo.png", fit: BoxFit.contain),
    ),
    SizedBox(height: 45.0),
    email,
    SizedBox(height: 25.0),
    password,
    SizedBox(height: 35.0),
    loginButton,
    SizedBox(height: 15.0),
    ],
    ),
    ),
    ),
    ),
    ),
    );
    }
  }

class SuccessPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salut Bebitu'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Inapoi"),

        ),

      ),
      backgroundColor: Colors.blueGrey,

    );
  }
}

Future<void> _errAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Erroare'),
        content: const Text('User sau parola gresita'),
        actions: <Widget>[
          FlatButton(
              child: Text('OK'),
              onPressed: () {Navigator.of(context).pop();}
          )
        ],
      );
    },
  );
}

