import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'constants/data_constants.dart';
import 'constants/theme_constants.dart';
import 'providers/providers.dart';
import 'utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => SpecialistProvider()),
            ChangeNotifierProvider(create: (_) => FinanceUserProvider()),
            ChangeNotifierProvider(create: (_) => WalletProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            title: Constants.appName,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                centerTitle: false,
                surfaceTintColor: Colors.transparent,
                backgroundColor: AppColors.primaryWhite,
                elevation: 0,
                shadowColor: Colors.transparent,
              ),
              scaffoldBackgroundColor: AppColors.primaryWhite,
              canvasColor: AppColors.primaryWhite,
              primaryColor: AppColors.primaryBrand,
              useMaterial3: true,
            ),
            onGenerateRoute: RouteGenerator.generateRoute,
          ),
        );
      },
    );
  }
}
