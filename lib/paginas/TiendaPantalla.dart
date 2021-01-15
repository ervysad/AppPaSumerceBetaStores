import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hello_world_vs/logic/dat_store.dart';

class StoresScreen extends StatefulWidget {
  final Stores stores;
  StoresScreen(this.stores);

  @override
  _StoresScreenState createState() => _StoresScreenState();
}

final storeReference = FirebaseDatabase.instance.reference().child('stores');

class _StoresScreenState extends State<StoresScreen> {
  List<Stores> items;

  TextEditingController _nameController;
  TextEditingController _addressController;
  TextEditingController _descriptionController;
  TextEditingController _imageController;

  @override
  void initState() {
    super.initState();
    _nameController = new TextEditingController(text: widget.stores.name);
    _addressController = new TextEditingController(text: widget.stores.address);
    _descriptionController =
        new TextEditingController(text: widget.stores.description);
    _imageController = new TextEditingController(text: widget.stores.image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Tiendasss'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        height: 570.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
            child: Center(
                child: Column(children: <Widget>[
          TextField(
            controller: _nameController,
            style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
            decoration:
                InputDecoration(icon: Icon(Icons.person), labelText: 'Nombre'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Divider(),
          TextField(
            controller: _descriptionController,
            style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
            decoration: InputDecoration(
                icon: Icon(Icons.list), labelText: 'Descripcion'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Divider(),
          TextField(
            controller: _addressController,
            style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
            decoration:
                InputDecoration(icon: Icon(Icons.face), labelText: 'Direccion'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Divider(),
          TextField(
            controller: _imageController,
            style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
            decoration:
                InputDecoration(icon: Icon(Icons.image), labelText: 'Imagen'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Divider(),
          FlatButton(
              onPressed: () {
                if (widget.stores.id != null) {
                  storeReference.child(widget.stores.id).set({
                    'name': _nameController.text,
                    'address': _addressController.text,
                    'description': _descriptionController.text,
                    'image': _imageController.text,
                  }).then((_) {
                    Navigator.pop(context);
                  });
                } else {
                  storeReference.push().set({
                    'name': _nameController.text,
                    'address': _addressController.text,
                    'description': _descriptionController.text,
                    'image': _imageController.text,
                  });
                }
              },
              child: (widget.stores.id != null) ? Text('Update') : Text('Add')),
        ]))),
      ),
    );
  }
}
