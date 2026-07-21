import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common_widgets/app_card.dart';
import '../../constants/data_constants.dart';
import '../../constants/theme_constants.dart';
import '../../models/models.dart';
import '../../utils/routes.dart';

class DesignGalleryScreen extends StatelessWidget {
  const DesignGalleryScreen({super.key});

  static const List<AppDesign> _designs = [
    AppDesign(
      title: 'Finly Wallet',
      subtitle: 'Personal finance, cards & payments',
      icon: Icons.account_balance_wallet_rounded,
      accentColor: AppColors.primaryBrand,
      route: Routes.financeOnboarding,
    ),
    AppDesign(
      title: 'Health Care App',
      subtitle: 'Book appointments & chat with specialists',
      icon: Icons.local_hospital_rounded,
      accentColor: Color(0xff2E86DE),
      route: Routes.healthcareHome,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBg,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.pageSpacingSmall,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20.spMin,
            children: [
              AppSpacing.verticalXSpacing(space: 4),
              Text(Constants.appName, style: AppTextStyle.poppinsW700(28)),
              Text(
                'A collection of app UIs built end-to-end in Flutter.',
                style: AppTextStyle.interW400(
                  14,
                  fontColor: AppColors.secondaryBlack,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: _designs.length,
                  separatorBuilder:
                      (context, index) => AppSpacing.verticalXSpacing(space: 14),
                  itemBuilder: (context, index) => _designTile(context, _designs[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _designTile(BuildContext context, AppDesign design) {
    return AppCard(
      action: () => Navigator.pushNamed(context, design.route),
      border: Border.all(color: AppColors.mediumStroke),
      child: Row(
        spacing: 14.spMin,
        children: [
          Container(
            height: 52.spMin,
            width: 52.spMin,
            decoration: BoxDecoration(
              color: design.accentColor.withValues(alpha: 0.12),
              borderRadius: AppRoundBorder.circularXpx(pixel: 14),
            ),
            child: Icon(design.icon, color: design.accentColor, size: 26.spMin),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2.spMin,
              children: [
                Text(design.title, style: AppTextStyle.poppinsW600(15)),
                Text(
                  design.subtitle,
                  style: AppTextStyle.interW400(
                    12,
                    fontColor: AppColors.tertiaryBlack,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: AppColors.tertiaryBlack,
            size: 22.spMin,
          ),
        ],
      ),
    );
  }
}
