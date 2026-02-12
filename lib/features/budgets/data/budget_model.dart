import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';

enum RecurrenceDuration { weekly, monthly, yearly }

class BudgetModel {
  final double limit;
  final double spent;
  final String budgetName;
  final CategoryTypes category;
  final RecurrenceDuration recurrenceDuration;

  BudgetModel({
    required this.limit,
    required this.spent,
    required this.budgetName,
    required this.category,
    required this.recurrenceDuration,
  });

  Map<String, dynamic> toMap() {
    return {
      'limit': limit,
      'budget_name': budgetName,
      'category': category.name,
      'recurrence_duration': recurrenceDuration.name,
      'spent': spent,
    };
  }

  factory BudgetModel.fromMap(Map<String, dynamic> map) {
    return BudgetModel(
      limit: (map['limit'] as num).toDouble(),
      spent: (map['spent'] as num).toDouble(),
      budgetName: map['budget_name'] as String,
      category: CategoryTypes.values.firstWhere(
        (e) => e.name == map['category'],
        orElse: () => CategoryTypes.others,
      ),
      recurrenceDuration: RecurrenceDuration.values.firstWhere(
        (e) => e.name == map['recurrence_duration'],
        orElse: () => RecurrenceDuration.monthly,
      ),
    );
  }
}
