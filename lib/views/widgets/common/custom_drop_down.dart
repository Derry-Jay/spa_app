import 'package:flutter/material.dart';

import '../../../utils/values.dart';

class CustomDropDown<T> extends StatelessWidget {
  final int? elevation;
  final T? initialValue;
  final TextStyle? style;
  final VoidCallback? onTap;
  final MenuStyle? menuStyle;
  final FocusNode? focusNode;
  final BorderRadius? borderRadius;
  final InputDecoration? decoration;
  final AlignmentGeometry? alignment;
  final String? Function(T?)? validator;
  final List<DropdownMenuItem<T>>? items;
  final TextEditingController? controller;
  final SearchCallback<T>? searchCallback;
  final EdgeInsets? expandedInsets, padding;
  final AutovalidateMode? autovalidateMode;
  final String? hintText, errorText, helperText;
  final ValueChanged<T?>? onChoseOrChanged, onSaved;
  final InputDecorationTheme? inputDecorationTheme;
  final double? width, iconSize, itemHeight, menuHeight;
  final List<DropdownMenuEntry<T>>? dropdownMenuEntries;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final Color? focusColor, dropdownColor, iconEnabledColor, iconDisabledColor;
  final Widget? hint,
      icon,
      label,
      underline,
      leadingIcon,
      disabledHint,
      trailingIcon,
      selectedTrailingIcon;
  final bool? enabled,
      isMenu,
      isDense,
      autoFocus,
      isExpanded,
      isFormField,
      enableFilter,
      enableSearch,
      hideUnderLine,
      enableFeedback,
      requestFocusOnTap;
  const CustomDropDown(
      {super.key,
      this.hint,
      this.icon,
      this.label,
      this.style,
      this.onTap,
      this.items,
      this.width,
      this.isMenu,
      this.isDense,
      this.enabled,
      this.onSaved,
      this.padding,
      this.hintText,
      this.iconSize,
      this.alignment,
      this.autoFocus,
      this.elevation,
      this.errorText,
      this.focusNode,
      this.menuStyle,
      this.underline,
      this.validator,
      this.controller,
      this.decoration,
      this.focusColor,
      this.helperText,
      this.itemHeight,
      this.menuHeight,
      this.isExpanded,
      this.isFormField,
      this.leadingIcon,
      this.disabledHint,
      this.trailingIcon,
      this.borderRadius,
      this.enableFilter,
      this.enableSearch,
      this.initialValue,
      this.dropdownColor,
      this.hideUnderLine,
      this.searchCallback,
      this.expandedInsets,
      this.enableFeedback,
      this.autovalidateMode,
      this.onChoseOrChanged,
      this.iconEnabledColor,
      this.iconDisabledColor,
      this.requestFocusOnTap,
      this.dropdownMenuEntries,
      this.selectedItemBuilder,
      this.selectedTrailingIcon,
      this.inputDecorationTheme});

  @override
  Widget build(BuildContext context) {
    final im = isMenu ?? false,
        isFF = isFormField ?? false,
        hud = hideUnderLine ?? false,
        dd = im
            ? DropdownMenu<T>(
                label: label,
                width: width,
                textStyle: style,
                hintText: hintText,
                errorText: errorText,
                menuStyle: menuStyle,
                menuHeight: menuHeight,
                controller: controller,
                helperText: helperText,
                enabled: enabled ?? true,
                leadingIcon: leadingIcon,
                trailingIcon: trailingIcon,
                onSelected: onChoseOrChanged,
                searchCallback: searchCallback,
                expandedInsets: expandedInsets,
                initialSelection: initialValue,
                enableSearch: enableSearch ?? true,
                enableFilter: enableFilter ?? false,
                requestFocusOnTap: requestFocusOnTap,
                selectedTrailingIcon: selectedTrailingIcon,
                inputDecorationTheme: inputDecorationTheme,
                dropdownMenuEntries:
                    dropdownMenuEntries ?? <DropdownMenuEntry<T>>[])
            : (isFF
                ? DropdownButtonFormField<T>(
                    icon: icon,
                    hint: hint,
                    onTap: onTap,
                    items: items,
                    style: style,
                    onSaved: onSaved,
                    padding: padding,
                    value: initialValue,
                    focusNode: focusNode,
                    validator: validator,
                    decoration: decoration,
                    itemHeight: itemHeight,
                    focusColor: focusColor,
                    isDense: isDense ?? true,
                    elevation: elevation ?? 8,
                    menuMaxHeight: menuHeight,
                    borderRadius: borderRadius,
                    disabledHint: disabledHint,
                    onChanged: onChoseOrChanged,
                    dropdownColor: dropdownColor,
                    autofocus: autoFocus ?? false,
                    enableFeedback: enableFeedback,
                    isExpanded: isExpanded ?? false,
                    autovalidateMode: autovalidateMode,
                    iconEnabledColor: iconEnabledColor,
                    iconDisabledColor: iconDisabledColor,
                    iconSize: iconSize ?? measurements.xl4,
                    selectedItemBuilder: selectedItemBuilder,
                    alignment: alignment ?? AlignmentDirectional.centerStart)
                : DropdownButton<T>(
                    icon: icon,
                    hint: hint,
                    items: items,
                    style: style,
                    onTap: onTap,
                    padding: padding,
                    value: initialValue,
                    underline: underline,
                    focusNode: focusNode,
                    itemHeight: itemHeight,
                    focusColor: focusColor,
                    elevation: elevation ?? 8,
                    isDense: isDense ?? false,
                    menuMaxHeight: menuHeight,
                    borderRadius: borderRadius,
                    onChanged: onChoseOrChanged,
                    dropdownColor: dropdownColor,
                    autofocus: autoFocus ?? false,
                    enableFeedback: enableFeedback,
                    isExpanded: isExpanded ?? false,
                    iconEnabledColor: iconEnabledColor,
                    iconDisabledColor: iconDisabledColor,
                    iconSize: iconSize ?? measurements.xl4,
                    selectedItemBuilder: selectedItemBuilder,
                    alignment: alignment ?? AlignmentDirectional.centerStart));
    return hud ? DropdownButtonHideUnderline(child: dd) : dd;
  }
}
