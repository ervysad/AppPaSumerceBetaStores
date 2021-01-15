import 'package:flutter/material.dart';
import 'package:hello_world_vs/Gauth.dart';
import 'package:hello_world_vs/sign_in.dart';
import 'package:hello_world_vs/paginas/home.dart';
import 'package:hello_world_vs/paginas/ListaTiendas.dart';
//Last Version 14/01/2021

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Stack(children: <Widget>[
                  Container(
                    child: Column(children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 50.0, left: 0),
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('icons/logo11.png'),
                            fit: BoxFit.fill,
                          ),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        //Text TyC}

                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Términos y Condiciones',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        margin: new EdgeInsets.symmetric(
                            vertical: 20, horizontal: 60),
                        padding: EdgeInsets.fromLTRB(10, 20.0, 10.0, 20.0),
                        child: Text(
                          'Al aceptar los términos y condiciones manifiesta de manera libre, expresa, inequivoca e informada, que autoriza a Hecho Pa Sumercé identificado con NIT. XXX.XXX.XXX-X para que, en los terminos de la Ley 1581 de 2012, su Decreto reglamentario 1377 de 2014, la Ley 1266 de 2008, los capitulos 25 y 26 del Decreto 1074 de 2015 y demás normas concordantes, realice la recolección almacenamiento, uso, circulación, supersión y en general, tratamiento de sus datos personales, asi como biometricos, biograficos y demas datos que pueda llegar a ser considerados como sensibles de conformidad con la ley.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black87,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          verify();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListViewProduct()));
                        },
                        color: Colors.green[300],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Aceptar',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RaisedButton(
                        onPressed: () {
                          signOutGoogle();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }), ModalRoute.withName('/'));
                        },
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'No Aceptar',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                    ]),
                  ),
                ]))
          ]))),
    );
  }
}

Future<void> verify() async {
  if (logInType == 1) {
    email = email1;
    name = "name default";
  }

  print(name);
  print("Verifica");
}
