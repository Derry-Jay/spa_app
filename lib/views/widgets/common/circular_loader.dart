import 'package:common_utils/common_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../utils/values.dart';

class CircularLoader extends StatefulWidget {
  final int? count;
  final BoxShape? shape;
  final StrokeCap? strokeCap;
  final LoaderType? loaderType;
  final SpinKitWaveType? type2;
  final Duration? duration, delay;
  final SpinKitPianoWaveType? type1;
  final Color? color, trackColor, waveColor;
  final Widget Function(BuildContext, int)? itemBuilder;
  final double? heightFactor, widthFactor, breadth, altitude, value;
  const CircularLoader({
    super.key,
    this.shape,
    this.value,
    this.type1,
    this.type2,
    this.color,
    this.count,
    this.delay,
    this.breadth,
    this.duration,
    this.altitude,
    this.strokeCap,
    this.waveColor,
    this.loaderType,
    this.trackColor,
    this.widthFactor,
    this.itemBuilder,
    this.heightFactor,
  });

  @override
  CircularLoaderState createState() => CircularLoaderState();
}

class CircularLoaderState extends State<CircularLoader>
    with SingleTickerProviderStateMixin {
  Widget _loaderBuilder(
    BuildContext context,
    AsyncSnapshot<Progress> benchMark,
  ) {
    Color b, c;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        b = context.themeApple.scaffoldBackgroundColor;
        c = widget.color ?? context.themeApple.primaryColor;
        break;
      default:
        b = context.themeMaterial.scaffoldBackgroundColor;
        c = widget.color ?? context.themeMaterial.primaryColor;
        break;
    }
    return CircularProgressIndicator.adaptive(
      backgroundColor: b,
      strokeCap: widget.strokeCap,
      strokeWidth: widget.breadth ?? 4.0,
      valueColor: c.animationAlwaysStopped,
      semanticsLabel: benchMark.data?.label,
      semanticsValue: benchMark.data?.label,
      value: benchMark.data?.value.toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // '---------------'.jot();
    // jot(cm.animation);
    // jot('_______________');
    // final val = cm.animation?.value ?? 100.0;
    // final opacity = val > 100.0 ? 1.0 : val / 100;
    Color b, c;
    Widget lc;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        b = context.themeApple.scaffoldBackgroundColor;
        c = widget.color ?? context.themeApple.primaryColor;
        break;
      default:
        b = context.themeMaterial.scaffoldBackgroundColor;
        c = widget.color ?? context.themeMaterial.primaryColor;
        break;
    }
    switch (widget.loaderType) {
      case LoaderType.normal:
        lc = StreamBuilder<Progress>(
          stream: cm.progress,
          builder: _loaderBuilder,
        );
        break;
      case null:
        lc = CircularProgressIndicator.adaptive(
          backgroundColor: b,
          strokeCap: widget.strokeCap,
          strokeWidth: widget.breadth ?? 4.0,
          valueColor: c.animationAlwaysStopped,
        );
        break;
      default:
        lc = RoundLoader(
          shape: widget.shape,
          loaderType: widget.loaderType,
          heightFactor: widget.heightFactor,
        );
    }
    return Center(
      widthFactor: widget.widthFactor,
      heightFactor: widget.heightFactor,
      child: lc,
    );
  }

  @override
  void initState() {
    super.initState();
    cm.assignState(this);
  }
}
