import 'dart:ffi';

import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/authentication/logic/auth_controller.dart';
import 'package:fintrack/features/authentication/presentation/button_with_icon.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_app_bar.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyles.title.copyWith(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 12,
          children: [
            DetailsSection(),
            gapH12,
            SettingsSection(
              header: 'SECURITY',
              widget: Column(
                children: [
                  SettingsTile(
                    icon: Icons.lock,
                    label: 'Change Password',
                    trailing: Icon(Icons.arrow_forward_ios, size: 14),
                    onTap: () {},
                  ),
                  Divider(
                    height: 0.1,
                    color: AppColors.kDividerColor,
                  ),
                ],
              ),
            ),
            SettingsSection(
              header: "APP PREFERENCES",
              widget: Column(
                children: [
                  SettingsTile(
                    icon: Icons.attach_money,
                    label: 'Currency',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'USD'.hardcoded,
                          style: TextStyles.subtitle.copyWith(fontSize: 12),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward_ios, size: 14),
                      ],
                    ),
                    onTap: () {},
                  ),
                  SettingsTile(
                    icon: Icons.color_lens,
                    label: 'Theme',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Dark'.hardcoded,
                          style: TextStyles.subtitle.copyWith(fontSize: 12),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward_ios, size: 14),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Spacer(),
            ButtonWithIcon(
              onPressed: ref.read(authControllerProvider.notifier).signOut,
              label: 'Log Out',
              borderColor: AppColors.knotSavingForeground,
              textColor: AppColors.knotSavingForeground,
              icon: Icon(Icons.logout, color: AppColors.knotSavingForeground),
            ),
            gapW16,
          ],
        ),
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.widget,
    required this.header,
  });
  final Widget widget;
  final String header;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          header,
          style: TextStyles.subtitle.copyWith(fontSize: 12),
          textAlign: TextAlign.left,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.kCustomContainerBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.kDividerColor,
              width: 1,
            ),
          ),
          child: widget,
        ),
      ],
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.label,
    required this.trailing,
    required this.onTap,
  });
  final String label;
  final Widget trailing;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.kBarGraphNotHighest,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  icon,
                  color: AppColors.kPrimaryColor,
                  size: 22,
                ),
              ),
            ),
            gapW8,
            Text(
              label,
              style: TextStyles.header.copyWith(fontSize: 14),
            ),
            Spacer(),
            trailing,
          ],
        ),
      ),
    );
  }
}

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Alex Morgan'.hardcoded,
          textAlign: TextAlign.center,
          style: TextStyles.title.copyWith(fontSize: 28),
        ),
        Text(
          'alex.j@example.com'.hardcoded,
          textAlign: TextAlign.center,
          style: TextStyles.subtitle.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}
