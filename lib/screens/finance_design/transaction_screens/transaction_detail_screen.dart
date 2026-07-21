import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/app_card.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../common_widgets/round_action_button.dart';
import '../../../constants/enums.dart';
import '../../../constants/theme_constants.dart';
import '../../../models/models.dart';
import '../../../utils/extensions.dart';

class FinanceTransactionDetailScreen extends StatelessWidget {
  final Transaction transaction;

  const FinanceTransactionDetailScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: const CustomAppbar(title: 'Transaction Details'),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: AppSpacing.pageSpacingSmall,
          child: Column(
            spacing: 24.spMin,
            children: [
              Column(
                children: [
                  Container(
                    height: 72.spMin,
                    width: 72.spMin,
                    decoration: BoxDecoration(
                      color: transaction.category.color.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      transaction.category.icon,
                      color: transaction.category.color,
                      size: 32.spMin,
                    ),
                  ),
                  AppSpacing.verticalXSpacing(space: 16),
                  Text(
                    '${transaction.type.sign}${transaction.amount.currency}',
                    style: AppTextStyle.poppinsW700(
                      28,
                      fontColor: transaction.type.color,
                    ),
                  ),
                  AppSpacing.verticalXSpacing(space: 4),
                  Text(
                    transaction.title,
                    style: AppTextStyle.interW600(
                      15,
                      fontColor: AppColors.secondaryBlack,
                    ),
                  ),
                ],
              ),
              AppCard(
                child: Column(
                  children: [
                    _row('Category', transaction.category.title),
                    _divider,
                    _row(
                      'Date',
                      transaction.dateTime.format(format: 'MMM dd, yyyy'),
                    ),
                    _divider,
                    _row('Time', transaction.dateTime.format(format: 'hh:mm a')),
                    _divider,
                    _row(
                      'Status',
                      'Completed',
                      valueColor: AppColors.successChip,
                    ),
                    if (transaction.note.isNotEmpty) ...[
                      _divider,
                      _row('Note', transaction.note),
                    ],
                  ],
                ),
              ),
              const Spacer(),
              Row(
                spacing: 12.spMin,
                children: [
                  Expanded(
                    child: RoundActionButton(
                      text: 'Share Receipt',
                      bgColor: AppColors.quaternaryBrand,
                      textColor: AppColors.primaryBrand,
                      action: () {},
                    ),
                  ),
                  Expanded(
                    child: RoundActionButton(text: 'Done', action: () => Navigator.pop(context)),
                  ),
                ],
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
