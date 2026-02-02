import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/widgets/category_icon.dart';
import 'package:flutter/material.dart';

List<CategoryIcon> spendingCategoriesList = [
  CategoryIcon(
    iconData: Icons.fastfood_outlined,
    iconColor: const Color(0xFFFFA726),
    backgoroundColor: const Color(0xFFFFF3E0),
    categoryType: CategoryTypes.food,
    hasLabel: true,
  ),
  CategoryIcon(
    iconData: Icons.directions_car_outlined,
    iconColor: const Color(0xFF29B6F6),
    backgoroundColor: const Color(0xFFE1F5FE),
    categoryType: CategoryTypes.transport,
    hasLabel: true,
  ),
  CategoryIcon(
    iconData: Icons.home_outlined,
    iconColor: const Color(0xFF66BB6A),
    backgoroundColor: const Color(0xFFE8F5E9),
    categoryType: CategoryTypes.housing,
    hasLabel: true,
  ),
  CategoryIcon(
    iconData: Icons.health_and_safety_outlined,
    iconColor: const Color(0xFFAB47BC),
    backgoroundColor: const Color(0xFFF3E5F5),
    categoryType: CategoryTypes.health,
    hasLabel: true,
  ),
  CategoryIcon(
    iconData: Icons.home_outlined,
    iconColor: const Color(0xFF66BB6A),
    backgoroundColor: const Color(0xFFE8F5E9),
    categoryType: CategoryTypes.housing,
    hasLabel: true,
  ),
  CategoryIcon(
    iconData: Icons.health_and_safety_outlined,
    iconColor: const Color(0xFFAB47BC),
    backgoroundColor: const Color(0xFFF3E5F5),
    categoryType: CategoryTypes.health,
    hasLabel: true,
  ),
];

List<CategoryIcon> incomeCategoriesList = [
  CategoryIcon(
    iconData: Icons.monetization_on_outlined,
    iconColor: const Color(0xFF43A047),
    backgoroundColor: const Color(0xFFE8F5E9),
    categoryType: CategoryTypes.salary,
    hasLabel: true,
  ),
  CategoryIcon(
    iconData: Icons.card_giftcard_outlined,
    iconColor: const Color(0xFF8E24AA),
    backgoroundColor: const Color(0xFFF3E5F5),
    categoryType: CategoryTypes.gifts,
    hasLabel: true,
  ),
];
