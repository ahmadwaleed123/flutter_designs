import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/app_card.dart';
import '../../common_widgets/app_icon_button.dart';
import '../../common_widgets/round_action_button.dart';
import '../../common_widgets/section_header.dart';
import '../../common_widgets/shimmer_container.dart';
import '../../constants/theme_constants.dart';
import '../../providers/providers.dart';
import '../../utils/routes.dart';

class HealthcareHomeScreen extends StatefulWidget {
  const HealthcareHomeScreen({super.key});

  @override
  State<HealthcareHomeScreen> createState() => _HealthcareHomeScreenState();
}

class _HealthcareHomeScreenState extends State<HealthcareHomeScreen> {
  late SpecialistProvider specialistProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      specialistProvider.fetchSpecialists();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    specialistProvider = Provider.of<SpecialistProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBg,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.pageSpacingSmall,
          child: Column(
            spacing: 20.spMin,
            children: [
              Row(
                spacing: 12.spMin,
                children: [
                  AppIconButton(
                    icon: Icons.arrow_back_ios_new_rounded,
                    iconSize: 16,
                    action: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text('Health Care', style: AppTextStyle.poppinsW600(18)),
                  ),
                  AppIconButton(
                    icon: Icons.notifications_none_rounded,
                    action: () => Navigator.pushNamed(context, Routes.notifications),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 20.spMin,
                    children: [
                      AppCard(
                        bgColor: AppColors.primaryBrand,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12.spMin,
                          children: [
                            Text(
                              'Find Best Specialists\nNearby You',
                              style: AppTextStyle.poppinsW700(
                                20,
                                fontColor: AppColors.primaryWhite,
                              ),
                            ),
                            Text(
                              'Search, compare and book trusted doctors in just a few taps.',
                              style: AppTextStyle.interW400(
                                13,
                                fontColor: AppColors.tertiaryWhite,
                              ),
                            ),
                            RoundActionButton(
                              text: 'Book Appointment',
                              height: 44,
                              haveLowestWidth: true,
                              bgColor: AppColors.primaryWhite,
                              textColor: AppColors.primaryBrand,
                              action:
                                  () => Navigator.pushNamed(
                                    context,
                                    Routes.healthcareBookAppointment,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12.spMin,
                        children: [
                          SectionHeader(
                            title: 'Top Specialists',
                            action:
                                () => Navigator.pushNamed(
                                  context,
                                  Routes.healthcareBookAppointment,
                                ),
                          ),
                          specialistProvider.isLoading
                              ? Column(
                                spacing: 10.spMin,
                                children: List.generate(
                                  3,
                                  (index) => AppCard(
                                    child: Row(
                                      spacing: 12.spMin,
                                      children: [
                                        ShimmerContainer(
                                          width: 48,
                                          height: 48,
                                          borderRadius: AppRoundBorder.circularXpx(
                                            pixel: 24,
                                          ),
                                        ),
                                        ShimmerContainer(width: 160, height: 14),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              : Column(
                                spacing: 10.spMin,
                                children:
                                    specialistProvider.specialists
                                        .map(
                                          (s) => AppCard(
                                            action:
                                                () => Navigator.pushNamed(
                                                  context,
                                                  Routes.healthcareSpecialistDetail,
                                                  arguments: s,
                                                ),
                                            child: Row(
                                              spacing: 12.spMin,
                                              children: [
                                                Container(
                                                  height: 48.spMin,
                                                  width: 48.spMin,
                                                  decoration: BoxDecoration(
                                                    color: s.avatarColor
                                                        .withValues(alpha: 0.12),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      s.initials,
                                                      style: AppTextStyle.poppinsW600(
                                                        14,
                                                        fontColor: s.avatarColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        s.name,
                                                        style: AppTextStyle.interW600(
                                                          14,
                                                        ),
                                                      ),
                                                      Text(
                                                        s.specialty,
                                                        style: AppTextStyle.interW400(
                                                          12,
                                                          fontColor:
                                                              AppColors.tertiaryBlack,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.chevron_right_rounded,
                                                  color: AppColors.tertiaryBlack,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                              ),
                        ],
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
