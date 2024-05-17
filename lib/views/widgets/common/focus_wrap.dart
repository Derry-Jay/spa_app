import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FocusWrap extends StatefulWidget {
  final Widget child;
  final FocusNode focusNode;
  final Function onNext, onPrevious;

  const FocusWrap(
      {super.key,
      required this.child,
      required this.onNext,
      required this.focusNode,
      required this.onPrevious});

  @override
  FocusWrapState createState() => FocusWrapState();
}

class FocusWrapState extends State<FocusWrap> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_handleFocusChanged);
  }

  @override
  void didUpdateWidget(FocusWrap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      oldWidget.focusNode.removeListener(_handleFocusChanged);
      widget.focusNode.addListener(_handleFocusChanged);
    }
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_handleFocusChanged);
    _detachKeyboardIfAttached();
    super.dispose();
  }

  void _handleFocusChanged() {
    widget.focusNode.hasFocus
        ? _attachKeyboardIfDetached()
        : _detachKeyboardIfAttached();
  }

  bool _listening = false;

  void _attachKeyboardIfDetached() {
    if (_listening) return;
    HardwareKeyboard.instance.addHandler(_handleRawKeyEvent);
    _listening = true;
  }

  void _detachKeyboardIfAttached() {
    if (!_listening) return;
    HardwareKeyboard.instance.addHandler(_handleRawKeyEvent);
    _listening = false;
  }

  bool _handleRawKeyEvent(KeyEvent event) {
    switch (event.logicalKey) {
      case LogicalKeyboardKey.keyQ:
      case LogicalKeyboardKey.backspace:
        widget.onNext();
        return true;
      case LogicalKeyboardKey.tab:
      case LogicalKeyboardKey.space:
        widget.onPrevious();
        return true;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
