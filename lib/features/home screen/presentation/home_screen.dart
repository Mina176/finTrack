import 'package:fintrack/features/authentication/logic/auth_controller.dart';
import 'package:fintrack/routing/app_route_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => ref.read(authControllerProvider.notifier).signOut(),
          child: Text('Log out'),
        ),
      ),
    );
  }
}
