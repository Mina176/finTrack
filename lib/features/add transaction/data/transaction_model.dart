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

enum AccountTypes {
  debitCard,
  creditCard,
  cashWallet,
  investment,
}

class TransactionModel {
  final bool isExpense;
  final double amount;
  final CategoryTypes category;
  final AccountTypes account;
  final DateTime date;
  final String? note;

  TransactionModel({
    required this.isExpense,
    required this.amount,
    required this.category,
    required this.account,
    required this.date,
    this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'is_expense': isExpense,
      'amount': amount,
      'category': category.name,
      'account_type': account.name,
      'date': date.toIso8601String(),
      'note': note,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      isExpense: map['is_expense'] as bool,
      amount: (map['amount'] as num).toDouble(),
      category: CategoryTypes.values.firstWhere(
        (e) => e.name == map['category'],
        orElse: () => CategoryTypes.others,
      ),
      account: AccountTypes.values.firstWhere(
        (e) => e.name == map['account_type'],
        orElse: () => AccountTypes.cashWallet,
      ),
      date: DateTime.parse(map['date']),
      note: map['note'] as String?,
    );
  }
}
