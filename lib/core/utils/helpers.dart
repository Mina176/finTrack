import 'package:fynt/features/transactions/data/transaction_model.dart';
import 'package:fynt/features/authentication/logic/auth_service.dart';
import 'package:fynt/core/widgets/category_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

AccountIcon getAccountIcon(AccountType accountType) {
  switch (accountType) {
    case AccountType.debitCard:
      return const AccountIcon(accountTypes: AccountType.debitCard);
    case AccountType.creditCard:
      return const AccountIcon(accountTypes: AccountType.creditCard);
    case AccountType.investment:
      return const AccountIcon(accountTypes: AccountType.investment);
    case AccountType.cashWallet:
      return const AccountIcon(accountTypes: AccountType.cashWallet);
  }
}

String getAccountName(AccountType accountType) {
  switch (accountType) {
    case AccountType.debitCard:
      return "Debit Card";
    case AccountType.creditCard:
      return "Credit Card";
    case AccountType.investment:
      return "Investment";
    case AccountType.cashWallet:
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

String getInfoText(int selectedRecurrenceIndex) {
  if (selectedRecurrenceIndex == 0) {
    return 'The budget will reset automatically on Monday of every week.';
  } else if (selectedRecurrenceIndex == 1) {
    return 'The budget will reset automatically on 1st of every month';
  } else {
    return 'The budget will reset automatically on 1st Jan of every year.';
  }
}

String getUsernameWithId(WidgetRef ref) {
  final currentUser = ref.watch(authServiceProvider).currentUser;
  final String guestId = currentUser?.userId != null
      ? currentUser!.userId.substring(0, 5)
      : '76186';
  final String fullName = currentUser?.fullName ?? 'Guest';
  if (fullName.isNotEmpty) return fullName;
  return '$fullName#$guestId';
}
