import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/app_card.dart';
import '../../../../common_widgets/app_icon_button.dart';
import '../../../../common_widgets/credit_card_widget.dart';
import '../../../../common_widgets/round_action_button.dart';
import '../../../../constants/theme_constants.dart';
import '../../../../providers/providers.dart';
import '../../../../utils/routes.dart';

class CardsTab extends StatefulWidget {
  const CardsTab({super.key});

  @override
  State<CardsTab> createState() => _CardsTabState();
}

class _CardsTabState extends State<CardsTab> {
  final PageController _controller = PageController(viewportFraction: 0.9);
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.spMin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppSpacing.leftRightSpacingSmall,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('My Cards', style: AppTextStyle.poppinsW700(22)),
                    AppIconButton(
                      icon: Icons.add_rounded,
                      action:
                          () => Navigator.pushNamed(context, Routes.financeAddCard),
                    ),
                  ],
                ),
              ),
              AppSpacing.verticalXSpacing(space: 20),
              Consumer<WalletProvider>(
                builder: (context, provider, _) {
                  if (provider.isLoading) {
                    return SizedBox(
                      height: 190.spMin,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }
                  return SizedBox(
                    height: 190.spMin,
                    child: PageView.builder(
                      controller: _controller,
                      onPageChanged: (value) => setState(() => _page = value),
                      itemCount: provider.cards.length,
                      itemBuilder:
                          (context, index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.spMin),
                            child: CreditCardWidget(card: provider.cards[index]),
                          ),
                    ),
                  );
                },
              ),
              AppSpacing.verticalXSpacing(space: 12),
              Consumer<WalletProvider>(
                builder:
                    (context, provider, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        provider.cards.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: EdgeInsets.symmetric(horizontal: 3.spMin),
                          height: 6.spMin,
                          width: _page == index ? 18.spMin : 6.spMin,
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
              ),
              AppSpacing.verticalXSpacing(space: 24),
              Expanded(
                child: SingleChildScrollView(
                  padding: AppSpacing.leftRightSpacingSmall,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16.spMin,
                    children: [
                      Text('Card Actions', style: AppTextStyle.poppinsW600(16)),
                      Row(
                        spacing: 12.spMin,
                        children: [
                          Expanded(
                            child: _actionTile(
                              icon: Icons.ac_unit_rounded,
                              label: 'Freeze',
                            ),
                          ),
                          Expanded(
                            child: _actionTile(
                              icon: Icons.visibility_outlined,
                              label: 'Details',
                            ),
                          ),
                          Expanded(
                            child: _actionTile(
                              icon: Icons.settings_outlined,
                              label: 'Limits',
                            ),
                          ),
                        ],
                      ),
                      AppSpacing.verticalXSpacing(space: 4),
                      RoundActionButton(
                        text: 'Add New Card',
                        bgColor: AppColors.quaternaryBrand,
                        textColor: AppColors.primaryBrand,
                        icon: Icon(
                          Icons.add_rounded,
                          size: 16.spMin,
                          color: AppColors.primaryBrand,
                        ),
                        action:
                            () => Navigator.pushNamed(context, Routes.financeAddCard),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _actionTile({required IconData icon, required String label}) {
    return AppCard(
      padding: EdgeInsets.symmetric(vertical: 16.spMin),
      child: Column(
        spacing: 8.spMin,
        children: [
          Icon(icon, color: AppColors.primaryBrand),
          Text(label, style: AppTextStyle.interW600(12)),
        ],
      ),
    );
  }
}
