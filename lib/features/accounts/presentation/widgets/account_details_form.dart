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
            label: 'ACCOUNT NAME',
            hintText: 'e.g. My Savings',
            controller: accountNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Account name is required';
              }
              return null;
            },
          ),
          TextFieldWithLabel(
            label: 'ACCOUNT BALANCE',
            hintText: '0.0',
            controller: balanceController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Account Balance is required';
              }
              if (double.tryParse(value) == null) {
                return 'Please enter a valid number';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
