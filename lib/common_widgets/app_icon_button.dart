import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/theme_constants.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final double size, iconSize, borderRadius;
  final Function()? action;
  final Color? bgColor, iconColor;
  final Border? border;

  const AppIconButton({
    super.key,
    required this.icon,
    this.action,
    this.size = 44,
    this.iconSize = 20,
    this.borderRadius = 12,
    this.bgColor,
    this.iconColor,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: action,
        child: Container(
          height: size.spMin,
          width: size.spMin,
          decoration: BoxDecoration(
            borderRadius: AppRoundBorder.circularXpx(pixel: borderRadius),
            color: bgColor ?? AppColors.quaternaryBrand,
            border: border,
          ),
          child: Center(
            child: Icon(
              icon,
              size: iconSize.spMin,
              color: iconColor ?? AppColors.primaryBrand,
            ),
          ),
        ),
      ),
    );
  }
}
