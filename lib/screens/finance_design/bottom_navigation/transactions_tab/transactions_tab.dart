import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/app_card.dart';
import '../../../../common_widgets/shimmer_container.dart';
import '../../../../common_widgets/transaction_tile.dart';
import '../../../../constants/enums.dart';
import '../../../../constants/theme_constants.dart';
import '../../../../models/models.dart';
import '../../../../providers/providers.dart';
import '../../../../utils/routes.dart';

enum _Filter { all, income, expense }

class TransactionsTab extends StatefulWidget {
  const TransactionsTab({super.key});

  @override
  State<TransactionsTab> createState() => _TransactionsTabState();
}

class _TransactionsTabState extends State<TransactionsTab> {
  _Filter _filter = _Filter.all;

  List<Transaction> _filtered(List<Transaction> transactions) {
    switch (_filter) {
      case _Filter.income:
        return transactions
            .where((t) => t.type == TransactionType.credit)
            .toList();
      case _Filter.expense:
        return transactions
            .where((t) => t.type == TransactionType.debit)
            .toList();
      case _Filter.all:
        return transactions;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBg,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.pageSpacingSmall,
          child: Column(
            spacing: 16.spMin,
            children: [
              Text('Activity', style: AppTextStyle.poppinsW700(22)),
              Row(
                spacing: 8.spMin,
                children: [
                  _chip('All', _Filter.all),
                  _chip('Income', _Filter.income),
                  _chip('Expense', _Filter.expense),
                ],
              ),
              Expanded(
                child: Consumer<WalletProvider>(
                  builder: (context, provider, _) {
                    if (provider.isLoading) {
                      return AppCard(
                        child: Column(
                          children: List.generate(
                            4,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.spMin),
                              child: Row(
                                children: [
                                  ShimmerContainer(width: 44, height: 44),
                                  AppSpacing.horizontalXSpacing(space: 12),
                                  ShimmerContainer(width: 160, height: 14),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    final items = _filtered(provider.transactions);
                    if (items.isEmpty) {
                      return Center(
                        child: Text(
                          'No transactions yet',
                          style: AppTextStyle.interW400(
                            14,
                            fontColor: AppColors.tertiaryBlack,
                          ),
                        ),
                      );
                    }
                    return SingleChildScrollView(
                      child: AppCard(
                        padding: EdgeInsets.symmetric(horizontal: 16.spMin),
                        child: Column(
                          children:
                              items
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
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chip(String label, _Filter value) {
    final selected = _filter == value;
    return GestureDetector(
      onTap: () => setState(() => _filter = value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.spMin, vertical: 8.spMin),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryBrand : AppColors.primaryWhite,
          borderRadius: AppRoundBorder.circularXpx(pixel: 20),
          border: Border.all(
            color: selected ? AppColors.primaryBrand : AppColors.darkStroke,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyle.interW600(
            13,
            fontColor: selected ? AppColors.primaryWhite : AppColors.secondaryBlack,
          ),
        ),
      ),
    );
  }
}
