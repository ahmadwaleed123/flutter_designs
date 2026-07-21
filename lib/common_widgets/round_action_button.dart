import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/theme_constants.dart';

class RoundActionButton extends StatelessWidget {
  final VoidCallback? action;
  final double height, width;
  final TextStyle? style;
  final String text;
  final Widget? icon;
  final double? elevation;
  final Color bgColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final BorderSide? border;
  final double? fontSize;
  final EdgeInsets? padding;
  final bool haveLowestWidth;
  final bool isLoading;
  final double iconPadding;

  const RoundActionButton({
    this.action,
    required this.text,
    this.height = 52,
    this.width = double.infinity,
    this.elevation,
    this.icon,
    this.bgColor = AppColors.primaryBrand,
    this.textColor = Colors.white,
    this.fontSize,
    this.padding,
    this.haveLowestWidth = false,
    super.key,
    this.borderRadius,
    this.style,
    this.iconPadding = 10,
    this.border,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final hasIcon = icon != null;
    return Container(
      width: haveLowestWidth ? null : width.spMin,
      height: height.spMin,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : action,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(elevation ?? 0),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          backgroundColor: WidgetStateProperty.all(bgColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: border ?? BorderSide.none,
              borderRadius: borderRadius ?? BorderRadius.circular(16),
            ),
          ),
        ),
        child: Container(
          width: haveLowestWidth ? null : width.spMin,
          height: height.spMin,
          padding: padding ?? AppSpacing.leftRightSpacingSmall,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
          child:
              isLoading
                  ? Center(
                    child: SizedBox(
                      height: 22.spMin,
                      width: 22.spMin,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: textColor,
                      ),
                    ),
                  )
                  : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      if (hasIcon)
                        Padding(
                          padding: EdgeInsets.only(right: iconPadding.spMin),
                          child: icon!,
                        ),
                      if (text.isNotEmpty)
                        Text(
                          text,
                          style:
                              style ??
                              AppTextStyle.poppinsW600(
                                fontSize ?? 16,
                                fontColor: textColor,
                              ),
                        ),
                    ],
                  ),
        ),
      ),
    );
  }
}
