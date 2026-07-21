import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/data_constants.dart';
import '../../constants/theme_constants.dart';
import '../../utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1400), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, Routes.gallery);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primaryBrand, AppColors.secondaryBrand],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 84.spMin,
                width: 84.spMin,
                decoration: BoxDecoration(
                  color: AppColors.primaryWhite.withValues(alpha: 0.15),
                  borderRadius: AppRoundBorder.circularXpx(pixel: 24),
                ),
                child: Icon(
                  Icons.grid_view_rounded,
                  color: AppColors.primaryWhite,
                  size: 40.spMin,
                ),
              ),
              AppSpacing.verticalXSpacing(space: 20),
              Text(
                Constants.appName,
                style: AppTextStyle.poppinsW700(
                  28,
                  fontColor: AppColors.primaryWhite,
                ),
              ),
              AppSpacing.verticalXSpacing(space: 6),
              Text(
                'A showcase of Flutter UI work',
                style: AppTextStyle.interW400(
                  14,
                  fontColor: AppColors.tertiaryWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
