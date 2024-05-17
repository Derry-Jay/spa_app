import 'package:flutter/material.dart';
import 'package:june/june.dart';

import '../../../extensions/extensions.dart';
import '../../../states/calculator_state.dart';
import '../../../utils/values.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/empty_widget.dart';
import '../../widgets/common/themed_app_bar.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget screenBuilder(CalculatorState cs) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              child: cs.fields.isEmpty
                  ? const EmptyWidget()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          cs.getFieldWidget(cs.fields.first),
                          Flexible(
                              child:
                                  cs.minAmt > 0 && prc.text.toInt() < cs.minAmt
                                      ? 'Amount should be >= ${cs.minAmt}'
                                          .textWidget()
                                      : const EmptyWidget())
                        ])),
          Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: cs.fields
                      .sublist(1)
                      .map<Widget>(cs.getFieldWidget)
                      .toSet()
                      .toList())),
          Flexible(
              flex: 2,
              child:
                  'Amount : ₹ ${cs.amt.approx.withInsertedCommasInWesternSystem}'
                      .textWidget(
                          style: 'Roboto'.getStyleFromFont(
                              fontSize: measurements.large,
                              fontWeight: 600.fontWeight))),
          Flexible(
              child: Center(
                  child: CustomButton(
                      type: 'raised'.buttonType,
                      onPressed: prc.text.toNum() >= cs.minAmt &&
                              !(cs.compoundCount == null ||
                                  cs.rate == null ||
                                  cs.years == null)
                          ? cs.calculate
                          : null,
                      child: 'Calculate'.textWidget()))),
          // // Container(
          //     decoration: BoxDecoration(
          //         color: ,
          //         borderRadius: BorderRadius.vertical(
          //             top: Radius.circular(context.radius / 50))),
          //     child: Row(
          //         children: [
          //           Image.asset('assets/images/milk_image.png',
          //               fit: BoxFit.fill, height: context.height / 10),
          //           const
          //         ])),
          // Container(
          //     child: Row(
          //         children: const [Text(''), Text('1500')])),
          // Container(
          //     padding: EdgeInsets.only(
          //         bottom: context.height / 80, left: context.width / 40),
          //     child:
          //         Row(children: const [Text('Days Left :'), Text('29')])),
          // Container(
          //     padding: EdgeInsets.only(left: context.width / 40),
          //     child: Row(
          //         children: const [Text('Preferred : '), Text('Morning')]))
        ],
      );
    }

    return Scaffold(
        appBar:
            ThemedAppBar(title: 'Interest and Amount Calculator'.textWidget()),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: context.width / 32),
            child: context.nonNullSize.constrainChild(
                child: JuneBuilder<CalculatorState>(() => CalculatorState(),
                    builder: screenBuilder))));
  }
}
