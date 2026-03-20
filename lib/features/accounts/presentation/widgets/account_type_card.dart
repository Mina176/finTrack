import 'package:flutter/material.dart';
import 'package:fynt/core/constants/app_sizes.dart';
import 'package:fynt/core/constants/text_styles.dart';
import 'package:fynt/core/widgets/custom_card.dart';

class AccountTypeCard extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const AccountTypeCard({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomCard(
        isSelected: isSelected,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28),
            gapH4,
            Text(
              label,
              style: TextStyles.subtitle.copyWith(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
