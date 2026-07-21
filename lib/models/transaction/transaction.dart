import '../../constants/enums.dart';

class Transaction {
  final int id;
  final String title;
  final TransactionCategory category;
  final TransactionType type;
  final double amount;
  final DateTime dateTime;
  final String note;

  const Transaction({
    required this.id,
    required this.title,
    required this.category,
    required this.type,
    required this.amount,
    required this.dateTime,
    this.note = '',
  });
}
