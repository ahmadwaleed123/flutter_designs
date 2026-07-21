class GeneralMethods {
  static bool emailValid(String email) =>
      RegExp(r'^[\w.\-]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
}
