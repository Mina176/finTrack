import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/authentication/presentation/profile_screen.dart';
import 'package:fintrack/routing/app_route_enum.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddDetailsSection extends StatelessWidget {
  const AddDetailsSection({
    super.key,
    required this.categoryOnTap,
  });
  final VoidCallback categoryOnTap;
  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      backgroundColor: AppColors.kDefaultTileBackground,
      widgets: [
        CustomTile(
          onTap: categoryOnTap,
          icon: Icons.fastfood_outlined,
          titleAndSubtitle: [
            Text(
              "Category",
              style: TextStyles.addTransactionSettingstitle,
            ),
            Text(
              'Select Category',
              style: TextStyles.addTransactionSettingsSubtitle,
            ),
          ],
        ),
        CustomTile(
          onTap: () {},
          icon: Icons.date_range,
          titleAndSubtitle: [
            const Text(
              "Date",
              style: TextStyles.addTransactionSettingstitle,
            ),
            Text(
              '23 Feb 2026',
              style: TextStyles.addTransactionSettingsSubtitle,
            ),
          ],
        ),
      ],
    );
  }
}
