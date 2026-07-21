import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/app_card.dart';
import '../../../../common_widgets/app_icon_button.dart';
import '../../../../common_widgets/profile_avatar_widget.dart';
import '../../../../common_widgets/round_action_button.dart';
import '../../../../common_widgets/section_header.dart';
import '../../../../common_widgets/shimmer_container.dart';
import '../../../../common_widgets/transaction_tile.dart';
import '../../../../constants/theme_constants.dart';
import '../../../../providers/providers.dart';
import '../../../../utils/extensions.dart';
import '../../../../utils/routes.dart';
import '../bottom_navigation_screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late WalletProvider walletProvider;
  late FinanceUserProvider userProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      walletProvider.fetchWallet();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    walletProvider = Provider.of<WalletProvider>(context);
    userProvider = Provider.of<FinanceUserProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBg,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.pageSpacingSmall,
          child: Column(
            spacing: 20.spMin,
            children: [
              Row(
                spacing: 12.spMin,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good morning',
                          style: AppTextStyle.interW400(
                            13,
                            fontColor: AppColors.tertiaryBlack,
                          ),
                        ),
                        Text(
                          userProvider.user.fullName.isEmpty
                              ? 'Alex Morgan'
                              : userProvider.user.fullName,
                          style: AppTextStyle.poppinsW600(18),
                        ),
                      ],
                    ),
                  ),
                  AppIconButton(
                    icon: Icons.notifications_none_rounded,
                    action:
                        () => Navigator.pushNamed(context, Routes.notifications),
                  ),
                  ProfileAvatarWidget(
                    initials:
                        userProvider.user.initials.isEmpty
                            ? 'AM'
                            : userProvider.user.initials,
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 20.spMin,
                    children: [
                      balanceCard,
                      chartCard,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 8.spMin,
                        children: [
                          SectionHeader(
                            title: 'Recent Transactions',
                            action: () => financeTabController.jumpToPage(2),
                          ),
                          transactionsList,
                        ],
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

  Widget get balanceCard => AppCard(
    bgColor: AppColors.cardIndigoStart,
    padding: EdgeInsets.all(20.spMin),
    child: Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.cardIndigoStart, AppColors.cardIndigoEnd],
        ),
        borderRadius: AppRoundBorder.circularXpx(pixel: 16),
      ),
      padding: EdgeInsets.all(4.spMin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4.spMin,
        children: [
          Text(
            'Total Balance',
            style: AppTextStyle.interW400(
              13,
              fontColor: AppColors.tertiaryWhite,
            ),
          ),
          walletProvider.isLoading
              ? ShimmerContainer(width: 140, height: 28)
              : Text(
                walletProvider.balance.currency,
                style: AppTextStyle.poppinsW700(
                  30,
                  fontColor: AppColors.primaryWhite,
                ),
              ),
          AppSpacing.verticalXSpacing(space: 12),
          Row(
            spacing: 12.spMin,
            children: [
              Expanded(
                child: RoundActionButton(
                  text: 'Send',
                  height: 44,
                  bgColor: AppColors.primaryWhite,
                  textColor: AppColors.primaryBrand,
                  icon: Icon(
                    Icons.arrow_upward_rounded,
                    size: 16.spMin,
                    color: AppColors.primaryBrand,
                  ),
                  action:
                      () => Navigator.pushNamed(
                        context,
                        Routes.financeSendMoneyRecipient,
                      ),
                ),
              ),
              Expanded(
                child: RoundActionButton(
                  text: 'Add Card',
                  height: 44,
                  bgColor: AppColors.primaryWhite.withValues(alpha: 0.15),
                  textColor: AppColors.primaryWhite,
                  icon: Icon(
                    Icons.add_rounded,
                    size: 16.spMin,
                    color: AppColors.primaryWhite,
                  ),
                  action:
                      () => Navigator.pushNamed(context, Routes.financeAddCard),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  Widget get chartCard => AppCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.spMin,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('This Week', style: AppTextStyle.poppinsW600(16)),
            Row(
              spacing: 6.spMin,
              children: [
                Container(
                  height: 8.spMin,
                  width: 8.spMin,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryBrand,
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  'Spending',
                  style: AppTextStyle.interW400(
                    12,
                    fontColor: AppColors.tertiaryBlack,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 140.spMin,
          child:
              walletProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      gridData: const FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              const days = [
                                'M',
                                'T',
                                'W',
                                'T',
                                'F',
                                'S',
                                'S',
                              ];
                              return Padding(
                                padding: EdgeInsets.only(top: 6.spMin),
                                child: Text(
                                  days[value.toInt() % 7],
                                  style: AppTextStyle.interW400(
                                    11,
                                    fontColor: AppColors.tertiaryBlack,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      barGroups: List.generate(
                        walletProvider.weeklySpend.length,
                        (index) => BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                              toY: walletProvider.weeklySpend[index],
                              color: AppColors.primaryBrand,
                              width: 16.spMin,
                              borderRadius: BorderRadius.circular(6),
                              backDrawRodData: BackgroundBarChartRodData(
                                show: true,
                                toY: 320,
                                color: AppColors.quaternaryBrand,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
        ),
      ],
    ),
  );

  Widget get transactionsList {
    if (walletProvider.isLoading) {
      return AppCard(
        child: Column(
          children: List.generate(
            3,
            (index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 6.spMin),
              child: Row(
                children: [
                  ShimmerContainer(
                    width: 44,
                    height: 44,
                    borderRadius: AppRoundBorder.circularXpx(pixel: 12),
                  ),
                  AppSpacing.horizontalXSpacing(space: 12),
                  ShimmerContainer(width: 160, height: 14),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return AppCard(
      padding: EdgeInsets.symmetric(horizontal: 16.spMin),
      child: Column(
        children:
            walletProvider.recentTransactions
                .map(
                  (t) => TransactionTile(
                    transaction: t,
                    action:
                        () => Navigator.pushNamed(
                          context,
                          Routes.financeTransactionDetail,
                          arguments: t,
                        ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
