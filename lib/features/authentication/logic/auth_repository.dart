import 'package:fintrack/features/authentication/data/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return AuthRepository(auth);
}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(Ref ref) {
  return FirebaseAuth.instance;
}

@Riverpod(keepAlive: true)
Stream<UserModel?> authStateChange(Ref ref) {
  final auth = ref.watch(authRepositoryProvider);
  return auth.authStateChanges();
}

class AuthRepository {
  AuthRepository(this._firebaseAuth);
  final FirebaseAuth _firebaseAuth;

  UserModel? get currentUser => _convertUser(_firebaseAuth.currentUser);

  // converts the nullable FirebaseUser to our UserModel
  UserModel? _convertUser(User? user) =>
      user == null ? null : UserModel.fromUser(user);

  Stream<UserModel?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map(_convertUser);
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
      throw Exception(e.message ?? 'An error occurred during sign up.');
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'invalid-email') {
        throw Exception('No user found for that email.');
      }
      if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
      if (e.code == 'invalid-credential') {
        throw Exception('credential is incorrect');
      }
      throw Exception(e.message ?? 'An error occurred during sign in.');
    }
  }

  final _googleSignIn = GoogleSignIn.instance;
  bool _isGoogleSignInInitialized = false;

  Future<void> _initializeGoogleSignIn() async {
    try {
      await _googleSignIn.initialize(
        serverClientId:
            '18177035239-fa2crfmvdiu4p5cv2ki9ud24ruvesvv3.apps.googleusercontent.com',
      );
      _isGoogleSignInInitialized = true;
    } catch (e) {
      print('Failed to initialize Google Sign-In: $e');
    }
  }

  Future<void> _ensureGoogleSignInInitialized() async {
    if (!_isGoogleSignInInitialized) {
      await _initializeGoogleSignIn();
    }
  }

  Future<User?> signInWithGoogle() async {
    await _ensureGoogleSignInInitialized();
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate(
        scopeHint: ['email'],
      );
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.idToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);
      print('Mina');
      return userCredential.user;
    } on GoogleSignInException catch (e) {
      throw Exception(e.code);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
