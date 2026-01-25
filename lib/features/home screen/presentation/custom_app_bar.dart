import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/authentication/logic/auth_controller.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => ref.read(authControllerProvider.notifier).signOut(),
          child: CircleAvatar(
            radius: 24,
            child: ClipOval(
              child: Image.asset(
                'assets/9440461.jpg',
              ),
            ),
          ),
        ),
        gapW8,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'WELCOME BACK',
              style: TextStyles.subtitle.copyWith(fontSize: 14),
            ),
            Text(
              'Alex Morgan'.hardcoded,
              style: TextStyles.title.copyWith(fontSize: 18),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
          ),
        ),
      ],
    );
  }
}
