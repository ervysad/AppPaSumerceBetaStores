import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hello_world_vs/paginas/loco.dart';

// AQUI INICIA LA VENTANA DE REGISTRO

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _emailr = '',
      _passwordr = '',
      _passwordrr = '',
      _nombre = '',
      _apellidos = '',
      _tel = '',
      _sexof;
  final _formKey1 = GlobalKey<FormState>();
  var _sextipe = ['Masculino', 'Femenino'];
  var _currentItemSelected = 'Masculino';

  Widget build(BuildContext context) {
    return new Scaffold(
        body: SingleChildScrollView(
            child: SingleChildScrollView(
      child: Form(
        key: _formKey1,
        child: Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                    height: 40,
                    width: 80,
                    child: BackButton(
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text(
                      'Bienvenido',
                      style: TextStyle(
                          fontSize: 60.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(310.0, 53.0, 0.0, 0.0),
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
                        EdgeInsets.only(top: 180.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          onChanged: (_val) {
                            setState(() => _nombre = _val);
                          },
                          decoration: InputDecoration(
                              labelText: '¿Cual es tu nombre?',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          onChanged: (_val) {
                            setState(() => _apellidos = _val);
                          },
                          decoration: InputDecoration(
                              labelText: '¿Cuales son tus apellidos?',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          obscureText: false,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          validator: (_val) =>
                              _val.isEmpty ? 'Ingrese su e-mail' : null,
                          onChanged: (_val) {
                            setState(() => _emailr = _val);
                          },
                          decoration: InputDecoration(
                              labelText: 'Ingresa tu E-mail',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          obscureText: false,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          validator: (_val) => _val.length != 10
                              ? 'El número debe tener 10 dígitos'
                              : null,
                          onChanged: (_val) {
                            setState(() => _tel = _val);
                          },
                          decoration: InputDecoration(
                              labelText: 'Ingresa un número de teléfono',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          obscureText: false,
                        ),
                        TextFormField(
                          validator: (_val) => _val.length < 6
                              ? 'La contraseña debe tener al menos 6 carácteres'
                              : null,
                          onChanged: (_val) {
                            setState(() => _passwordr = _val);
                          },
                          decoration: InputDecoration(
                              labelText: 'Establece una contraseña',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          obscureText: true,
                        ),
                        TextFormField(
                          validator: (_val) => _val != _passwordr
                              ? 'Las contraseñas no coinciden'
                              : null,
                          onChanged: (_val) {
                            setState(() => _passwordrr = _val);
                          },
                          decoration: InputDecoration(
                              labelText: 'Vuelve a escribir la contraseña',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          obscureText: true,
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 40,
                          width: 80,
                          alignment: Alignment(0.0, 0.0),
                          child: Text(
                            "Sexo:",
                            textScaleFactor: 1.2,
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0.0, left: 10),
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Material(
                            child: DropdownButton<String>(
                              items: _sextipe.map((String dropdownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropdownStringItem,
                                  child: Text(dropdownStringItem),
                                );
                              }).toList(),
                              onChanged: (String newValueSelected) {
                                setState(() {
                                  this._currentItemSelected = newValueSelected;
                                  _sexof = newValueSelected;
                                });
                              },
                              value: _currentItemSelected,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: 40,
                          child: Material(
                            borderRadius: BorderRadius.circular(5),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: GestureDetector(
                                onTap: validateAndSubmit,
                                child: Center(
                                  child: Text(
                                    'COMPLETAR REGISTRO',
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
                                      'Registrar con Facebook',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    )));
  }

  bool validateAndSave() {
    final form = _formKey1.currentState;
    if (form.validate()) {
      form.save();
      print('lol $_emailr, $_passwordr');
      return true;
    } else {
      return false;
    }
  }

  Future<void> validateAndSubmit() async {
    await Firebase.initializeApp();
    final formState = _formKey1.currentState;
    if (validateAndSave()) {
      formState.save();
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _emailr, password: _passwordr);
      print('registro_completado');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AddUser(_nombre, _apellidos, _emailr, _tel, _passwordrr)));

      print('creado');
    }
  }
}
