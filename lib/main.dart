import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehat_doctor/src/ui/auth/login/login_screen.dart';
import 'package:sehat_doctor/src/ui/main/home/home_page.dart';
import 'package:sehat_doctor/src/ui/main/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// FULL SCREEN (optional)
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge, // 🔥 immersive o‘rniga shuni tavsiya qilaman
  );

  /// SYSTEM BAR STYLE
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
      ],
      path: 'assets/translation',
      startLocale: Locale('en'),
      fallbackLocale: const Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 833),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            builder: (context, child) {
              final mediaQuery = MediaQuery.of(context);
              return MediaQuery(
                data: mediaQuery.copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            },
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: MainScreen(),
          );
        }
    );
  }
}

