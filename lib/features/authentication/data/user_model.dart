// user_model.dart
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? photoUrl;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.photoUrl,
  });
  static UserModel? fromUser(User? user) {
    if (user == null) return null;
    return UserModel(
      uid: user.uid,
      name: user.displayName?.isNotEmpty == true ? user.displayName! : 'User',
      email: user.email ?? '',
      photoUrl: user.photoURL,
    );
  }
}
