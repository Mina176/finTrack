// Helper method to get account icon based on account type
import 'package:fintrack/features/add%20transaction/data/transaction_model.dart';
import 'package:fintrack/widgets/category_icon.dart';

AccountIcon getAccountIcon(AccountTypes accountType) {
  switch (accountType) {
    case AccountTypes.debitCard:
      return AccountIcon(accountTypes: AccountTypes.debitCard);
    case AccountTypes.creditCard:
      return AccountIcon(accountTypes: AccountTypes.creditCard);
    case AccountTypes.investment:
      return AccountIcon(accountTypes: AccountTypes.investment);
    case AccountTypes.cashWallet:
      return AccountIcon(accountTypes: AccountTypes.cashWallet);
  }
}

// Helper method to get account name based on account type
String getAccountName(AccountTypes accountType) {
  switch (accountType) {
    case AccountTypes.debitCard:
      return "Debit Card";
    case AccountTypes.creditCard:
      return "Credit Card";
    case AccountTypes.investment:
      return "Investment";
    case AccountTypes.cashWallet:
      return "Cash Wallet";
  }
}

String getCategoryName(CategoryTypes categoryType) {
  switch (categoryType) {
    case CategoryTypes.food:
      return "Food & Dining";
    case CategoryTypes.entertainment:
      return "Entertainment";
    case CategoryTypes.shopping:
      return "Shopping";
    case CategoryTypes.health:
      return "Health & Fitness";
    case CategoryTypes.gifts:
      return "Gifts & Donations";
    case CategoryTypes.transport:
      return "Transport";
    case CategoryTypes.housing:
      return "Housing";
    case CategoryTypes.bills:
      return "Bills & Utilities";
    case CategoryTypes.salary:
      return "Salary";
    case CategoryTypes.freelance:
      return "Freelance";
    case CategoryTypes.investment:
      return "Investment";
    case CategoryTypes.others:
      return "Others";
  }
}
