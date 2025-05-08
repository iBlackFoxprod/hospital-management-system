
mport 'package:firebase_auth/firebase_auth.dart';

class AuthUtil {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user
  static User? get currentUser => _auth.currentUser;

  // Get auth state stream
  static Stream<User?> authStateChanges() => _auth.authStateChanges();

  // Sign in with email & password
  static Future<String?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Register with email & password
  static Future<String?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Sign out
  static Future<void> signOut() async {
    await _auth.signOut();
  }

  // Get current user ID
  static String? getCurrentUserId() {
    return _auth.currentUser?.uid;
  }
}