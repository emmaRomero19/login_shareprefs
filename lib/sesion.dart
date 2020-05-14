import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Sesion());

class Sesion extends StatelessWidget {
  String name;
  String email;
  String pass;

  Sesion({this.name, this.email, this.pass});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Sesion1(name: name, email: email, pass: pass,),
    );
  }
}

class Sesion1 extends StatefulWidget {
  String name;
  String email;
  String pass;
  Sesion1({this.name, this.email, this.pass});

  @override
  _Sesion1State createState() => _Sesion1State(name, email, pass);
}

class _Sesion1State extends State<Sesion1> {
  String name;
  String email;
  String pass;
  _Sesion1State(this.name, this.email, this.pass);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USER'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              SizedBox(height: 25,),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 100.0,
                child: Image.asset('assets/user.png', height: 155,) ,
              ),
              Text('HOLA ' + name + '!',
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 40, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            Text(email),
            Text(pass)
          ],
        ),
      ),
    );
  }
}
