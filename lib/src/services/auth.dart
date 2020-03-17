import 'package:firebase_auth/firebase_auth.dart';
import 'package:hw_4/src/models/user.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  List<String> _authErrors = [];

  Future<User> signInWithEmailAndPassword({ String email, String password }) async {
    try {
      print('#10');
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return User.fromFirebase(user);
    } catch(e) {
      _authErrors.add(e.message);
      return null;
    }
  }

  Future<User> signUpWithEmailAndPassword({ String email, String password }) async {
    try {
      print('#21c');
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return User.fromFirebase(user);
    } catch(e) {
      _authErrors.add(e.message);
      return null;
    }
  }

  Future logout() async {
    await _firebaseAuth.signOut();
  }

  Stream<User> get currentUser {
    return _firebaseAuth.onAuthStateChanged.map((FirebaseUser user) => user != null ? User.fromFirebase(user) : null);
  }

  String popError() {
    return _authErrors.removeLast();
  }
}
