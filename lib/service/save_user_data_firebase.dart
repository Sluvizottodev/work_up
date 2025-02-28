import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveUserData(String uid, String name, String email) async {
  await FirebaseFirestore.instance.collection('users').doc(uid).set({
    'name': name,
    'email': email,
  });
}