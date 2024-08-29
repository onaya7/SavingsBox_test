import 'package:flutter/material.dart';

class CustomRipple extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final double borderRadius;
  final Color color;
  const CustomRipple(
      {required this.child,
      required this.onTap,
      this.borderRadius = 2,
      this.color = Colors.white,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
          onTap: onTap,
          splashColor: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(borderRadius),
          child: child),
    );
  }
}