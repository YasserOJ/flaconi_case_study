import 'package:flutter/material.dart';

class OrientationLayout extends StatelessWidget {
  const OrientationLayout({
    Key? key,
    required this.portrait,
    this.landscape,
  }) : super(key: key);

  final Widget Function(BuildContext)? landscape;
  final Widget Function(BuildContext) portrait;

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      if (landscape != null) {
        return landscape!(context);
      }
    }
    return portrait(context);
  }
}
