import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginshareprefs/sesion.dart';

void main() => runApp(Login());

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: register());
  }
}

class register extends StatelessWidget {
  String _name;
  String _email;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 50.0,
                  child: Image.asset(
                    'assets/user.png',
                    height: 200,
                  ),
                )),
            Form(
              key: _formKey,
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Name',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          icon: Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Name is required';
                        }
                      },
                      onSaved: (String value) {
                        _name = value;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          icon: Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(
                                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                            .hasMatch(value)) {
                          return 'Email invalid';
                        }
                      },
                      onSaved: (String value) {
                        _email = value;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          icon: Icon(Icons.vpn_key),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Password is required';
                        }
                      },
                      onSaved: (String value) {
                        _password = value;
                      },
                    ),
                    SizedBox(height: 50),
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        child: RaisedButton(
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: Colors.cyanAccent[400],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            onPressed: () {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }
                              _formKey.currentState.save();
                              print(_name);
                              print(_email);
                              print(_password);
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return Sesion(name: _name, email: _email, pass: _password,);
                              }));
                            })),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
