import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:flutter/material.dart';

class CategoryStyle {
  final IconData icon;
  final Color color;
  final Color backgroundColor;

  CategoryStyle({
    required this.icon,
    required this.color,
    required this.backgroundColor,
  });
}

// SINGLE SOURCE OF TRUTH
CategoryStyle getCategoryStyle(CategoryTypes type) {
  switch (type) {
    // --- Spending ---
    case CategoryTypes.food:
      return CategoryStyle(
        icon: Icons.fastfood_outlined,
        color: const Color(0xFFFFA726),
        backgroundColor: const Color(0xFFFFF3E0),
      );
    case CategoryTypes.transport:
      return CategoryStyle(
        icon: Icons.directions_car_outlined,
        color: const Color(0xFF29B6F6),
        backgroundColor: const Color(0xFFE1F5FE),
      );
    case CategoryTypes.housing:
      return CategoryStyle(
        icon: Icons.home_outlined,
        color: const Color(0xFF66BB6A),
        backgroundColor: const Color(0xFFE8F5E9),
      );
    case CategoryTypes.health:
      return CategoryStyle(
        icon: Icons.health_and_safety_outlined,
        color: const Color(0xFFAB47BC),
        backgroundColor: const Color(0xFFF3E5F5),
      );
    case CategoryTypes.entertainment:
      return CategoryStyle(
        icon: Icons.movie_outlined,
        color: Colors.purple,
        backgroundColor: Colors.purple.shade100,
      );
    case CategoryTypes.shopping:
      return CategoryStyle(
        icon: Icons.shopping_bag_outlined,
        color: Colors.pink,
        backgroundColor: Colors.pink.shade100,
      );
    case CategoryTypes.bills:
      return CategoryStyle(
        icon: Icons.receipt_long_outlined,
        color: Colors.red,
        backgroundColor: Colors.red.shade100,
      );
    case CategoryTypes.freelance:
      return CategoryStyle(
        icon: Icons.work_outline,
        color: Colors.blue,
        backgroundColor: Colors.blue.shade100,
      );
    case CategoryTypes.investment:
      return CategoryStyle(
        icon: Icons.trending_up,
        color: Colors.green,
        backgroundColor: Colors.green.shade100,
      );

    // --- Income ---
    case CategoryTypes.salary:
      return CategoryStyle(
        icon: Icons.monetization_on_outlined,
        color: const Color(0xFF43A047),
        backgroundColor: const Color(0xFFE8F5E9),
      );
    case CategoryTypes.gifts:
      return CategoryStyle(
        icon: Icons.card_giftcard_outlined,
        color: const Color(0xFF8E24AA),
        backgroundColor: const Color(0xFFF3E5F5),
      );

    // --- Default ---
    default:
      return CategoryStyle(
        icon: Icons.more_horiz,
        color: Colors.grey,
        backgroundColor: Colors.grey.shade100,
      );
  }
}