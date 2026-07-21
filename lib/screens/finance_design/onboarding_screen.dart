import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common_widgets/round_action_button.dart';
import '../../constants/theme_constants.dart';
import '../../utils/routes.dart';

class _OnboardingPageData {
  final IconData icon;
  final String title;
  final String subtitle;

  const _OnboardingPageData({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

class FinanceOnboardingScreen extends StatefulWidget {
  const FinanceOnboardingScreen({super.key});

  @override
  State<FinanceOnboardingScreen> createState() => _FinanceOnboardingScreenState();
}

class _FinanceOnboardingScreenState extends State<FinanceOnboardingScreen> {
  final PageController _controller = PageController();
  int _page = 0;

  final List<_OnboardingPageData> _pages = const [
    _OnboardingPageData(
      icon: Icons.savings_rounded,
      title: 'Save without\nthinking about it',
      subtitle:
          'Track every expense automatically and watch your savings grow effortlessly.',
    ),
    _OnboardingPageData(
      icon: Icons.pie_chart_rounded,
      title: 'Understand where\nyour money goes',
      subtitle:
          'Clear breakdowns by category so you always know what you spent, and why.',
    ),
    _OnboardingPageData(
      icon: Icons.bolt_rounded,
      title: 'Send money in\nseconds',
      subtitle:
          'Pay friends, split bills and move funds between cards instantly.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: AppSpacing.leftRightSpacingSmall,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: AppSpacing.leftRightSpacingSmall,
                  child: TextButton(
                    onPressed:
                        () => Navigator.pushReplacementNamed(context, Routes.financeLogin),
                    child: Text(
                      'Skip',
                      style: AppTextStyle.interW600(
                        14,
                        fontColor: AppColors.tertiaryBlack,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (value) => setState(() => _page = value),
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: AppSpacing.pageSpacingSmall,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 180.spMin,
                          width: 180.spMin,
                          decoration: BoxDecoration(
                            color: AppColors.quaternaryBrand,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            page.icon,
                            size: 76.spMin,
                            color: AppColors.primaryBrand,
                          ),
                        ),
                        AppSpacing.verticalXSpacing(space: 40),
                        Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.poppinsW700(24),
                        ),
                        AppSpacing.verticalXSpacing(space: 12),
                        Text(
                          page.subtitle,
                          textAlign: TextAlign.center,
                          style: AppTextStyle.interW400(
                            14,
                            fontColor: AppColors.secondaryBlack,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: EdgeInsets.symmetric(horizontal: 4.spMin),
                  height: 8.spMin,
                  width: _page == index ? 22.spMin : 8.spMin,
                  decoration: BoxDecoration(
                    color:
                        _page == index
                            ? AppColors.primaryBrand
                            : AppColors.quaternaryBrand,
                    borderRadius: AppRoundBorder.circularXpx(pixel: 8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: AppSpacing.pageSpacingSmall,
              child: RoundActionButton(
                text: _page == _pages.length - 1 ? 'Get Started' : 'Next',
                action: () {
                  if (_page == _pages.length - 1) {
                    Navigator.pushReplacementNamed(context, Routes.financeLogin);
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}