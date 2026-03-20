import 'package:flutter/material.dart';
import 'package:fynt/core/constants/text_styles.dart';

class EmptyListSLiverFillRemaining extends StatelessWidget {
  const EmptyListSLiverFillRemaining({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyles.hintText.copyWith(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
