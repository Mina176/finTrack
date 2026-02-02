enum CategoryTypes {
  food,
  transport,
  entertainment,
  shopping,
  bills,
  salary,
  freelance,
  investment,
  others,
  housing,
  health,
  gifts,
}

class TransactionModel {
  final bool isExpense;
  final double amount;
  final CategoryTypes category;
  final DateTime date;
  final String? note;

  TransactionModel({
    required this.isExpense,
    required this.amount,
    required this.category,
    required this.date,
    this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'is_expense': isExpense, 
      'amount': amount,
      'category': category.name,
      'date': date.toIso8601String(),
      'note': note,
    };
  }

  // 2. Convert Map -> Object (For reading from Supabase)
  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      isExpense: map['is_expense'] as bool,
      amount: (map['amount'] as num).toDouble(), // Safe casting for int/double
      // Convert String back to Enum
      category: CategoryTypes.values.firstWhere(
        (e) => e.name == map['category'],
        orElse: () => CategoryTypes.others, // Fallback
      ),
      date: DateTime.parse(map['date']),
      note: map['note'] as String?,
    );
  }
}
