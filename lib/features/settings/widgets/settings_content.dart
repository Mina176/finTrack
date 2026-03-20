import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fynt/core/constants/text_styles.dart';
import 'package:fynt/core/routing/app_route_enum.dart';
import 'package:fynt/core/theming/app_colors.dart';
import 'package:fynt/core/widgets/settings_section.dart';
import 'package:fynt/features/settings/appearance/logic/theme_controller.dart';
import 'package:fynt/features/settings/currency/currency_provider.dart';
import 'package:go_router/go_router.dart';

class SettingsContent extends ConsumerWidget {
  const SettingsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCurrencyCode = ref.watch(currencyCodeProvider);
    return SettingsSection(
      header: Text(
        "APP PREFERENCES",
        style: TextStyles.subtitle.copyWith(fontSize: 12),
        textAlign: TextAlign.left,
      ),
      widgets: [
        ListTile(
          onTap: () => showCurrencyPicker(
            showFlag: false,
            theme: CurrencyPickerThemeData(
              inputDecoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.kSubtitleColor,
                ),
                hintText: 'Search currency name or code',
              ),
              backgroundColor: Theme.of(
                context,
              ).scaffoldBackgroundColor,
              titleTextStyle: TextStyles.title.copyWith(fontSize: 18),
              subtitleTextStyle: TextStyles.subtitle.copyWith(
                fontSize: 14,
              ),
            ),
            context: context,
            onSelect: (value) {
              ref
                  .read(currencyCodeProvider.notifier)
                  .setCurrencyCode(value.code);
              ref
                  .read(currencySymbolProvider.notifier)
                  .setCurrencySymbol(value.symbol);
            },
          ),
          leading: const Icon(
            Icons.attach_money,
            color: AppColors.kPrimaryColor,
          ),
          title: const Text(
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
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward_ios, size: 14),
            ],
          ),
        ),
        ListTile(
          onTap: () => context.push(AppRoutes.setAppearance.path),
          leading: const Icon(
            Icons.color_lens,
            color: AppColors.kPrimaryColor,
          ),
          title: const Text(
            'Theme',
            style: TextStyles.labelText,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ref.watch(themeControllerProvider) == ThemeMode.light
                    ? 'Light'
                    : 'Dark',
                style: TextStyles.subtitle.copyWith(fontSize: 12),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward_ios, size: 14),
            ],
          ),
        ),
      ],
    );
  }
}
