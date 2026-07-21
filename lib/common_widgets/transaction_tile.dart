import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/enums.dart';
import '../constants/theme_constants.dart';
import '../models/models.dart';
import '../utils/extensions.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  final Function()? action;

  const TransactionTile({super.key, required this.transaction, this.action});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      borderRadius: AppRoundBorder.circularXpx(pixel: 12),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.spMin),
        child: Row(
          children: [
            Container(
              height: 44.spMin,
              width: 44.spMin,
              decoration: BoxDecoration(
                color: transaction.category.color.withValues(alpha: 0.12),
                borderRadius: AppRoundBorder.circularXpx(pixel: 12),
              ),
              child: Icon(
                transaction.category.icon,
                color: transaction.category.color,
                size: 20.spMin,
              ),
            ),
            AppSpacing.horizontalXSpacing(space: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.title,
                    style: AppTextStyle.interW600(14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppSpacing.verticalXSpacing(space: 2),
                  Text(
                    transaction.dateTime.timeAgo,
                    style: AppTextStyle.interW400(
                      12,
                      fontColor: AppColors.tertiaryBlack,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '${transaction.type.sign}${transaction.amount.currency}',
              style: AppTextStyle.interW600(
                14,
                fontColor: transaction.type.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
