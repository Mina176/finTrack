import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:flutter/material.dart';

class IconStyle {
  final IconData icon;
  final Color color;
  final Color backgroundColor;

  IconStyle({
    required this.icon,
    required this.color,
    required this.backgroundColor,
  });
}

// SINGLE SOURCE OF TRUTH
IconStyle getCategoryStyle(CategoryTypes type) {
  switch (type) {
    // --- Spending ---
    case CategoryTypes.food:
      return IconStyle(
        icon: Icons.restaurant_rounded,
        color: const Color(0xFFFB923C),
        backgroundColor: const Color(0xFF321704),
      );
    case CategoryTypes.transport:
      return IconStyle(
        icon: Icons.directions_car_rounded,
        color: const Color(0xFFC084FC),
        backgroundColor: const Color(0xFF221131),
      );
    case CategoryTypes.housing:
      return IconStyle(
        icon: Icons.home_rounded,
        color: const Color(0xFFFACC15),
        backgroundColor: const Color(0xFF2F2402),
      );
    case CategoryTypes.health:
      return IconStyle(
        icon: Icons.health_and_safety_rounded,
        color: const Color(0xFF4ADE80),
        backgroundColor: const Color(0xFF072713),
      );
    case CategoryTypes.entertainment:
      return IconStyle(
        icon: Icons.movie_rounded,
        color: Color(0xFFF472B6),
        backgroundColor: Color(0xFF2F0E1F),
      );
    case CategoryTypes.shopping:
      return IconStyle(
        icon: Icons.shopping_bag_rounded,
        color: Color(0xFF60A5FA),
        backgroundColor: Color(0xFF0C1930),
      );
    case CategoryTypes.bills:
      return IconStyle(
        icon: Icons.receipt_long_rounded,
        color: Color(0xFF22D3EE),
        backgroundColor: Color(0xFF01242A),
      );
    case CategoryTypes.freelance:
      return IconStyle(
        icon: Icons.work_rounded,
        color: Color(0xFF818CF8),
        backgroundColor: Color(0xFF141430),
      );
    case CategoryTypes.investment:
      return IconStyle(
        icon: Icons.trending_up_rounded,
        color: Color(0xFFFB7185),
        backgroundColor: Color(0xFF310D13),
      );

    case CategoryTypes.salary:
      return IconStyle(
        icon: Icons.monetization_on_rounded,
        color: const Color(0xFF34D399),
        backgroundColor: const Color(0xFF03251A),
      );
    case CategoryTypes.gifts:
      return IconStyle(
        icon: Icons.card_giftcard_rounded,
        color: const Color(0xFF2DD4BF),
        backgroundColor: const Color(0xFF042521),
      );
    default:
      return IconStyle(
        icon: Icons.more_horiz_rounded,
        color: Colors.grey,
        backgroundColor: Colors.grey.shade100,
      );
  }
}

IconStyle getAccountStyle(AccountTypes type) {
  switch (type) {
    case AccountTypes.debitCard:
      return IconStyle(
        icon: Icons.credit_card_rounded,
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.shade100,
      );
    case AccountTypes.creditCard:
      return IconStyle(
        icon: Icons.credit_card_rounded,
        color: Colors.orange,
        backgroundColor: Colors.orange.shade100,
      );
    case AccountTypes.cashWallet:
      return IconStyle(
        icon: Icons.wallet_rounded,
        color: Colors.brown,
        backgroundColor: Colors.brown.shade100,
      );
    case AccountTypes.investment:
      return IconStyle(
        icon: Icons.trending_up_rounded,
        color: Colors.green,
        backgroundColor: Colors.green.shade100,
      );
  }
}
