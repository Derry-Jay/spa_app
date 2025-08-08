import 'package:common_utils/common_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spa_app/utils/values.dart';

import 'utils/keys.dart';
import 'views/screens/common/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget appBuilder(BuildContext context, Widget? child) {
    context.initScreenUtil(designSize: minDesignSize, minTextAdapt: true);
    return MaterialApp(
      home: child,
      theme: css.theme,
      title: acf.appName,
      navigatorKey: navKey,
      onGenerateRoute: rg.generateRoute,
      debugShowCheckedModeBanner: kDebugMode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return adaptiveScreen(
      minTextAdapt: true,
      builder: appBuilder,
      lowestSize: minDesignSize,
      child: const SplashScreen(),
    );
  }
}
