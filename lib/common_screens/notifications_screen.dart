import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets/custom_appbar.dart';
import '../constants/theme_constants.dart';

class _NotificationItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final Color color;

  const _NotificationItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.color,
  });
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static const List<_NotificationItem> _items = [
    _NotificationItem(
      icon: Icons.arrow_downward_rounded,
      title: 'Payment Received',
      subtitle: 'You received \$650.00 from Freelance Payment',
      time: '2h ago',
      color: AppColors.successChip,
    ),
    _NotificationItem(
      icon: Icons.credit_card_rounded,
      title: 'Card Added',
      subtitle: 'Your Mastercard ending in 2210 was added',
      time: '1d ago',
      color: AppColors.primaryBrand,
    ),
    _NotificationItem(
      icon: Icons.warning_amber_rounded,
      title: 'Unusual Spending',
      subtitle: 'Your shopping spend is 20% higher this week',
      time: '2d ago',
      color: AppColors.warningChip,
    ),
    _NotificationItem(
      icon: Icons.arrow_upward_rounded,
      title: 'Transfer Sent',
      subtitle: 'You sent \$120.00 to Sarah Williams',
      time: '3d ago',
      color: AppColors.errorChip,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: const CustomAppbar(title: 'Notifications'),
      body: SafeArea(
        top: false,
        child: ListView.separated(
          padding: AppSpacing.pageSpacingSmall,
          itemCount: _items.length,
          separatorBuilder:
              (context, index) => Divider(color: AppColors.mediumStroke),
          itemBuilder: (context, index) {
            final item = _items[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.spMin),
              child: Row(
                spacing: 12.spMin,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 44.spMin,
                    width: 44.spMin,
                    decoration: BoxDecoration(
                      color: item.color.withValues(alpha: 0.12),
                      borderRadius: AppRoundBorder.circularXpx(pixel: 12),
                    ),
                    child: Icon(item.icon, color: item.color, size: 20.spMin),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.title, style: AppTextStyle.interW600(14)),
                        AppSpacing.verticalXSpacing(space: 2),
                        Text(
                          item.subtitle,
                          style: AppTextStyle.interW400(
                            13,
                            fontColor: AppColors.secondaryBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    item.time,
                    style: AppTextStyle.interW400(
                      11,
                      fontColor: AppColors.tertiaryBlack,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
