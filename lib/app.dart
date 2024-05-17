import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils/keys.dart';
import 'utils/values.dart';
import 'views/screens/common/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget appBuilder(BuildContext context, Widget? child) {
    return MaterialApp(
        home: child,
        title: acf.name,
        theme: css.theme,
        navigatorKey: navKey,
        onGenerateRoute: rg.generateRoute,
        debugShowCheckedModeBanner: kDebugMode);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        builder: appBuilder,
        designSize: minDesignSize,
        child: const SplashScreen());
  }
}
