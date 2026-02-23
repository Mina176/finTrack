import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/features/authentication/logic/auth_controller.dart';
import 'package:fintrack/features/authentication/logic/loading_state.dart';
import 'package:fintrack/features/authentication/presentation/auth_field.dart';
import 'package:fintrack/utils/validators.dart';
import 'package:fintrack/features/onboarding/presentation/onboarding_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  String? emailError;
  final _emailContoller = TextEditingController();
  void sendResetEmail() async {
    setState(() {
      emailError = null;
    });
    if (_formKey.currentState?.validate() ?? false) {
      await ref
          .read(authControllerProvider.notifier)
          .sendPasswordResetEmail(_emailContoller.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading;

    ref.listen(authControllerProvider, (previous, next) {
      if (next.state == LoadingStateEnum.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'If an account exists, a reset link has been sent.',
            ),
          ),
        );
        context.pop();
      } else if (next.hasError) {
        final error = next.error.toString();
        final validationError = Validators.getResetError(error);
        if (validationError != null) {
          setState(() => emailError = validationError);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString().replaceAll('Exception: ', '')),
          ),
        );
      }
    });
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.kVerticalPadding,
            horizontal: Sizes.kHorizontalPadding,
          ),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              OnboardingCard(
                icon: Icons.lock_reset_sharp,
                borderRadius: 50,
                width: 100,
                height: 100,
                title: 'Forgot Password?',
                subTitle:
                    'Don\'t worry, it happens. Please enter the email address associated with your account.',
              ),
              Form(
                key: _formKey,
                child: TextFieldWithLabel(
                  label: 'Email Address',
                  hintText: 'you@example.com',
                  errorText: emailError,
                  controller: _emailContoller,
                  validator: Validators.validateEmail,
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: isLoading ? null : sendResetEmail,
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Row(
                        children: [
                          Text('Send Reset Link'),
                          Icon(Icons.arrow_forward_rounded),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
