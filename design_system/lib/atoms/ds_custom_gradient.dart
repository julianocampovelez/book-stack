import 'package:flutter/material.dart';

class DsCustomGradient extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const DsCustomGradient({
    super.key,
    required this.colors,
    required this.stops,
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerLeft,
  }) : assert(
         colors.length == stops.length,
         "Length of the colors and the stops must be equal",
       );

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            stops: stops,
            colors: colors,
          ),
        ),
      ),
    );
  }
}
