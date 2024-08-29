import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:savingsbox_test/core/constants/app_color.dart';

import 'custom_button.dart';

class CustomBottomBtn extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color? containerColor;
  final Color backgroundColor;
  final bool showBorder;
  final void Function()? onPressed;
  final Color borderColor;
  final bool isLoading;
  final bool? showSecondBtn;
  final Widget secondBtn;
  final bool useVerical;
  final double borderRadius;

  const CustomBottomBtn({
    required this.text,
    required this.textColor,
    this.containerColor = AppColor.white,
    required this.backgroundColor,
    this.showBorder = false,
    this.onPressed,
    this.borderColor = AppColor.grey200,
    this.isLoading = false,
    this.showSecondBtn,
    this.secondBtn = const Gap(0),
    this.useVerical = false,
    this.borderRadius = 8,
    super.key,
  });

  // bottomNavigationBar:

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        20,
        10,
        20,
        25,
      ),
      decoration: BoxDecoration(
        color: containerColor,
        border: Border(
          top: BorderSide(
            color: (showBorder == true) ? borderColor : Colors.transparent,
            width: 1,
          ),
        ),
      ),
      child: (useVerical == true)
          ? SizedBox(
              height: 110,
              child: Column(
                children: <Widget>[
                  CustomButton(
                    text: text,
                    textColor: textColor,
                    backgroundColor: backgroundColor,
                    onPressed: onPressed,
                    isLoading: isLoading,
                    borderRadius: borderRadius,
                  ),
                  const Gap(10),
                  if (showSecondBtn == true) secondBtn,
                ],
              ),
            )
          : Row(
              children: <Widget>[
                showSecondBtn == true
                    ? Expanded(child: secondBtn)
                    : const Gap(0),
                showSecondBtn == true ? const Gap(10) : const Gap(0),
                Expanded(
                  child: CustomButton(
                    borderColor: borderColor,
                    text: text,
                    textColor: textColor,
                    backgroundColor: backgroundColor,
                    onPressed: onPressed,
                    borderRadius: borderRadius,
                    isLoading: isLoading,
                  ),
                ),
              ],
            ),
    );
  }
}
