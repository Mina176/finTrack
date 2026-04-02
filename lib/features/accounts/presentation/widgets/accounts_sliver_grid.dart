import 'package:flutter/material.dart';
import 'package:fynt/core/enums/account_type.dart';
import 'package:fynt/features/accounts/presentation/widgets/account_type_card.dart';

class AccountsSliverGrid extends StatelessWidget {
  const AccountsSliverGrid({
    super.key,
    required this.onAccountTypeSelected,
    required this.selectedAccount,
  });
  final ValueChanged<AccountType> onAccountTypeSelected;
  final AccountType selectedAccount;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: AccountType.values.length,
      itemBuilder: (context, index) {
        final accountType = AccountType.values[index];
        return AccountTypeCard(
          isSelected: selectedAccount == accountType,
          icon: accountType.icon,
          label: accountType.localizedLabel(context),
          onTap: () => onAccountTypeSelected(accountType),
        );
      },
    );
  }
}
