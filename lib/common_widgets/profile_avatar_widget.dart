import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/theme_constants.dart';

class ProfileAvatarWidget extends StatelessWidget {
  final String initials;
  final double size;
  final Function()? action;
  final Color bgColor;

  const ProfileAvatarWidget({
    super.key,
    required this.initials,
    this.size = 44,
    this.action,
    this.bgColor = AppColors.primaryBrand,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        height: size.spMin,
        width: size.spMin,
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: Center(
          child: Text(
            initials,
            style: AppTextStyle.poppinsW600(
              size / 2.4,
              fontColor: AppColors.primaryWhite,
            ),
          ),
        ),
      ),
    );
  }
}
