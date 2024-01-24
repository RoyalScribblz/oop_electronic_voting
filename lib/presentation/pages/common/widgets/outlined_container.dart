import 'package:flutter/material.dart';

class OutlinedContainer extends StatelessWidget {
  final List<Widget> children;
  final double maxWidth;
  final double borderRadius;
  final double innerPadding;

  const OutlinedContainer({
    super.key,
    required this.maxWidth,
    required this.borderRadius,
    required this.innerPadding,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Padding(
        padding: EdgeInsets.all(innerPadding),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
