import 'package:flutter/material.dart';

import '../common_screens/notifications_screen.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class Routes {
  static const String splash = '/';
  static const String gallery = '/gallery';

  static const String notifications = '/notifications';

  // Health Care design
  static const String healthcareHome = '/healthcare_home';
  static const String healthcareBookAppointment = '/healthcare_book_appointment';
  static const String healthcareSpecialistDetail = '/healthcare_specialist_detail';

  // Finly (finance) design
  static const String financeOnboarding = '/finance_onboarding';
  static const String financeLogin = '/finance_login';
  static const String financeSignup = '/finance_signup';
  static const String financeHome = '/finance_home';
  static const String financeTransactionDetail = '/finance_transaction_detail';
  static const String financeSendMoneyRecipient = '/finance_send_money_recipient';
  static const String financeSendMoneyAmount = '/finance_send_money_amount';
  static const String financeSendMoneyReview = '/finance_send_money_review';
  static const String financeSendMoneySuccess = '/finance_send_money_success';
  static const String financeAddCard = '/finance_add_card';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget widget;
    switch (settings.name) {
      case Routes.splash:
        widget = const SplashScreen();
        break;
      case Routes.gallery:
        widget = const DesignGalleryScreen();
        break;
      case Routes.notifications:
        widget = const NotificationsScreen();
        break;

      // Health Care design
      case Routes.healthcareHome:
        widget = const HealthcareHomeScreen();
        break;
      case Routes.healthcareBookAppointment:
        widget = const BookAppointmentScreen();
        break;
      case Routes.healthcareSpecialistDetail:
        widget = SpecialistDetailScreen(
          specialist: settings.arguments as Specialist,
        );
        break;

      // Finly (finance) design
      case Routes.financeOnboarding:
        widget = const FinanceOnboardingScreen();
        break;
      case Routes.financeLogin:
        widget = const FinanceLoginScreen();
        break;
      case Routes.financeSignup:
        widget = const FinanceSignupScreen();
        break;
      case Routes.financeHome:
        widget = const FinanceBottomNavigationScreen();
        break;
      case Routes.financeTransactionDetail:
        widget = FinanceTransactionDetailScreen(
          transaction: settings.arguments as Transaction,
        );
        break;
      case Routes.financeSendMoneyRecipient:
        widget = const FinanceSendMoneyRecipientScreen();
        break;
      case Routes.financeSendMoneyAmount:
        widget = FinanceSendMoneyAmountScreen(
          recipient: settings.arguments as String,
        );
        break;
      case Routes.financeSendMoneyReview:
        final args = settings.arguments as Map<String, dynamic>;
        widget = FinanceSendMoneyReviewScreen(
          recipient: args['recipient'] as String,
          amount: args['amount'] as double,
        );
        break;
      case Routes.financeSendMoneySuccess:
        final args = settings.arguments as Map<String, dynamic>;
        widget = FinanceSendMoneySuccessScreen(
          recipient: args['recipient'] as String,
          amount: args['amount'] as double,
        );
        break;
      case Routes.financeAddCard:
        widget = const FinanceAddCardScreen();
        break;

      default:
        widget = const SplashScreen();
    }
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
