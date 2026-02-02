import 'package:fintrack/routing/app_router.dart';
import 'package:fintrack/theming/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://dzztxtttepayqevwdhvg.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR6enR4dHR0ZXBheXFldndkaHZnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzAwNDI0NDgsImV4cCI6MjA4NTYxODQ0OH0.qNUoVCxiiAkvnWzna-tUIQZGJPDfHRlldNqSTOv_2BQ',
  );
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
