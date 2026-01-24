import 'package:fintrack/constants/app_sizes.dart';
import 'package:fintrack/features/authentication/logic/auth_controller.dart';
import 'package:fintrack/features/authentication/logic/auth_repository.dart';
import 'package:fintrack/features/authentication/logic/loading_state.dart';
import 'package:fintrack/features/authentication/presentation/auth_field.dart';
import 'package:fintrack/features/authentication/utils/validators.dart';
import 'package:fintrack/features/onboarding/presentation/onboarding_card.dart';
import 'package:fintrack/routing/app_route_enum.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/widgets/button_label_with_icon.dart';
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
  String? emailError;
  final _emailContoller = TextEditingController();
  void sendResetEmail() async {
    setState(() {
      emailError = null;
    });
    await ref
        .read(authControllerProvider.notifier)
        .sendPasswordResetEmail(_emailContoller.text);
    print('sent email');
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading;

    ref.listen(authControllerProvider, (previous, next) {
      if (next.state == LoadingStateEnum.success) {
        final currentUser = ref.read(authRepositoryProvider).currentUser;
        if (currentUser != null) {
          context.go(AppRoutes.home.path);
        }
        context.pop();
      } else {}
    });
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
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
              AuthField(
                label: 'Email Address',
                hintText: 'you@example.com',
                errorText: emailError,
                controller: _emailContoller,
                validator: Validators.validateEmail,
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
                    : (ButtonLabelWithIcon(
                        label: 'Send Reset Link',
                        icon: Icons.arrow_forward_rounded,
                      )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
