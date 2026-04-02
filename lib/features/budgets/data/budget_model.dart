import 'package:fynt/core/enums/category_type.dart';
import 'package:fynt/core/enums/recurrence_type.dart';

class BudgetModel {
  final int id;
  final String userId;
  final double limit;
  final double spent;
  final String budgetName;
  final CategoryType category;
  final RecurrenceDuration recurrenceDuration;

  BudgetModel({
    required this.id,
    required this.limit,
    required this.spent,
    required this.budgetName,
    required this.category,
    required this.recurrenceDuration,
    required this.userId,
  });

  BudgetModel copyWith({
    int? id,
    String? userId,
    double? limit,
    double? spent,
    String? budgetName,
    CategoryType? category,
    RecurrenceDuration? recurrenceDuration,
  }) {
    return BudgetModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      limit: limit ?? this.limit,
      spent: spent ?? this.spent,
      budgetName: budgetName ?? this.budgetName,
      category: category ?? this.category,
      recurrenceDuration: recurrenceDuration ?? this.recurrenceDuration,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'limit': limit,
      'budget_name': budgetName,
      'category': category.name,
      'recurrence_duration': recurrenceDuration.name,
      'spent': spent,
    };
  }

  factory BudgetModel.fromJson(Map<String, dynamic> map) {
    return BudgetModel(
      id: map['id'] as int,
      userId: (map['user_id'] ?? "") as String,
      budgetName: (map['budget_name'] ?? '') as String,
      limit: (map['limit'] ?? 0.0).toDouble(),
      spent: (map['spent'] ?? 0.0).toDouble(),
      category: CategoryType.values.firstWhere(
        (e) => e.name == (map['category'] ?? ""),
        orElse: () => CategoryType.others,
      ),
      recurrenceDuration: RecurrenceDuration.values.firstWhere(
        (e) => e.name == (map['recurrence_duration'] ?? ""),
        orElse: () => RecurrenceDuration.monthly,
      ),
    );
  }
}
