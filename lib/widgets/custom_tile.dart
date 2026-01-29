import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.onTap,
    required this.icon,
    this.trailing,
    required this.titleAndSubtitle,
  });
  final VoidCallback onTap;
  final Widget? trailing;
  final IconData icon;
  final List<Widget> titleAndSubtitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Row(
          children: [
            CustomIcon(icon: icon),
            gapW12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: titleAndSubtitle,
            ),
            Spacer(),
            trailing ??
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: AppColors.kSubtitleColor,
                ),
          ],
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
