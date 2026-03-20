import 'package:flutter/material.dart';
import 'package:fynt/core/routing/app_route_enum.dart';
import 'package:fynt/core/theming/app_colors.dart';
import 'package:go_router/go_router.dart';

class AppBarAction extends StatelessWidget {
  const AppBarAction({
    super.key,
    required this.appRoute,
  });
  final AppRoutes appRoute;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(appRoute.path),
      child: const DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
