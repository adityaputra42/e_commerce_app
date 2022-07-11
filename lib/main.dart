import 'package:e_commerce_app/theme/theme.dart';
import 'package:e_commerce_app/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void dispose() {
  //   _themeManager.removeListener(themeListener);
  //   super.dispose();
  // }

  // @override
  // void initState() {
  //   _themeManager.addListener(themeListener);
  //   super.initState();
  // }

  // themeListener() {
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: _themeManager.themeMode,
          debugShowCheckedModeBanner: false,
          home: const SplashPage(),
          // routes: {
          //   '/': (context) => const SplashPage(),
          //   '/sign-in': (context) => SignInPage(),
          //   '/sign-up': (context) => SignUpPage(),
          //   '/main': (context) => const MainPage(),
          // },
        );
      },
    );
  }
}
