import 'dart:async';

import 'package:flutter/material.dart';
import 'package:june/june.dart';

import 'package:common_utils/common_utils.dart';
import '../utils/keys.dart';

class CommonState extends JuneState with AnimationLocalStatusListenersMixin {
  static final CommonState _singleton = CommonState._internal();

  factory CommonState() {
    return _singleton;
  }

  CommonState._internal();

  bool? flag;

  int count = 0;

  Animation<double>? animation;

  AnimationController? animationController;

  Stream<Progress> get progress => _progressCon.stream;

  final _progressCon = StreamController<Progress>.broadcast();

  BuildContext? get bc =>
      navKey.currentContext ?? wb?.buildOwner?.focusManager.rootScope.context;

  void addProgress(Progress p) {
    _progressCon.add(p);
  }

  void onProgress(int a, int b) async {
    ssc ??= progress.listen(onProgressData);
    'a: $a / b: $b'.jot();
    addProgress(Progress(a / b, '${((a * 100) / b).toStringAsFixed(2)}%'));
    if (a == b) {
      await ssc?.cancel();
      ssc = null;
    }
  }

  void onProgressData(Progress event) {
    event.jot();
  }

  void increment() {
    count++;
    setState();
  }

  void decrement() {
    count--;
    setState();
  }

  void nextScreen() {
    void gotoNextScreen(Duration timeStamp) async {
      await Future.delayed(
          timeStamp.inSeconds == 3 ? timeStamp : const Duration(seconds: 3),
          firstScreen);
    }

    wb?.addPostFrameCallback(gotoNextScreen);
  }

  void detectChange(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.completed:
      case AnimationStatus.dismissed:
        animationController?.dispose();
        break;
      default:
        doNothing();
        break;
    }
  }

  void goFrontIfMounted([double? from]) async {
    await animationController?.forward(from: from);
    // animationController?.notifyListeners();
    animationController?.notifyStatusListeners(AnimationStatus.forward);
  }

  void assignState(TickerProvider tp) {
    void setData(Duration duration) {
      animationController = AnimationController(duration: duration, vsync: tp);
      animation = Tween<double>(begin: bc?.pixelRatio, end: 0).animate(
          CurvedAnimation(parent: animationController!, curve: Curves.easeOut))
        ..addListener(goFrontIfMounted)
        ..addStatusListener(detectChange);
    }

    wb?.addPostFrameCallback(setData);
  }

  void loaderDispose() {
    animationController?.dispose();
  }

  FutureOr firstScreen() {
    bc?.gotoForever('/calculator');
  }

  @override
  void didRegisterListener() {
    // TODO: implement didRegisterListener
    'object'.jot();
  }

  @override
  void didUnregisterListener() {
    // TODO: implement didUnregisterListener
    'object2'.jot();
  }
}
