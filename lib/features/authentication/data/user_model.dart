import 'package:supabase_flutter/supabase_flutter.dart';

class UserModel {
  final String userId;
  final String name;
  final String email;
  final String? avatarUrl;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    this.avatarUrl,
  });
  static UserModel? fromUser(User? user) {
    if (user == null) return null;
    final metadata = user.userMetadata ?? {};
    final displayName = metadata['full_name'] ?? metadata['name'] ?? 'User';
    final avatarUrl = metadata['avatar_url'] ?? metadata['picture'];
    return UserModel(
      userId: user.id,
      name: displayName.isNotEmpty ? displayName : 'User',
      email: user.email ?? '',
      avatarUrl: avatarUrl,
    );
  }
}
