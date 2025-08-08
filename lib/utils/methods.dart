import 'dart:async';
import 'dart:ui';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../states/common_state.dart';
import 'values.dart';

void rollbackOrientations() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void lockScreenRotation() async {
  await SystemChrome.setPreferredOrientations([
    // DeviceOrientation.landscapeRight,
    // DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
  ]);
}

void showStatusBar() async {
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
}

void hideLoader({Duration? time, LoaderType? type}) {
  void removeLoader() {
    try {
      overlayLoader(time: time, type: type).remove();
    } catch (e) {
      e.jot();
    }
  }

  time.getTimer(removeLoader).cancel();
}

void doNothing() {}

Widget appleDefaultContextBuilder(
    BuildContext context, EditableTextState editableTextState) {
  return CupertinoAdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState);
}

Widget materialDefaultContextBuilder(
    BuildContext context, EditableTextState editableTextState) {
  return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState);
}

String emptyString() => '';

CommonState obtainCommonState() => CommonState();

Widget errorBuilder(BuildContext context, Object object, StackTrace? trace) {
  object.jot();
  trace.jot();
  return Icon(Icons.error,
      size: context.height / 16, color: context.themeMaterial.secondaryHeaderColor);
}

num amountAfterCompoundInterest(
    num principal, num rateOfInterest, num compoundCount, num years) {
  return principal *
      (1 + (rateOfInterest / compoundCount))
          .toThePowerOf(compoundCount * years);
}

Widget getImageLoader(BuildContext context, Widget child, int? i, bool flag) {
  i.jot();
  flag.jot();
  return child;
}

// Widget getPlaceHolderNoImage(BuildContext context, String url) {
//   return Image.asset('${assetImagePath}noImage.png',
//       height: context.height / 12.8,
//       width: context.width / 6.4,
//       fit: BoxFit.fill);
// }

Widget getErrorWidget(BuildContext context, Object object, StackTrace? trace) {
  object.jot();
  trace.jot();
  return Text(object.string);
}

// Widget getErrorWidget(BuildContext context, String url, dynamic error) {
//   return Image.asset('${assetImagePath}noImage.png',
//       height: context.height / 12.8,
//       width: context.width / 6.4,
//       fit: BoxFit.fill);
// }

String? validateName(String? name) =>
    (name?.isEmpty ?? true) ? 'Enter a valid Name' : null;

String? validatePassword(String? password) {
  return password?.isValidPassword(minPwdLth, maxPwdLth) ?? false
      ? null
      : 'Please enter valid password';
}

String? validateEmail(String? email) {
  return email != null && email.isValidEmail
      ? null
      : 'Please enter a valid Email';
}

Future<Uint8List> getBytesFromAsset(String path,
    {int? width, int? height}) async {
  final data = await rootBundle.load(path);
  final codec = await instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width, targetHeight: height);
  final fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ImageByteFormat.png))!
      .buffer
      .asUint8List();
}
