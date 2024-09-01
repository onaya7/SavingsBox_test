import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/app_color.dart';
import '../constants/app_size.dart';

class CustomEmptyItemState extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomEmptyItemState({
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.screenHeight(context) * 0.5,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.hourglass_empty,
            size: 70,
            color: AppColor.grey300,
          ),
          const Gap(10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColor.textHeader,
            ),
          ),
          const Gap(10),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColor.textBody,
            ),
          ),
        ],
      )),
    );
  }
}
