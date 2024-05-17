import '../extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:june/june.dart';

import '../models/common/field.dart';
import '../utils/enums.dart';
import '../utils/methods.dart';
import '../utils/values.dart';
import '../views/widgets/common/custom_drop_down.dart';
import '../views/widgets/common/custom_text_field.dart';
import '../views/widgets/common/empty_widget.dart';

class CalculatorState extends JuneState {
  num amt = 0;
  int minAmt = 0;
  int? rate, compoundCount, years;
  List<Field> fields = <Field>[];
  List<int>? compoundCounts, yearsList;

  void onCompoundCountChanged(int? cc) {
    compoundCount = cc;
    setState();
  }

  void onYearsChanged(int? yr) {
    years = yr;
    setState();
  }

  void calculate() {
    try {
      amt = amountAfterCompoundInterest(
          prc.text.toNum(), rate!, compoundCount!, years!);
      setState();
    } catch (e) {
      e.jot();
    }
  }

  void initFields() {
    fields = List<Map<String, dynamic>>.from(
            gc?.getValue<List>('calculator_fields') ?? [])
        .map<Field>(Field.fromJson)
        .toSet()
        .toList();
  }

  Widget getFieldWidget(Field field) {
    void onRateChanged(int? rt) {
      rate = rt;
      minAmt = [1, 2, 3].contains(rate)
          ? 10000
          : ([4, 5, 6, 7].contains(rate)
              ? 50000
              : ([8, 9, 10, 11, 12].contains(rate) ? 75000 : 100000));
      compoundCount = rate == 12 ? 1 : (rate == 6 ? 2 : (rate == 3 ? 4 : null));
      compoundCounts =
          rate == 12 ? [1] : (rate == 6 ? [2] : (rate == 3 ? [4] : [1, 2, 4]));
      yearsList = List<int>.generate(
          compoundCount == 1 ? 10 : (compoundCount == 2 ? 20 : 30),
          (index) => index + 1);
      setState();
    }

    int flex = 1;
    Widget child;

    switch (field.type) {
      case FieldType.text:
        child = CustomTextField(
            controller: field.label.lowerCased == 'principle' ? prc : null,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            material: InputDecoration(
                prefixText: '₹',
                labelText: field.label,
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()));
        break;
      case FieldType.dropDown:
        String suffix = '';
        switch (field.label.lowerCased) {
          case 'rate of interest':
            // flex = 2;
            suffix = ' %';
            break;
          case 'compound count':
            // flex = 2;
            suffix = ' times';
            break;
          case 'years':
            // flex = 1;
            suffix = ' years';
            break;
        }
        DropdownMenuItem<int> getDropdownItem(int val) {
          return DropdownMenuItem<int>(
              value: val, child: '$val$suffix'.textWidget());
        }
        child = CustomDropDown<int>(
            isExpanded: true,
            hint: field.label.textWidget(),
            label: field.label.textWidget(),
            onChoseOrChanged: field.label == 'Rate of interest'
                ? onRateChanged
                : (field.label == 'Compound Count'
                    ? onCompoundCountChanged
                    : onYearsChanged),
            initialValue: field.label == 'Rate of interest'
                ? rate
                : (field.label == 'Compound Count' ? compoundCount : years),
            items: (field.label == 'Compound Count'
                    ? compoundCounts
                    : (field.label == 'Years'
                        ? yearsList
                        : field.dropDownValues))
                ?.map<DropdownMenuItem<int>>(getDropdownItem)
                .toSet()
                .toList());
        break;
      default:
        child = const EmptyWidget();
    }
    return Flexible(
        flex: field.type == FieldType.dropDown ? flex : 1, child: child);
  }
}
