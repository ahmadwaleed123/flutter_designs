import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/app_card.dart';
import '../../../../common_widgets/profile_avatar_widget.dart';
import '../../../../constants/theme_constants.dart';
import '../../../../providers/providers.dart';
import '../../../../utils/routes.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBg,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.pageSpacingSmall,
          child: Consumer<FinanceUserProvider>(
            builder: (context, provider, _) {
              return Column(
                spacing: 24.spMin,
                children: [
                  Text('Profile', style: AppTextStyle.poppinsW700(22)),
                  AppCard(
                    child: Row(
                      spacing: 14.spMin,
                      children: [
                        ProfileAvatarWidget(
                          initials:
                              provider.user.initials.isEmpty
                                  ? 'AM'
                                  : provider.user.initials,
                          size: 56,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                provider.user.fullName.isEmpty
                                    ? 'Alex Morgan'
                                    : provider.user.fullName,
                                style: AppTextStyle.poppinsW600(16),
                              ),
                              Text(
                                provider.user.email.isEmpty
                                    ? 'alex.morgan@finly.app'
                                    : provider.user.email,
                                style: AppTextStyle.interW400(
                                  13,
                                  fontColor: AppColors.tertiaryBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: AppCard(
                        padding: EdgeInsets.symmetric(horizontal: 6.spMin),
                        child: Column(
                          children: [
                            _tile(
                              icon: Icons.person_outline_rounded,
                              title: 'Personal Information',
                              action: () {},
                            ),
                            _tile(
                              icon: Icons.notifications_none_rounded,
                              title: 'Notifications',
                              action:
                                  () => Navigator.pushNamed(
                                    context,
                                    Routes.notifications,
                                  ),
                            ),
                            _tile(
                              icon: Icons.lock_outline_rounded,
                              title: 'Security',
                              action: () {},
                            ),
                            _tile(
                              icon: Icons.credit_card_outlined,
                              title: 'Payment Methods',
                              action: () {},
                            ),
                            _tile(
                              icon: Icons.help_outline_rounded,
                              title: 'Help & Support',
                              action: () {},
                            ),
                            _tile(
                              icon: Icons.logout_rounded,
                              title: 'Log Out',
                              iconColor: AppColors.errorChip,
                              textColor: AppColors.errorChip,
                              showDivider: false,
                              action: () {
                                provider.logout();
                                Navigator.popUntil(
                                  context,
                                  (route) => route.isFirst,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _tile({
    required IconData icon,
    required String title,
    required Function() action,
    Color? iconColor,
    Color? textColor,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: action,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.spMin, horizontal: 10.spMin),
            child: Row(
              spacing: 14.spMin,
              children: [
                Icon(icon, color: iconColor ?? AppColors.secondaryBlack, size: 20.spMin),
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyle.interW600(
                      14,
                      fontColor: textColor ?? AppColors.primaryBlack,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.tertiaryBlack,
                  size: 20.spMin,
                ),
              ],
            ),
          ),
        ),
        if (showDivider) Divider(height: 1, color: AppColors.mediumStroke),
      ],
    );
  }
}
