import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/authentication/logic/auth_controller.dart';
import 'package:fintrack/features/authentication/presentation/button_with_icon.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:fintrack/widgets/custom_tile.dart';
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
              header: Text(
                'SECURITY',
                style: TextStyles.subtitle.copyWith(fontSize: 12),
                textAlign: TextAlign.left,
              ),
              backgroundColor: AppColors.kCustomContainerBackground,
              widgets: [
                CustomTile(
                  icon: Icons.lock,
                  titleAndSubtitle: [
                    Text(
                      'Change Password',
                      style: TextStyles.labelText,
                    ),
                  ],
                  trailing: Icon(Icons.arrow_forward_ios, size: 14),
                  onTap: () {},
                ),
              ],
            ),
            SettingsSection(
              header: Text(
                "APP PREFERENCES",
                style: TextStyles.subtitle.copyWith(fontSize: 12),
                textAlign: TextAlign.left,
              ),
              backgroundColor: AppColors.kCustomContainerBackground,
              widgets: [
                CustomTile(
                  icon: Icons.attach_money,
                  titleAndSubtitle: [
                    Text(
                      'Currency',
                      style: TextStyles.labelText,
                    ),
                  ],
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
                Divider(
                  height: 0.1,
                  color: AppColors.kDividerColor,
                ),
                CustomTile(
                  icon: Icons.color_lens,
                  titleAndSubtitle: [
                    Text(
                      'Theme',
                      style: TextStyles.labelText,
                    ),
                  ],
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

            Spacer(),
            ButtonWithIcon(
              onPressed: ref.read(authControllerProvider.notifier).signOut,
              label: 'Log Out',
              borderColor: AppColors.knotSavingForeground,
              foregroundColor: AppColors.knotSavingForeground,
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
    required this.widgets,
    required this.backgroundColor,
    this.header,
  });
  final Widget? header;
  final Color backgroundColor;
  final List<Widget> widgets;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        header ?? SizedBox.shrink(),
        DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.kAddTransactionDividerColor,
              width: 1,
            ),
          ),
          child: widgets.length == 1
              ? widgets.first
              : Column(
                  children: [
                    ...widgets
                        .expand(
                          (widget) => [
                            widget,
                            Divider(
                              height: 0.1,
                              color: AppColors.kAddTransactionDividerColor,
                            ),
                          ],
                        )
                        .toList()
                      ..removeLast(),
                  ],
                ),
        ),
      ],
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
