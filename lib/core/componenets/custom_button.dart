import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:savingsbox_test/core/constants/app_color.dart';
import 'package:savingsbox_test/core/constants/app_size.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final FontWeight? textFontWeight;
  final String? iconPath;
  final double? iconWidth;
  final Color iconColor;
  final double? iconHeight;
  final bool hasSuffixIcon;
  final bool hasLeadingIcon;
  final Color backgroundColor;
  final bool useLeadingImage;
  final Color? borderColor;
  final double borderRadius;
  final double height;
  final void Function()? onPressed;
  final bool isLoading;
  const CustomButton({
    required this.text,
    required this.textColor,
    this.textFontWeight = FontWeight.w600,
    this.textSize = 16,
    this.iconPath,
    this.iconWidth = 16,
    this.iconColor = AppColor.textHeader,
    this.iconHeight = 16,
    this.hasLeadingIcon = false,
    this.useLeadingImage = false,
    this.hasSuffixIcon = false,
    required this.backgroundColor,
    this.borderColor,
    this.borderRadius = 8,
    this.height = 48,
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: AppSizes.screenWidth(context),
      child: ElevatedButton(
        style: ButtonStyle(
          side: WidgetStateProperty.all<BorderSide>(
            BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 1,
            ),
          ),
          elevation: WidgetStateProperty.all<double>(0),
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled) || isLoading) {
                return backgroundColor.withOpacity(0.8);
              }
              return backgroundColor;
            },
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const Center(
                child: SpinKitThreeBounce(
                  color: AppColor.white,
                  size: 20.0,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (hasLeadingIcon)
                    (useLeadingImage == false)
                        ? SvgPicture.asset(
                            iconPath.toString(),
                            width: iconWidth,
                            height: iconHeight,
                            colorFilter: ColorFilter.mode(
                              iconColor,
                              BlendMode.srcIn,
                            ),
                          )
                        : Image.asset(
                            iconPath.toString(),
                            width: iconWidth,
                            height: iconHeight,
                          ),
                  if (hasLeadingIcon) const Gap(8),
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: textSize,
                      fontWeight: textFontWeight,
                    ),
                  ),
                  if (hasSuffixIcon) const Gap(8),
                  if (hasSuffixIcon)
                    SvgPicture.asset(
                      iconPath.toString(),
                      width: iconWidth,
                      height: iconHeight,
                      colorFilter: ColorFilter.mode(
                        iconColor,
                        BlendMode.srcIn,
                      ),
                    )
                ],
              ),
      ),
    );
  }
}
