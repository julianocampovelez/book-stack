import 'package:flutter/material.dart';

import 'package:design_system/foundations/colors.dart';

/// A circular progress indicator widget.
class DsCircularProgress extends StatelessWidget {
  const DsCircularProgress({
    super.key,

    /// The width of the circular progress indicator's stroke.
    this.strokeWidth = 2.0,
  });

  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    Widget dsCircularProgress = CircularProgressIndicator(
      strokeWidth: strokeWidth,
      color: DsColorsFoundations.primaryColor,
    );

    return dsCircularProgress;
  }
}
