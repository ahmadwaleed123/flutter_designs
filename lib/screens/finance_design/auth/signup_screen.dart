import 'package:flutter/material.dart';

import '../../../common_widgets/app_text_field.dart';
import '../../../common_widgets/round_action_button.dart';
import '../../../constants/theme_constants.dart';
import '../../../utils/routes.dart';

class FinanceSignupScreen extends StatefulWidget {
  const FinanceSignupScreen({super.key});

  @override
  State<FinanceSignupScreen> createState() => _FinanceSignupScreenState();
}

class _FinanceSignupScreenState extends State<FinanceSignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = false;

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
              Text('Create account', style: AppTextStyle.poppinsW700(26)),
              AppSpacing.verticalXSpacing(space: 8),
              Text(
                'Start your journey to smarter money habits.',
                style: AppTextStyle.interW400(
                  14,
                  fontColor: AppColors.secondaryBlack,
                ),
              ),
              AppSpacing.verticalXSpacing(space: 28),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(
                        label: 'Full name',
                        hintText: 'Alex Morgan',
                        controller: nameController,
                        prefixIcon: const Icon(
                          Icons.person_outline_rounded,
                          color: AppColors.tertiaryBlack,
                        ),
                      ),
                      AppSpacing.verticalXSpacing(space: 16),
                      AppTextField(
                        label: 'Email',
                        hintText: 'you@example.com',
                        controller: emailController,
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
                      AppSpacing.verticalXSpacing(space: 24),
                      RoundActionButton(
                        text: 'Create Account',
                        action:
                            () => Navigator.pushNamed(context, Routes.financeHome),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
