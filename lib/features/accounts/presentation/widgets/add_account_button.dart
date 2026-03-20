import 'package:flutter/material.dart';
import 'package:fynt/core/constants/app_sizes.dart';

class AddAccountButton extends StatelessWidget {
  const AddAccountButton({
    super.key,
    required this.isLoading,
    required this.addAccount,
  });
  final bool isLoading;
  final VoidCallback addAccount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Sizes.kVerticalPadding,
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : addAccount,
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(),
              )
            : const Text(
                'Add Account',
              ),
      ),
    );
  }
}
