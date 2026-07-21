import 'package:flutter/cupertino.dart';

import '../models/models.dart';

class FinanceUserProvider extends ChangeNotifier {
  FinanceUser _user = const FinanceUser();
  bool _isLoading = false;

  bool get isLoggedIn => _user.isLoggedIn;

  FinanceUser get user => _user;

  set user(FinanceUser value) {
    _user = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login(String email, {required Function() onSuccess}) async {
    isLoading = true;
    await Future.delayed(const Duration(milliseconds: 900));
    final name = email.split('@').first;
    user = FinanceUser(
      id: 1,
      fullName: name.isEmpty ? 'Alex Morgan' : name,
      email: email,
      initials: (name.isNotEmpty ? name[0] : 'A').toUpperCase(),
    );
    isLoading = false;
    onSuccess();
  }

  void logout() {
    user = const FinanceUser();
  }
}
