
import 'package:fintrack/constants/text_styles.dart';
import 'package:fintrack/features/authentication/presentation/profile_screen.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/widgets/custom_tile.dart';
import 'package:flutter/material.dart';

class AddDetailsSection extends StatelessWidget {
  const AddDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      backgroundColor: AppColors.kDefaultTileBackground,
      widgets: [
        CustomTile(
          onTap: () {},
          icon: Icons.category,
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
          icon: Icons.category,
          titleAndSubtitle: [
            const Text(
              "Category",
              style: TextStyles.addTransactionSettingstitle,
            ),
            Text(
              'Select Category',
              style: TextStyles.addTransactionSettingsSubtitle,
            ),
          ],
        ),
      ],
    );
  }
}