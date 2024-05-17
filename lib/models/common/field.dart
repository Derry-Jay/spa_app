import 'dart:convert';

import 'package:compound_interest_calculator/extensions/extensions.dart';

import '../../utils/enums.dart';

class Field {
  int slNo = 0;
  FieldType? type;
  String label = '';
  bool isFormField = false;
  List<int>? dropDownValues;

  Field();

  Field.fromJson(Map<String, Object?> json) {
    slNo = json['sl_no'].string.toInt();
    label = json['label'].string;
    type = json['type'].string.ft;
    isFormField = json['form_field'].string.toBool();
    try {
      dropDownValues = List<int>.from((json['drop_down_values'] as Iterable?)!);
    } catch (e) {
      e.jot();
      dropDownValues = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sl_no'] = slNo;
    data['label'] = label;
    data['type'] = type?.name;
    data['form_field'] = isFormField;
    data['drop_down_values'] = dropDownValues;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return jsonEncode(toJson());
  }
}
