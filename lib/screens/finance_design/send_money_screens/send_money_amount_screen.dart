import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/custom_appbar.dart';
import '../../../common_widgets/profile_avatar_widget.dart';
import '../../../common_widgets/round_action_button.dart';
import '../../../constants/theme_constants.dart';
import '../../../utils/routes.dart';

class FinanceSendMoneyAmountScreen extends StatefulWidget {
  final String recipient;

  const FinanceSendMoneyAmountScreen({super.key, required this.recipient});

  @override
  State<FinanceSendMoneyAmountScreen> createState() =>
      _FinanceSendMoneyAmountScreenState();
}

class _FinanceSendMoneyAmountScreenState
    extends State<FinanceSendMoneyAmountScreen> {
  String amount = '';

  void _tapKey(String key) {
    setState(() {
      if (key == 'back') {
        if (amount.isNotEmpty) amount = amount.substring(0, amount.length - 1);
      } else if (key == '.') {
        if (!amount.contains('.')) amount += key;
      } else {
        if (amount.contains('.') && amount.split('.').last.length >= 2) return;
        amount += key;
      }
    });
  }

  double get _value => double.tryParse(amount) ?? 0;

  String get _initials => widget.recipient
      .trim()
      .split(RegExp(r'\s+'))
      .map((e) => e.isNotEmpty ? e[0] : '')
      .take(2)
      .join()
      .toUpperCase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: const CustomAppbar(title: 'Enter Amount'),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: AppSpacing.pageSpacingSmall,
          child: Column(
            children: [
              Column(
                children: [
                  ProfileAvatarWidget(initials: _initials, size: 56),
                  AppSpacing.verticalXSpacing(space: 10),
                  Text(
                    'Sending to ${widget.recipient}',
                    style: AppTextStyle.interW400(
                      13,
                      fontColor: AppColors.tertiaryBlack,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '\$${amount.isEmpty ? '0' : amount}',
                style: AppTextStyle.poppinsW700(44),
              ),
              const Spacer(),
              _keypad,
              AppSpacing.verticalXSpacing(space: 16),
              RoundActionButton(
                text: 'Continue',
                action:
                    _value <= 0
                        ? null
                        : () => Navigator.pushNamed(
                          context,
                          Routes.financeSendMoneyReview,
                          arguments: {
                            'recipient': widget.recipient,
                            'amount': _value,
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _keypad {
    const keys = [
      '1', '2', '3',
      '4', '5', '6',
      '7', '8', '9',
      '.', '0', 'back',
    ];
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 8.spMin,
      crossAxisSpacing: 8.spMin,
      childAspectRatio: 1.6,
      children:
          keys
              .map(
                (key) => InkWell(
                  borderRadius: AppRoundBorder.circularXpx(pixel: 16),
                  onTap: () => _tapKey(key),
                  child: Center(
                    child:
                        key == 'back'
                            ? const Icon(
                              Icons.backspace_outlined,
                              color: AppColors.secondaryBlack,
                            )
                            : Text(key, style: AppTextStyle.poppinsW600(22)),
                  ),
                ),
              )
              .toList(),
    );
  }
}
