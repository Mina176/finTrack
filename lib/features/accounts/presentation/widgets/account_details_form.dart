import 'package:fynt/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:fynt/features/authentication/presentation/auth_field.dart';

class AccountDetailsForm extends StatelessWidget {
  const AccountDetailsForm({
    super.key,
    required this.formKey,
    required this.accountNameController,
    required this.balanceController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController accountNameController;
  final TextEditingController balanceController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 10,
        children: [
          TextFieldWithLabel(
            label: context.l10n.accountName,
            hintText: context.l10n.accountNameHintPersonal,
            controller: accountNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.l10n.errorAccountNameRequired;
              }
              return null;
            },
          ),
          TextFieldWithLabel(
            label: context.l10n.accountBalance,
            hintText: '0.0',
            controller: balanceController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.l10n.errorAccountBalanceRequired;
              }
              if (double.tryParse(value) == null) {
                return context.l10n.errorValidNumber;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
