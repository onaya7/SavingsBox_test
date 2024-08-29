import 'package:flutter/material.dart';
import 'package:savingsbox_test/core/constants/app_color.dart';
import 'package:savingsbox_test/core/constants/app_size.dart';

class AlreadyHave extends StatelessWidget {
  final String text;
  final String authName;
  final void Function()? onPressed;
  const AlreadyHave({
    required this.text,
    required this.authName,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.screenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: AppColor.textBody,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          GestureDetector(
            onTap: onPressed,
            child: Text(
              authName,
              style: const TextStyle(
                color: AppColor.primary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                decorationColor: AppColor.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
