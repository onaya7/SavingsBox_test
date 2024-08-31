import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../constants/app_color.dart';

class CustomSwitch extends StatelessWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  const CustomSwitch(
      {required this.initialValue, required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      thumb: const SizedBox(
        width: 23,
        height: 23,
        child: Center(
          child: Icon(
            Icons.circle,
            size: 19.0,
            color: AppColor.white,
          ),
        ),
      ),
      initialValue: initialValue,
      activeColor: AppColor.green700,
      inactiveColor: AppColor.grey200,
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      width: 40.0,
      height: 23.0,
      enabled: true,
      disabledOpacity: 0.5,
      onChanged: (value) => {
        onChanged(value),
      },
    );
  }
}
