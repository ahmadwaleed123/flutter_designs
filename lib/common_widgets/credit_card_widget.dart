import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/enums.dart';
import '../constants/theme_constants.dart';
import '../models/models.dart';
import '../utils/extensions.dart';

class CreditCardWidget extends StatelessWidget {
  final WalletCard card;

  const CreditCardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.spMin,
      width: double.infinity,
      padding: EdgeInsets.all(20.spMin),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [card.gradientStart, card.gradientEnd],
        ),
        borderRadius: AppRoundBorder.circularXpx(pixel: 20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Balance',
                style: AppTextStyle.interW400(
                  12,
                  fontColor: AppColors.tertiaryWhite,
                ),
              ),
              Icon(
                Icons.wifi_rounded,
                color: AppColors.primaryWhite.withValues(alpha: 0.8),
                size: 22.spMin,
              ),
            ],
          ),
          AppSpacing.verticalXSpacing(space: 4),
          Text(
            card.balance.currency,
            style: AppTextStyle.poppinsW700(
              24,
              fontColor: AppColors.primaryWhite,
            ),
          ),
          const Spacer(),
          Text(
            '•••• •••• •••• ${card.last4}',
            style: AppTextStyle.interW600(
              16,
              fontColor: AppColors.primaryWhite,
              height: 1,
            ),
          ),
          AppSpacing.verticalXSpacing(space: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CARD HOLDER',
                    style: AppTextStyle.interW400(
                      9,
                      fontColor: AppColors.tertiaryWhite,
                    ),
                  ),
                  Text(
                    card.holderName,
                    style: AppTextStyle.interW600(
                      13,
                      fontColor: AppColors.primaryWhite,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EXPIRES',
                    style: AppTextStyle.interW400(
                      9,
                      fontColor: AppColors.tertiaryWhite,
                    ),
                  ),
                  Text(
                    card.expiry,
                    style: AppTextStyle.interW600(
                      13,
                      fontColor: AppColors.primaryWhite,
                    ),
                  ),
                ],
              ),
              Text(
                card.brand.title,
                style: AppTextStyle.poppinsW700(
                  16,
                  fontColor: AppColors.primaryWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
