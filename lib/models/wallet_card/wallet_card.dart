import 'package:flutter/material.dart';

import '../../constants/enums.dart';
import '../../constants/theme_constants.dart';

class WalletCard {
  final int id;
  final String holderName;
  final CardBrand brand;
  final String last4;
  final String expiry;
  final double balance;
  final Color gradientStart;
  final Color gradientEnd;

  const WalletCard({
    required this.id,
    required this.holderName,
    required this.brand,
    required this.last4,
    required this.expiry,
    required this.balance,
    this.gradientStart = AppColors.cardIndigoStart,
    this.gradientEnd = AppColors.cardIndigoEnd,
  });
}
