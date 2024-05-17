import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../../utils/values.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenstate();
}

class SplashScreenstate extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cm.nextScreen();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    clm.initFields();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build const
    return Scaffold(body: Center(child: acf.name.textWidget()));
  }
}
