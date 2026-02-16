import 'package:currency_picker/currency_picker.dart';
import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/authentication/logic/auth_controller.dart';
import 'package:fintrack/features/authentication/presentation/button_with_icon.dart';
import 'package:fintrack/features/currency/logic/currency_provider.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:fintrack/widgets/custom_tile.dart';
import 'package:fintrack/widgets/settings_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCurrencyCode = ref.watch(currencyCodeProvider);
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
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.fingerprint,
                    size: 28,
                    color: AppColors.kPrimaryColor,
                  ),
                  title: Text(
                    'Change Password',
                    style: TextStyles.labelText,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 14),
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
                ListTile(
                  onTap: () => showCurrencyPicker(
                    theme: CurrencyPickerThemeData(
                      inputDecoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.kSubtitleColor,
                        ),
                        hintText: 'Search currency name or code',
                      ),
                      backgroundColor: AppColors.kBackgroundColor,
                      titleTextStyle: TextStyles.title.copyWith(fontSize: 18),
                      subtitleTextStyle: TextStyles.subtitle.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    context: context,
                    onSelect: (value) {
                      ref.read(currencyCodeProvider.notifier).state =
                          value.code;
                      ref.read(currencySymbolProvider.notifier).state =
                          value.symbol;
                    },
                  ),
                  leading: Icon(
                    Icons.attach_money,
                    color: AppColors.kPrimaryColor,
                  ),
                  title: Text(
                    'Currency',
                    style: TextStyles.labelText,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        currentCurrencyCode,
                        style: TextStyles.subtitle.copyWith(fontSize: 12),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_ios, size: 14),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.color_lens,
                    color: AppColors.kPrimaryColor,
                  ),
                  title: Text(
                    'Theme',
                    style: TextStyles.labelText,
                  ),
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
