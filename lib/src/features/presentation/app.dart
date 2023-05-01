import 'package:michis/src/core/settings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:michis/src/features/presentation/views/splash_view.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 780),
      builder: (context, _) {
        return GetMaterialApp(
          initialRoute: SplashView.routeName,
          theme: ThemeData(
            fontFamily: 'Rubik',
            scaffoldBackgroundColor: AppColors.pBackground,
            primaryColor: Colors.green,
            appBarTheme: AppBarTheme(
              color: AppColors.pBackground,
              elevation: 1,
              iconTheme: IconThemeData(
                color: AppColors.pText
              )
            )
          ),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: const [Locale('es', 'ES'), Locale('en', 'EN')],
          navigatorKey: Get.key,
          getPages: [
            GetPage(name: SplashView.routeName, page: () => SplashView())
          ]
        );
      }
    );
  }
}
