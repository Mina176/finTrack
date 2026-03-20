import 'package:fynt/core/constants/app_sizes.dart';
import 'package:fynt/core/constants/text_styles.dart';
import 'package:fynt/features/authentication/logic/auth_controller.dart';
import 'package:fynt/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fynt/features/settings/widgets/settings_content.dart';
import 'package:fynt/features/settings/widgets/user_info_section.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyles.title.copyWith(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.kVerticalPadding,
          horizontal: Sizes.kHorizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 12,
          children: [
            const UserInfoSection(),
            gapH12,
            const SettingsContent(),
            const Spacer(),
            Consumer(
              builder: (context, ref, child) {
                return ElevatedButton.icon(
                  onPressed: () =>
                      ref.read(authControllerProvider.notifier).signOut(),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.kErrorColor,
                  ),
                  label: const Text('Log Out'),
                  icon: const Icon(
                    Icons.logout,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
