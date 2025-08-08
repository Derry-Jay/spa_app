

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:common_utils/common_utils.dart';
import '../css/css.dart';
import '../css/measurements.dart';
import '../css/shades.dart';
import '../states/calculator_state.dart';
import '../states/common_state.dart';
import 'methods.dart';
import 'route_generator.dart';

int page = 0;

bool hideText = true;

Map<String, dynamic> body = <String, dynamic>{};

const apiMode =
    kDebugMode ? APIMode.dev : (kProfileMode ? APIMode.test : APIMode.prod);

final css = Css(),
    st = Stopwatch(),
    // assets = Assets(),
    shades = Shades(),
    thisMoment = TimeOfDay.now(),
    sc = TextEditingController(),
    tc = TextEditingController(),
    measurements = Measurements(),
    prc = TextEditingController(),
    pwc = TextEditingController(),
    sdc = TextEditingController(),
    edc = TextEditingController(),
    rg = RouteGenerator(flag: true),
    minDesignSize = const Size(360, 800),
    cm = getState<CommonState>(CommonState()),
    clm = getState<CalculatorState>(CalculatorState()),
    minPwdLth = 'minimum_password_length'.valFromConfig<String>()?.toInt() ?? 8,
    maxPwdLth = 'maximum_password_length'.valFromConfig<String>()?.toInt() ?? 16,
    splashScreenDelay =
        'splash_screen_delay'.valFromConfig<String>()?.toInt() ?? 3,
    spaceExp = r'\s'.re(),
    insCom1 = r'/(\d)(?=(\d{3})+$)'.re(),
    insCom2 = r'/\d{1,3}(?=(\d{3})+(?!\d))/g'.re(),
    insertCommasWesternSystemExp = r'(\d{1,3})(?=(\d{3})+(?!\d))'.re(),
    pwdExp =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$'.re(),
    mailExp =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$"
            .re();
