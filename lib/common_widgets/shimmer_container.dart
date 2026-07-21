import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/theme_constants.dart';

class ShimmerContainer extends StatelessWidget {
  final double width, height;
  final BorderRadius? borderRadius;

  const ShimmerContainer({
    super.key,
    this.width = 150,
    this.height = 15,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.quaternaryBlack,
      highlightColor: AppColors.lightStroke,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? AppRoundBorder.circular15px,
          color: AppColors.quaternaryBlack,
        ),
        height: height.spMin,
        width: width.spMin,
      ),
    );
  }
}
