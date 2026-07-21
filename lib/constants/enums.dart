import 'package:flutter/material.dart';

import 'theme_constants.dart';

enum TransactionType { credit, debit }

extension TransactionTypeExt on TransactionType {
  bool get isCredit => this == TransactionType.credit;

  Color get color => isCredit ? AppColors.successChip : AppColors.errorChip;

  String get sign => isCredit ? '+' : '-';
}

enum TransactionCategory {
  shopping,
  food,
  transport,
  bills,
  salary,
  transfer,
  entertainment,
}

extension TransactionCategoryExt on TransactionCategory {
  String get title {
    switch (this) {
      case TransactionCategory.shopping:
        return 'Shopping';
      case TransactionCategory.food:
        return 'Food & Drinks';
      case TransactionCategory.transport:
        return 'Transport';
      case TransactionCategory.bills:
        return 'Bills';
      case TransactionCategory.salary:
        return 'Salary';
      case TransactionCategory.transfer:
        return 'Transfer';
      case TransactionCategory.entertainment:
        return 'Entertainment';
    }
  }

  IconData get icon {
    switch (this) {
      case TransactionCategory.shopping:
        return Icons.shopping_bag_rounded;
      case TransactionCategory.food:
        return Icons.restaurant_rounded;
      case TransactionCategory.transport:
        return Icons.directions_car_filled_rounded;
      case TransactionCategory.bills:
        return Icons.receipt_long_rounded;
      case TransactionCategory.salary:
        return Icons.account_balance_wallet_rounded;
      case TransactionCategory.transfer:
        return Icons.swap_horiz_rounded;
      case TransactionCategory.entertainment:
        return Icons.movie_rounded;
    }
  }

  Color get color {
    switch (this) {
      case TransactionCategory.shopping:
        return const Color(0xffFF8A5C);
      case TransactionCategory.food:
        return const Color(0xffFFB020);
      case TransactionCategory.transport:
        return const Color(0xff4FA1FF);
      case TransactionCategory.bills:
        return const Color(0xffFF4757);
      case TransactionCategory.salary:
        return AppColors.successChip;
      case TransactionCategory.transfer:
        return AppColors.primaryBrand;
      case TransactionCategory.entertainment:
        return const Color(0xffB05CFF);
    }
  }
}

enum CardBrand { visa, mastercard }

extension CardBrandExt on CardBrand {
  String get title {
    switch (this) {
      case CardBrand.visa:
        return 'VISA';
      case CardBrand.mastercard:
        return 'Mastercard';
    }
  }
}
