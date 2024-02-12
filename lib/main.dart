import 'package:bloc_task/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xffFCFCFC),
            useMaterial3: true,
            textSelectionTheme: TextSelectionThemeData(
              selectionHandleColor: Colors.transparent,
              selectionColor: Colors.grey.withOpacity(0.5),
            ),
          ),
        );
      },
    );
  }
}
