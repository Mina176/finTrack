import 'package:fintrack/constants/app_sizes.dart' show gapH8;
import 'package:fintrack/features/authentication/presentation/profile_screen.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/widgets/custom_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/text_styles.dart';

class AddNoteSection extends StatelessWidget {
  const AddNoteSection({
    super.key,
    required this.screenSize,
    required this.noteFocusNode,
    required this.controller,
  });

  final Size screenSize;
  final FocusNode noteFocusNode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      backgroundColor: AppColors.kDefaultTileBackground,
      widgets: [
        CustomTile(
          onTap: () {},
          iconData: FontAwesomeIcons.noteSticky,
          trailing: SizedBox(),
          titleAndSubtitle: [
            const Text(
              "Note",
              style: TextStyles.addTransactionSettingstitle,
            ),
            gapH8,
            SizedBox(
              width: screenSize.width * 0.6,
              child: TextField(
                controller: controller,
                focusNode: noteFocusNode,
                style: TextStyles.addTransactionSettingsSubtitle,
                decoration: const InputDecoration(
                  filled: false,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Add a note...',
                  hintStyle: TextStyles.addTransactionSettingsSubtitle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
