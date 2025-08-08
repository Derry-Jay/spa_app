import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
import 'package:june/june.dart';

import '../utils/enums.dart';

extension Utils on String {
  FieldType? get ft {
    switch (trimmed.lowerCased) {
      case 'checkbox':
      case 'check_box':
        return FieldType.checkBox;
      case 'dropdown':
      case 'drop_down':
        return FieldType.dropDown;
      case 'radio':
      case 'radiobutton':
      case 'radio_button':
        return FieldType.radio;
      case 'textfield':
      case 'text_field':
        return FieldType.text;
      default:
        return null;
    }
  }
}

extension Hp<T extends BuildContext> on T {}

extension Zxcvb<T extends JuneState> on T Function() {
  T state({String? tag, bool? permanent}) =>
      June.getState<T>(this, tag: tag, permanent: permanent ?? true);

  JuneBuilder<T> builderJune(Widget Function(T) builder) =>
      JuneBuilder<T>(this, builder: builder);
}
