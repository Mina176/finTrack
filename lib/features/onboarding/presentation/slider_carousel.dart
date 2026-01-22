import 'package:fintrack/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SliderIndex extends StatelessWidget {
  const SliderIndex({
    super.key,
    required this.currentPage,
  });

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Container(
          margin: EdgeInsets.all(6),
          width: currentPage == index ? 32 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentPage == index ? kPrimaryColor : Color(0xFF21452D),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
