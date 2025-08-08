import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
class Shades {
  static final Shades _singleton = Shades._internal();

  factory Shades() => _singleton;

  Shades._internal();

  final kRed = Colors.red,
      kBlue = Colors.blue,
      kGrey = Colors.grey,
      kBlack = Colors.black,
      kWhite = Colors.white,
      kOrange = Colors.orange,
      kLightBlue = Colors.lightBlue,
      kDeepPurple = Colors.deepPurple,
      kBlueAccent = Colors.blueAccent,
      kTransparent = Colors.transparent,
      kOrangeAccent = Colors.orangeAccent,
      kLightBlueAccent = Colors.lightBlueAccent,
      kGrey1 = Shade(1, 'grey').fromConfigs,
      kGold1 = Shade(1, 'gold').fromConfigs;
}
