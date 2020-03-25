import 'package:firebase_auth/firebase_auth.dart';

class User {
  String id;
  String email;
  String displayName;
  String photoUrl;

  User.fromFirebase(FirebaseUser user) {
    id = user.uid;
    email = user.email;
    displayName = user.displayName;
    photoUrl = user.photoUrl;
  }
}
