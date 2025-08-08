import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/keys.dart';

class ThemedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Color? shadowColor, surfaceTintColor;
  final Widget? title, leading, flexibleSpace;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final IconThemeData? iconTheme, actionsIconTheme;
  final TextStyle? toolbarTextStyle, titleTextStyle;
  final bool Function(ScrollNotification)? notificationPredicate;
  final bool? primary,
      centerTitle,
      excludeHeaderSemantics,
      automaticallyImplyLeading,
      forceMaterialTransparency;
  final double? elevation,
      titleSpacing,
      leadingWidth,
      bottomOpacity,
      toolbarHeight,
      toolbarOpacity,
      scrolledUnderElevation;
  const ThemedAppBar({super.key,
      this.title,
      this.shape,
      this.bottom,
      this.actions,
      this.leading,
      this.primary,
      this.elevation,
      this.iconTheme,
      this.shadowColor,
      this.clipBehavior,
      this.centerTitle,
      this.titleSpacing,
      this.leadingWidth,
      this.flexibleSpace,
      this.bottomOpacity,
      this.toolbarHeight,
      this.toolbarOpacity,
      this.titleTextStyle,
      this.surfaceTintColor,
      this.actionsIconTheme,
      this.toolbarTextStyle,
      this.systemOverlayStyle,
      this.notificationPredicate,
      this.excludeHeaderSemantics,
      this.scrolledUnderElevation,
      this.forceMaterialTransparency,
      this.automaticallyImplyLeading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: title,
        shape: shape,
        bottom: bottom,
        actions: actions,
        leading: leading,
        iconTheme: iconTheme,
        elevation: elevation,
        shadowColor: shadowColor,
        centerTitle: centerTitle,
        primary: primary ?? true,
        clipBehavior: clipBehavior,
        titleSpacing: titleSpacing,
        leadingWidth: leadingWidth,
        flexibleSpace: flexibleSpace,
        toolbarHeight: toolbarHeight,
        surfaceTintColor: surfaceTintColor,
        actionsIconTheme: actionsIconTheme,
        bottomOpacity: bottomOpacity ?? 1.0,
        toolbarOpacity: toolbarOpacity ?? 1.0,
        systemOverlayStyle: systemOverlayStyle,
        backgroundColor: context.themeMaterial.primaryColor,
        scrolledUnderElevation: scrolledUnderElevation,
        foregroundColor: context.themeMaterial.secondaryHeaderColor,
        excludeHeaderSemantics: excludeHeaderSemantics ?? false,
        automaticallyImplyLeading: automaticallyImplyLeading ?? true,
        forceMaterialTransparency: forceMaterialTransparency ?? false,
        notificationPredicate:
            notificationPredicate ?? defaultScrollNotificationPredicate);
  }

  BuildContext? get bc =>
      navKey.currentContext ??
      (wb?.buildOwner?.focusManager.rootScope.context ?? wb?.rootElement);

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      ((bc?.height ?? (16 * kToolbarHeight)) / 16).sizeFromHeight;
}
