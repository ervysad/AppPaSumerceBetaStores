import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:hello_world_vs/paginas/home.dart';
import 'package:hello_world_vs/sign_up.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '', _password = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final AuthService _auth = AuthService();

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      print('lol $_email, $_password');
      return true;
    } else {
      return false;
    }
  }

  Future<void> validateAndSubmit() async {
    final formState = _formKey.currentState;
    if (validateAndSave()) {
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
        print('existo');
      } catch (e) {
        print('Error $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SingleChildScrollView(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text(
                        'Hecho       pa´ Sumercé',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(330.0, 258.0, 0.0, 0.0),
                      child: Text(
                        '.',
                        style: TextStyle(
                            fontSize: 120.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(top: 420.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: (_val) =>
                                _val.isEmpty ? 'Ingrese su e-mail' : null,
                            onSaved: (_val) => _email = _val,
                            decoration: InputDecoration(
                                labelText: 'Inserte su E-mail',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green))),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          TextFormField(
                            validator: (_val) => _val.length < 6
                                ? 'Ingrese su contraseña'
                                : null,
                            onSaved: (_val) => _password = _val,
                            decoration: InputDecoration(
                                labelText: 'Contraseña',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green))),
                            obscureText: true,
                          ),
                          SizedBox(height: 3.0),
                          Container(
                            alignment: Alignment(1, 0),
                            padding: EdgeInsets.only(top: 15.0, left: 20),
                            child: InkWell(
                              child: Text(
                                '¿Olvidaste tu contraseña?',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                          SizedBox(height: 35),
                          Container(
                            height: 40,
                            child: Material(
                              borderRadius: BorderRadius.circular(5),
                              shadowColor: Colors.greenAccent,
                              color: Colors.black,
                              elevation: 7.0,
                              child: GestureDetector(
                                  onTap: validateAndSubmit,
                                  child: Center(
                                    child: Text(
                                      'INICIAR',
                                      textScaleFactor: 1.5,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 40.0,
                            color: Colors.transparent,
                            child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1.5),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: ImageIcon(
                                          AssetImage('assets/facebook.png')),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Center(
                                      child: Text(
                                        'Iniciar con Facebook',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10.0, left: 20),
                            child: InkWell(
                              child: Text(
                                '¿Nuevo por aquí?',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 40,
                            child: Material(
                              borderRadius: BorderRadius.circular(5),
                              shadowColor: Colors.green,
                              color: Colors.green,
                              elevation: 7.0,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()),
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      'REGISTRATE',
                                      textScaleFactor: 1.7,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
