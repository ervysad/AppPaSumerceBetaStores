import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hello_world_vs/logic/dat_store.dart';

class StoresInformation extends StatefulWidget {
  final Stores stores;
  StoresInformation(this.stores);
  @override
  _StoresInformationState createState() => _StoresInformationState();
}

final storeReference = FirebaseDatabase.instance.reference().child('stores');

class _StoresInformationState extends State<StoresInformation> {
  List<Stores> items;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tienda, Informacion y Foto'),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Container(
          height: 800.0,
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: Center(
              child: Column(
                children: <Widget>[
                  new Text(
                    "Name : ${widget.stores.name}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  new Text(
                    "Direccion : ${widget.stores.address}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  new Text(
                    "Description : ${widget.stores.description}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  new Text(
                    "Imagen : ${widget.stores.image}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  Container(
                    height: 300.0,
                    width: 300.0,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
