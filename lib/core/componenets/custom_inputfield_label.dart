import 'package:flutter/material.dart';
import '../constants/app_color.dart';

class CustomInputFieldLabel extends StatelessWidget {
  final String? label;
  final String? content;
  final Color? contentColor;
  final bool makeRequired;
  const CustomInputFieldLabel({
    this.label,
    this.content,
    this.contentColor,
    this.makeRequired = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text.rich(
          TextSpan(
            text: label,
            style: const TextStyle(
              fontSize: 14,
              color: AppColor.textBody,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.30,
              height: 0,
            ),
            children: <TextSpan>[
              (makeRequired == false)
                  ? const TextSpan(
                      text: '',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.textBody,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.30,
                        height: 0,
                      ),
                    )
                  : const TextSpan(
                      text: '  *',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.red600,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.30,
                        height: 0,
                      ),
                    ),
            ],
          ),

          // (label != null) ? label.toString() : '',
          // style: const TextStyle(
          //   fontSize: 14,
          //   color: AppColor.textBody,
          //   fontWeight: FontWeight.w400,
          //   letterSpacing: -0.30,
          //   height: 0,
          // ),
        ),
        Text(
          (content != null) ? content.toString() : '',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: contentColor ?? AppColor.green600,
            letterSpacing: -0.30,
            height: 0,
          ),
        ),
      ],
    );
  }
}
