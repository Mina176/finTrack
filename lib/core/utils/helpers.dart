import 'package:fynt/features/authentication/logic/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String getUsernameWithId(WidgetRef ref) {
  final currentUser = ref.watch(authServiceProvider).currentUser;
  final String guestId = currentUser?.userId != null
      ? currentUser!.userId.substring(0, 5)
      : '76186';
  final String fullName = currentUser?.fullName ?? 'Guest';
  if (fullName.isNotEmpty) return fullName;
  return '$fullName#$guestId';
}
