import 'package:flutter/material.dart';

import '../constants/theme_constants.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  final Function()? action;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText = 'See all',
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyle.poppinsW600(18)),
        if (action != null)
          GestureDetector(
            onTap: action,
            child: Text(
              actionText,
              style: AppTextStyle.interW600(13, fontColor: AppColors.primaryBrand),
            ),
          ),
      ],
    );
  }
}
