import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Stores {
  String _id;
  String _name;
  String _address;
  String _description;
  String _image;

  Stores(this._id, this._name, this._address, this._description, this._image);

  Stores.map(dynamic obj) {
    this._name = obj['_name'];
    this._address = obj['_address'];
    this._description = obj['_description'];
    this._image = obj['_image'];
  }
  String get id => _id;
  String get name => _name;
  String get address => _address;
  String get description => _description;
  String get image => _image;

  Stores.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _name = snapshot.value['name'];
    _address = snapshot.value['_address'];
    _description = snapshot.value['_description'];
    _image = snapshot.value['_image'];

    //El modelado es el primer paso y todo esta en este archivo
  }
}
