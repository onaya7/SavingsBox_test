import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const CustomRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      displacement: 30.0,
      backgroundColor: AppColor.white,
      color: AppColor.primary,
      onRefresh: onRefresh,
      child: child,
    );
  }
}