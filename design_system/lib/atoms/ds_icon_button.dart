import 'package:flutter/material.dart';

/// A customizable icon button widget.
class DsIconButton extends StatelessWidget {
  /// Creates a customizable icon button widget.
  const DsIconButton({
    super.key,

    /// The icon to display inside the button.
    required this.icon,

    /// The callback function triggered when the button is pressed.
    this.onPressed,
  });

  final Icon icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Widget dsIconButton = IconButton(
      onPressed: onPressed,
      icon: icon,
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      ),
    );

    return dsIconButton;
  }
}
