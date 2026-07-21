import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/app_card.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../common_widgets/round_action_button.dart';
import '../../../constants/theme_constants.dart';
import '../../../providers/providers.dart';
import '../../../utils/extensions.dart';
import '../../../utils/routes.dart';

class FinanceSendMoneyReviewScreen extends StatelessWidget {
  final String recipient;
  final double amount;

  const FinanceSendMoneyReviewScreen({
    super.key,
    required this.recipient,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: const CustomAppbar(title: 'Review Transfer'),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: AppSpacing.pageSpacingSmall,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  spacing: 20.spMin,
                  children: [
                    Column(
                      children: [
                        Text(
                          amount.currency,
                          style: AppTextStyle.poppinsW700(32),
                        ),
                        Text(
                          'Amount to send',
                          style: AppTextStyle.interW400(
                            13,
                            fontColor: AppColors.tertiaryBlack,
                          ),
                        ),
                      ],
                    ),
                    AppCard(
                      child: Column(
                        children: [
                          _row('To', recipient),
                          _divider,
                          _row('From', 'Finly Wallet'),
                          _divider,
                          _row('Transfer Fee', 'Free'),
                          _divider,
                          _row(
                            'Total',
                            amount.currency,
                            valueColor: AppColors.primaryBrand,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Consumer<WalletProvider>(
                builder:
                    (context, provider, _) => RoundActionButton(
                      text: 'Confirm & Send',
                      isLoading: provider.isLoading,
                      action: () async {
                        await provider.sendMoney(
                          recipient: recipient,
                          amount: amount,
                        );
                        if (!context.mounted) return;
                        Navigator.pushNamed(
                          context,
                          Routes.financeSendMoneySuccess,
                          arguments: {
                            'recipient': recipient,
                            'amount': amount,
                          },
                        );
                      },
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _divider => Divider(height: 24.spMin, color: AppColors.mediumStroke);

  Widget _row(String label, String value, {Color? valueColor}) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label, style: AppTextStyle.interW400(14, fontColor: AppColors.tertiaryBlack)),
      Text(
        value,
        style: AppTextStyle.interW600(
          14,
          fontColor: valueColor ?? AppColors.primaryBlack,
        ),
      ),
    ],
  );
}
