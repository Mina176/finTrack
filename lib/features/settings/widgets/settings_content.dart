import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fynt/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:fynt/core/constants/text_styles.dart';
import 'package:fynt/core/theming/app_colors.dart';
import 'package:fynt/core/widgets/settings_section.dart';
import 'package:fynt/features/settings/language/logic/language_controller.dart';
import 'package:fynt/features/settings/widgets/currency_list_tile.dart';
import 'package:fynt/features/settings/widgets/theme_list_tile.dart';
import 'package:go_router/go_router.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      header: Text(
        context.l10n.appPreferences,
        style: TextStyles.subtitle.copyWith(fontSize: 12),
      ),
      widgets: const [
        CurrencyListTile(),
        ThemeListTile(),
        LanguageSelectorListTile(),
      ],
    );
  }
}

class LanguageSelectorListTile extends ConsumerWidget {
  const LanguageSelectorListTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ListTile(
                    title: const Text('English'),
                    onTap: () {
                      ref
                          .read(languageControllerProvider.notifier)
                          .setLanguage(const Locale('en'));
                      context.pop;
                    },
                  ),
                  ListTile(
                    title: const Text('العربية'),
                    onTap: () {
                      ref
                          .read(languageControllerProvider.notifier)
                          .setLanguage(const Locale('ar'));
                      context.pop;
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      leading: const Icon(
        Icons.language,
        color: AppColors.kPrimaryColor,
      ),
      title: Text(
        context.l10n.language,
        style: TextStyles.labelText,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            ref.watch(languageControllerProvider) == const Locale('en')
                ? 'English'
                : 'العربية',
            style: TextStyles.subtitle.copyWith(fontSize: 12),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, size: 14),
        ],
      ),
    );
  }
}
