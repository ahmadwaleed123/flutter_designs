import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/app_text_field.dart';
import '../../../common_widgets/round_action_button.dart';
import '../../../constants/theme_constants.dart';
import '../../../providers/providers.dart';
import '../../../utils/general_methods.dart';
import '../../../utils/routes.dart';

class FinanceLoginScreen extends StatefulWidget {
  const FinanceLoginScreen({super.key});

  @override
  State<FinanceLoginScreen> createState() => _FinanceLoginScreenState();
}

class _FinanceLoginScreenState extends State<FinanceLoginScreen> {
  final emailController = TextEditingController(text: 'alex.morgan@finly.app');
  final passwordController = TextEditingController(text: 'password123');

  bool showPassword = false;
  String emailError = '', passwordError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: AppSpacing.pageSpacingSmall,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back', style: AppTextStyle.poppinsW700(28)),
              AppSpacing.verticalXSpacing(space: 8),
              Text(
                'Log in to continue managing your money.',
                style: AppTextStyle.interW400(
                  14,
                  fontColor: AppColors.secondaryBlack,
                ),
              ),
              AppSpacing.verticalXSpacing(space: 32),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(
                        label: 'Email',
                        hintText: 'you@example.com',
                        controller: emailController,
                        errorText: emailError,
                        inputType: TextInputType.emailAddress,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: AppColors.tertiaryBlack,
                        ),
                      ),
                      AppSpacing.verticalXSpacing(space: 16),
                      AppTextField(
                        label: 'Password',
                        hintText: '••••••••',
                        controller: passwordController,
                        errorText: passwordError,
                        obscureText: !showPassword,
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: AppColors.tertiaryBlack,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () => setState(() => showPassword = !showPassword),
                          child: Icon(
                            showPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.tertiaryBlack,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot password?',
                            style: AppTextStyle.interW600(
                              13,
                              fontColor: AppColors.primaryBrand,
                            ),
                          ),
                        ),
                      ),
                      AppSpacing.verticalXSpacing(space: 12),
                      Consumer<FinanceUserProvider>(
                        builder:
                            (context, provider, _) => RoundActionButton(
                              text: 'Log In',
                              isLoading: provider.isLoading,
                              action: () => _login(context, provider),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppTextStyle.interW400(
                      13,
                      fontColor: AppColors.secondaryBlack,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(context, Routes.financeSignup),
                    child: Text(
                      'Sign up',
                      style: AppTextStyle.interW600(
                        13,
                        fontColor: AppColors.primaryBrand,
                      ),
                    ),
                  ),
                ],
              ),
              AppSpacing.vertical20pxSpacing,
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context, FinanceUserProvider provider) {
    FocusScope.of(context).unfocus();
    setState(() {
      emailError =
          GeneralMethods.emailValid(emailController.text.trim())
              ? ''
              : 'Enter a valid email address';
      passwordError =
          passwordController.text.trim().length < 6
              ? 'Password must be at least 6 characters'
              : '';
    });
    if (emailError.isNotEmpty || passwordError.isNotEmpty) return;
    provider.login(
      emailController.text.trim(),
      onSuccess: () {
        Navigator.pushReplacementNamed(context, Routes.financeHome);
      },
    );
  }
}