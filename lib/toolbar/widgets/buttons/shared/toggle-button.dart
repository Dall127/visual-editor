import 'package:flutter/material.dart';

import '../../../../shared/models/editor-icon-theme.model.dart';
import '../../toolbar.dart';

class ToggleButton extends StatelessWidget {
  final BuildContext context;
  final IconData icon;
  final double buttonsSpacing;
  final Color? fillColor;
  final bool? isToggled;
  final VoidCallback? onPressed;
  final double iconSize;
  final EditorIconThemeM? iconTheme;

  ToggleButton({
    required this.context,
    required this.icon,
    required this.buttonsSpacing,
    this.fillColor,
    this.isToggled,
    this.onPressed,
    this.iconSize = defaultIconSize,
    this.iconTheme,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    bool isDarkMode = _theme.brightness == Brightness.dark;

    final isEnabled = onPressed != null;
    final iconColor = isEnabled
        ? _getToggleColor(isDarkMode, _theme)
        : _getDisableToggleColor(isDarkMode, _theme);
    final fill = isEnabled
        ? _getFillColor(isDarkMode, _theme)
        : _getDisabledFillColor(_theme);

    return IconBtn(
      highlightElevation: 0,
      hoverElevation: 0,
      buttonsSpacing: buttonsSpacing,
      size: iconSize * iconButtonFactor,
      icon: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
      fillColor: fill,
      onPressed: onPressed,
      borderRadius: iconTheme?.borderRadius ?? 2,
    );
  }

  // === UTILS ===

  Color? _getToggleColor(bool isDarkMode, ThemeData theme) {
    if (isToggled == true) {
      return iconTheme?.iconSelectedColor ??
          (isDarkMode
              ? theme.colorScheme.onPrimary
              : theme.colorScheme.onSurface);
    } else {
      return iconTheme?.iconUnselectedColor ??
          (isDarkMode
              ? theme.colorScheme.onSurface.withAlpha(150)
              : theme.colorScheme.onSurface);
    }
  }

  Color _getDisableToggleColor(bool isDarkMode, ThemeData theme) {
    return iconTheme?.disabledIconColor ?? theme.disabledColor;
  }

  Color _getFillColor(bool isDarkMode, ThemeData theme) {
    if (isToggled == true) {
      return iconTheme?.iconSelectedFillColor ??
          (isDarkMode ? theme.primaryColorDark : theme.primaryColor);
    } else {
      return iconTheme?.iconUnselectedFillColor ??
          (isDarkMode ? theme.canvasColor : theme.colorScheme.background);
    }
  }

  Color _getDisabledFillColor(ThemeData theme) {
    return iconTheme?.disabledIconFillColor ?? theme.canvasColor;
  }
}
