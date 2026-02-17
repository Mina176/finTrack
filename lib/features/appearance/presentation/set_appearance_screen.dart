import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/appearance/logic/theme_controller.dart';
import 'package:fintrack/features/authentication/presentation/button_with_icon.dart';
import 'package:fintrack/features/home%20screen/presentation/custom_card.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetAppearanceScreen extends ConsumerStatefulWidget {
  const SetAppearanceScreen({super.key});

  @override
  ConsumerState<SetAppearanceScreen> createState() =>
      _SetAppearanceScreenState();
}

class _SetAppearanceScreenState extends ConsumerState<SetAppearanceScreen> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeControllerProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Appearance'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.kHorizontalPadding,
          vertical: Sizes.kVerticalPadding,
        ),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Theme',
              style: TextStyles.title,
            ),
            Text(
              'Customize the look of your money tracker Select a theme to preview how your dashboard and transactions appear.',
              style: TextStyles.hintText,
            ),
            Row(
              children: List.generate(
                2,
                (index) => SelectThemeItem(
                  isLightTheme: index == 0,
                  isSelected:
                      (currentTheme == ThemeMode.light && index == 0) ||
                      (currentTheme == ThemeMode.dark && index == 1),
                  onTap: () {
                    ref
                        .read(themeControllerProvider.notifier)
                        .setTheme(
                          index == 0 ? ThemeMode.light : ThemeMode.dark,
                        );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectThemeItem extends StatelessWidget {
  const SelectThemeItem({
    super.key,
    required this.isLightTheme,
    required this.isSelected,
    required this.onTap,
  });
  final bool isLightTheme;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: onTap,
          child: CustomCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: isLightTheme
                          ? Colors.white
                          : AppColors.kBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 6,
                            width: 36,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: isLightTheme
                                    ? Colors.grey[300]
                                    : Colors.grey[700],
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: isLightTheme
                                    ? Colors.grey[300]
                                    : Colors.grey[700],
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          Row(
                            spacing: 8,
                            children: List.generate(
                              2,
                              (index) => Expanded(
                                child: SizedBox(
                                  height: 80,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: isLightTheme
                                          ? Colors.grey[300]
                                          : Colors.grey[700],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            height: 22,
                            width: double.infinity,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: isLightTheme
                                    ? AppColors.kPrimaryColor.withOpacity(0.2)
                                    : AppColors.kPrimaryColor.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                gapH12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isLightTheme ? 'Light' : 'Dark',
                      style: TextStyles.title.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 22,
                      width: 22,
                      child: isSelected
                          ? Icon(
                              Icons.check_circle,
                              size: 22,
                              color: AppColors.kPrimaryColor,
                            )
                          : null,
                    ),
                  ],
                ),
                Text(
                  isLightTheme ? 'Clean and bright' : 'Easy on the eyes',
                  style: TextStyles.subtitle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
