class FinanceUser {
  final int id;
  final String fullName;
  final String email;
  final String initials;

  const FinanceUser({
    this.id = -1,
    this.fullName = '',
    this.email = '',
    this.initials = '',
  });

  bool get isLoggedIn => id > -1;
}
