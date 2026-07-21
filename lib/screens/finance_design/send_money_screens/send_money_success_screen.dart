import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/round_action_button.dart';
import '../../../constants/theme_constants.dart';
import '../../../utils/extensions.dart';
import '../../../utils/routes.dart';

class FinanceSendMoneySuccessScreen extends StatelessWidget {
  final String recipient;
  final double amount;

  const FinanceSendMoneySuccessScreen({
    super.key,
    required this.recipient,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.pageSpacingSmall,
          child: Column(
            children: [
              const Spacer(),
              Container(
                height: 96.spMin,
                width: 96.spMin,
                decoration: BoxDecoration(
                  color: AppColors.successChipBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: AppColors.successChip,
                  size: 48.spMin,
                ),
              ),
              AppSpacing.verticalXSpacing(space: 24),
              Text('Transfer Successful', style: AppTextStyle.poppinsW700(22)),
              AppSpacing.verticalXSpacing(space: 8),
              Text(
                '${amount.currency} sent to $recipient',
                style: AppTextStyle.interW400(
                  14,
                  fontColor: AppColors.secondaryBlack,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              RoundActionButton(
                text: 'Back to Home',
                action:
                    () => Navigator.popUntil(
                      context,
                      ModalRoute.withName(Routes.financeHome),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
