import 'package:fintrack/features/authentication/data/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();

  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = credential.user;

      if (user != null) {
        UserModel newUser = UserModel(
          uid: user.uid,
          name: name,
          email: email,
        );

        await _dbRef.child("users/${user.uid}").set(newUser.toMap());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception(  
          'This email is already registered. Please login instead.',
        );
      } else if (e.code == 'weak-password') {
        throw Exception('Password is too weak.');
      } else if (e.code == 'invalid-email') {
        throw Exception('This email address is invalid.');
      } else {
        throw Exception(e.message ?? 'An error occurred.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
