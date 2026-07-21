import 'package:intl/intl.dart';

extension CurrencyFormatting on double {
  String get currency => NumberFormat.currency(symbol: '\$').format(this);

  String get currencyCompact =>
      NumberFormat.compactCurrency(symbol: '\$').format(this);
}

extension DateFormatting on DateTime {
  String format({String format = 'MMM dd, yyyy'}) =>
      DateFormat(format).format(this);

  String get timeAgo {
    final diff = DateTime.now().difference(this);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return format(format: 'MMM dd');
  }
}
