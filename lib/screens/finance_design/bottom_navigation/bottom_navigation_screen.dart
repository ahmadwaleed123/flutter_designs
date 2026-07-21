import 'package:flutter/material.dart';

import '../../../constants/theme_constants.dart';
import 'cards_tab/cards_tab.dart';
import 'home_tab/home_tab.dart';
import 'profile_tab/profile_tab.dart';
import 'transactions_tab/transactions_tab.dart';

final PageController financeTabController = PageController();

class FinanceBottomNavigationScreen extends StatefulWidget {
  const FinanceBottomNavigationScreen({super.key});

  @override
  State<FinanceBottomNavigationScreen> createState() =>
      _FinanceBottomNavigationScreenState();
}

class _FinanceBottomNavigationScreenState
    extends State<FinanceBottomNavigationScreen> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBg,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: AppColors.primaryWhite,
        currentIndex: currentTabIndex,
        onTap: changeTab,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: AppTextStyle.interW600(12),
        unselectedLabelStyle: AppTextStyle.interW400(
          12,
          fontColor: AppColors.tertiaryBlack,
        ),
        selectedItemColor: AppColors.primaryBrand,
        unselectedItemColor: AppColors.tertiaryBlack,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_outlined),
            activeIcon: Icon(Icons.credit_card_rounded),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            activeIcon: Icon(Icons.receipt_long_rounded),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: financeTabController,
        onPageChanged: (index) => setState(() => currentTabIndex = index),
        children: const [HomeTab(), CardsTab(), TransactionsTab(), ProfileTab()],
      ),
    );
  }

  void changeTab(int index) {
    setState(() => currentTabIndex = index);
    financeTabController.jumpToPage(index);
  }
}
