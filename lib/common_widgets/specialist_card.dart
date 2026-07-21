import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/theme_constants.dart';
import '../models/models.dart';
import '../utils/extensions.dart';

class SpecialistCard extends StatelessWidget {
  final Specialist specialist;
  final Function()? action;

  const SpecialistCard({super.key, required this.specialist, this.action});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      borderRadius: AppRoundBorder.circularXpx(pixel: 16),
      child: Container(
        padding: EdgeInsets.all(12.spMin),
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          border: Border.all(color: AppColors.mediumStroke),
          borderRadius: AppRoundBorder.circularXpx(pixel: 16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.spMin,
          children: [
            Stack(
              children: [
                Container(
                  height: 96.spMin,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: specialist.avatarColor.withValues(alpha: 0.12),
                    borderRadius: AppRoundBorder.circularXpx(pixel: 12),
                  ),
                  child: Center(
                    child: Text(
                      specialist.initials,
                      style: AppTextStyle.poppinsW700(
                        28,
                        fontColor: specialist.avatarColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 6.spMin,
                  bottom: 6.spMin,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.spMin,
                      vertical: 3.spMin,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlack.withValues(alpha: 0.75),
                      borderRadius: AppRoundBorder.circularXpx(pixel: 8),
                    ),
                    child: Text(
                      specialist.price.currency,
                      style: AppTextStyle.interW600(
                        11,
                        fontColor: AppColors.primaryWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              specialist.name,
              style: AppTextStyle.poppinsW600(13),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              specialist.specialty,
              style: AppTextStyle.interW400(
                11,
                fontColor: AppColors.tertiaryBlack,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              spacing: 4.spMin,
              children: [
                Icon(Icons.star_rounded, color: AppColors.warningChip, size: 14.spMin),
                Text(
                  specialist.rating.toStringAsFixed(1),
                  style: AppTextStyle.interW600(11),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
