import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void initializeFirebase() async {
  await Firebase.initializeApp();
}

FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
FirebaseAuth authInstance = FirebaseAuth.instance;
