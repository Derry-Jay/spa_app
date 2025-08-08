import 'package:common_utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Measurements {
  static final Measurements _singleton = Measurements._internal();

  factory Measurements() {
    return _singleton;
  }

  Measurements._internal();

  final xs = 'xs'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      xl = 'xl'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      xs2 = '2xs'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      xs3 = '3xs'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      xs4 = '4xs'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      xl2 = '2xl'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      xl3 = '3xl'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      xl4 = '4xl'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      small = 'small'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      large = 'large'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      medium = 'medium'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      normal = 'normal'.valFromConfig<String>()?.toInt().sp ?? double.nan,
      defaultGradientIconSize =
          ((('4xl'.valFromConfig<String>()?.toInt() ?? 0) +
                      ('3xl'.valFromConfig<String>()?.toInt() ?? 0) +
                      ('3xs'.valFromConfig<String>()?.toInt() ?? 0)) /
                  2)
              .sp;
}
