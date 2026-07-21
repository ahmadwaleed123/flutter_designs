import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common_widgets/app_card.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/round_action_button.dart';
import '../../constants/theme_constants.dart';
import '../../models/models.dart';
import '../../utils/extensions.dart';

class SpecialistDetailScreen extends StatelessWidget {
  final Specialist specialist;

  const SpecialistDetailScreen({super.key, required this.specialist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: const CustomAppbar(title: 'Doctor Profile'),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: AppSpacing.pageSpacingSmall,
          child: Column(
            spacing: 24.spMin,
            children: [
              Column(
                spacing: 8.spMin,
                children: [
                  Container(
                    height: 88.spMin,
                    width: 88.spMin,
                    decoration: BoxDecoration(
                      color: specialist.avatarColor.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        specialist.initials,
                        style: AppTextStyle.poppinsW700(
                          32,
                          fontColor: specialist.avatarColor,
                        ),
                      ),
                    ),
                  ),
                  Text(specialist.name, style: AppTextStyle.poppinsW700(20)),
                  Text(
                    specialist.specialty,
                    style: AppTextStyle.interW400(
                      14,
                      fontColor: AppColors.tertiaryBlack,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4.spMin,
                    children: [
                      Icon(Icons.star_rounded, color: AppColors.warningChip, size: 18.spMin),
                      Text(
                        '${specialist.rating} rating',
                        style: AppTextStyle.interW600(13),
                      ),
                    ],
                  ),
                ],
              ),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8.spMin,
                  children: [
                    Text('About', style: AppTextStyle.poppinsW600(15)),
                    Text(
                      specialist.bio,
                      style: AppTextStyle.interW400(
                        13,
                        fontColor: AppColors.secondaryBlack,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
              AppCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Consultation Fee',
                      style: AppTextStyle.interW400(
                        14,
                        fontColor: AppColors.tertiaryBlack,
                      ),
                    ),
                    Text(
                      specialist.price.currency,
                      style: AppTextStyle.poppinsW700(
                        18,
                        fontColor: AppColors.primaryBrand,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              RoundActionButton(
                text: 'Book Appointment',
                action: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: AppRoundBorder.circularXpx(pixel: 16),
                          ),
                          title: Text(
                            'Appointment Requested',
                            style: AppTextStyle.poppinsW600(16),
                          ),
                          content: Text(
                            'Your request with ${specialist.name} has been sent.',
                            style: AppTextStyle.interW400(13),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Done',
                                style: AppTextStyle.interW600(
                                  14,
                                  fontColor: AppColors.primaryBrand,
                                ),
                              ),
                            ),
                          ],
                        ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
