import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/app_text_field.dart';
import '../../../common_widgets/credit_card_widget.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../common_widgets/round_action_button.dart';
import '../../../constants/enums.dart';
import '../../../constants/theme_constants.dart';
import '../../../models/models.dart';
import '../../../providers/providers.dart';

class FinanceAddCardScreen extends StatefulWidget {
  const FinanceAddCardScreen({super.key});

  @override
  State<FinanceAddCardScreen> createState() => _FinanceAddCardScreenState();
}

class _FinanceAddCardScreenState extends State<FinanceAddCardScreen> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (final c in [nameController, numberController, expiryController, cvvController]) {
      c.addListener(() => setState(() {}));
    }
  }

  CardBrand get _brand =>
      numberController.text.startsWith('5') ? CardBrand.mastercard : CardBrand.visa;

  String get _last4 {
    final digits = numberController.text.replaceAll(RegExp(r'\D'), '');
    return digits.length >= 4 ? digits.substring(digits.length - 4) : '••••';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: const CustomAppbar(title: 'Add New Card'),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: AppSpacing.pageSpacingSmall,
          child: Column(
            spacing: 24.spMin,
            children: [
              CreditCardWidget(
                card: WalletCard(
                  id: 0,
                  holderName: nameController.text.isEmpty ? 'Your Name' : nameController.text,
                  brand: _brand,
                  last4: _last4,
                  expiry: expiryController.text.isEmpty ? 'MM/YY' : expiryController.text,
                  balance: 0,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 16.spMin,
                    children: [
                      AppTextField(
                        label: 'Card Holder Name',
                        hintText: 'Alex Morgan',
                        controller: nameController,
                      ),
                      AppTextField(
                        label: 'Card Number',
                        hintText: '1234 5678 9012 3456',
                        controller: numberController,
                        inputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                        ],
                      ),
                      Row(
                        spacing: 16.spMin,
                        children: [
                          Expanded(
                            child: AppTextField(
                              label: 'Expiry',
                              hintText: 'MM/YY',
                              controller: expiryController,
                            ),
                          ),
                          Expanded(
                            child: AppTextField(
                              label: 'CVV',
                              hintText: '123',
                              controller: cvvController,
                              obscureText: true,
                              inputType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Consumer<WalletProvider>(
                builder:
                    (context, provider, _) => RoundActionButton(
                      text: 'Add Card',
                      isLoading: provider.isLoading,
                      action: () async {
                        await provider.addCard(
                          WalletCard(
                            id: provider.cards.length + 1,
                            holderName:
                                nameController.text.isEmpty
                                    ? 'Alex Morgan'
                                    : nameController.text,
                            brand: _brand,
                            last4: _last4,
                            expiry:
                                expiryController.text.isEmpty
                                    ? '00/00'
                                    : expiryController.text,
                            balance: 0,
                          ),
                        );
                        if (!context.mounted) return;
                        Navigator.pop(context);
                      },
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
