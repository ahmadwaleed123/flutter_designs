import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/theme_constants.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color bgColor;
  final Border? border;
  final double borderRadius;
  final Function()? action;
  final double? width;
  final double elevation;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.bgColor = AppColors.primaryWhite,
    this.borderRadius = 16,
    this.action,
    this.width,
    this.border,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Card(
        elevation: elevation,
        margin: EdgeInsets.zero,
        color: bgColor,
        child: Container(
          width: width?.spMin,
          padding: padding ?? EdgeInsets.all(16.spMin),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: AppRoundBorder.circularXpx(pixel: borderRadius),
            border: border,
          ),
          child: child,
        ),
      ),
    );
  }
}
