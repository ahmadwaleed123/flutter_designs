import 'package:flutter/cupertino.dart';

import '../constants/enums.dart';
import '../constants/theme_constants.dart';
import '../models/models.dart';

class WalletProvider extends ChangeNotifier {
  bool _isLoading = false;
  double _balance = 0;
  List<WalletCard> _cards = [];
  List<Transaction> _transactions = [];
  List<double> _weeklySpend = [];

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  double get balance => _balance;

  List<WalletCard> get cards => _cards;

  List<Transaction> get transactions => _transactions;

  List<double> get weeklySpend => _weeklySpend;

  double get totalIncome => _transactions
      .where((t) => t.type == TransactionType.credit)
      .fold(0, (sum, t) => sum + t.amount);

  double get totalExpense => _transactions
      .where((t) => t.type == TransactionType.debit)
      .fold(0, (sum, t) => sum + t.amount);

  List<Transaction> get recentTransactions => _transactions.take(5).toList();

  Future<void> fetchWallet() async {
    isLoading = true;
    await Future.delayed(const Duration(milliseconds: 900));

    _balance = 8420.55;

    _cards = const [
      WalletCard(
        id: 1,
        holderName: 'Alex Morgan',
        brand: CardBrand.visa,
        last4: '4831',
        expiry: '09/28',
        balance: 8420.55,
        gradientStart: AppColors.cardIndigoStart,
        gradientEnd: AppColors.cardIndigoEnd,
      ),
      WalletCard(
        id: 2,
        holderName: 'Alex Morgan',
        brand: CardBrand.mastercard,
        last4: '2210',
        expiry: '02/27',
        balance: 1260.00,
        gradientStart: AppColors.cardSlateStart,
        gradientEnd: AppColors.cardSlateEnd,
      ),
    ];

    final now = DateTime.now();
    _transactions = [
      Transaction(
        id: 1,
        title: 'Apple Store',
        category: TransactionCategory.shopping,
        type: TransactionType.debit,
        amount: 249.00,
        dateTime: now.subtract(const Duration(hours: 3)),
        note: 'AirPods Pro purchase',
      ),
      Transaction(
        id: 2,
        title: 'Monthly Salary',
        category: TransactionCategory.salary,
        type: TransactionType.credit,
        amount: 4200.00,
        dateTime: now.subtract(const Duration(days: 1)),
        note: 'March salary deposit',
      ),
      Transaction(
        id: 3,
        title: 'Uber Trip',
        category: TransactionCategory.transport,
        type: TransactionType.debit,
        amount: 18.40,
        dateTime: now.subtract(const Duration(days: 1, hours: 4)),
        note: 'Ride to downtown',
      ),
      Transaction(
        id: 4,
        title: 'Netflix',
        category: TransactionCategory.entertainment,
        type: TransactionType.debit,
        amount: 15.99,
        dateTime: now.subtract(const Duration(days: 2)),
        note: 'Monthly subscription',
      ),
      Transaction(
        id: 5,
        title: 'Electricity Bill',
        category: TransactionCategory.bills,
        type: TransactionType.debit,
        amount: 86.20,
        dateTime: now.subtract(const Duration(days: 3)),
        note: 'March utility bill',
      ),
      Transaction(
        id: 6,
        title: 'Sent to Sarah',
        category: TransactionCategory.transfer,
        type: TransactionType.debit,
        amount: 120.00,
        dateTime: now.subtract(const Duration(days: 3, hours: 6)),
        note: 'Dinner split',
      ),
      Transaction(
        id: 7,
        title: 'Whole Foods',
        category: TransactionCategory.food,
        type: TransactionType.debit,
        amount: 64.35,
        dateTime: now.subtract(const Duration(days: 4)),
        note: 'Weekly groceries',
      ),
      Transaction(
        id: 8,
        title: 'Freelance Payment',
        category: TransactionCategory.salary,
        type: TransactionType.credit,
        amount: 650.00,
        dateTime: now.subtract(const Duration(days: 5)),
        note: 'Design project',
      ),
    ];

    _weeklySpend = [120, 240, 90, 310, 180, 260, 140];

    isLoading = false;
  }

  Future<void> addCard(WalletCard card) async {
    isLoading = true;
    await Future.delayed(const Duration(milliseconds: 600));
    _cards = [..._cards, card];
    isLoading = false;
  }

  Future<void> sendMoney({
    required String recipient,
    required double amount,
  }) async {
    isLoading = true;
    await Future.delayed(const Duration(milliseconds: 1100));
    _balance -= amount;
    _transactions = [
      Transaction(
        id: _transactions.length + 1,
        title: 'Sent to $recipient',
        category: TransactionCategory.transfer,
        type: TransactionType.debit,
        amount: amount,
        dateTime: DateTime.now(),
      ),
      ..._transactions,
    ];
    isLoading = false;
  }
}
