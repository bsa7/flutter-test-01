import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hw_4/src/models/user.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  List<String> _authErrors = [];

  Future<User> signInWithEmailAndPassword({ String email, String password }) async {
    try {
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
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return User.fromFirebase(user);
    } catch(e) {
      _authErrors.add(e.message);
      return null;
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential googleCredential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      AuthResult result = await _firebaseAuth.signInWithCredential(googleCredential);
      FirebaseUser user = result.user;
      return User.fromFirebase(user);
    } catch(e) {
      _authErrors.add(e.message);
      return null;
    }
  }

  Future<bool> restorePassword({ String email }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } catch(e) {
      _authErrors.add(e.message);
      return false;
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
