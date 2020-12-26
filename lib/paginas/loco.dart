import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hello_world_vs/sign_in.dart';

class AddUser extends StatelessWidget {
  final String nombre;
  final String apellidos;
  final String emailr;
  final String tel;
  final String passwordrr;

  AddUser(this.nombre, this.apellidos, this.emailr, this.tel, this.passwordrr);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    Firebase.initializeApp();

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));

      return users
          .add({
            'name': nombre, // John Doe
            'lastName': apellidos, // Stokes and Sons
            'email': emailr,
            'tel': tel,
            'pass': passwordrr // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}
