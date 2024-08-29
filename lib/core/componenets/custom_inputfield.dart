import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../constants/app_color.dart';
import '../helpers/ui_helpers.dart';


class CustomInputField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final bool? isPasswordfield;
  final String? hintText;
  final Color? hintTextColor;
  final String? prefixIconPath;
  final TextInputAction? action;
  final int? maxlines;
  final bool? enabled;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final VoidCallback? onSuffixIconTap;

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomInputField(
      {this.controller,
      this.currentFocus,
      this.nextFocus,
      this.isPasswordfield = false,
      this.hintText,
      this.hintTextColor = AppColor.grey500,
      this.prefixIconPath,
      this.action,
      this.maxlines = 1,
      this.validator,
      this.onChanged,
      this.enabled = true,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.inputFormatters,
      this.fillColor,
      this.onSuffixIconTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      maxLines: maxlines,
      controller: controller,
      textInputAction: action,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      focusNode: currentFocus,
      onTapOutside: (event) => currentFocus?.unfocus(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      obscuringCharacter: '●',
      style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColor.textBody),
      onEditingComplete: () {
        UiHelpers.shiftFocus(context, currentFocus, nextFocus);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? AppColor.white,

        errorStyle: const TextStyle(
          height: 0,
        ),
        // errorStyle: const TextStyle(height: 0),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: hintTextColor,
          letterSpacing: -0.30,
          height: 0,
        ),
        prefixIcon: (prefixIconPath == null)
            ? null
            : Padding(
                padding: const EdgeInsets.only(left: 16, right: 10),
                child: SvgPicture.asset(prefixIconPath.toString(),
                    width: 18,
                    height: 18,
                    colorFilter: const ColorFilter.mode(
                        AppColor.grey400, BlendMode.srcIn)),
              ),
        suffixIcon: (isPasswordfield == false)
            ? const Gap(0)
            : GestureDetector(
                onTap: onSuffixIconTap,
                child: Container(
                    width: 18,
                    height: 18,
                    alignment: Alignment.center,
                    child: Icon(
                      (obscureText == true)
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColor.grey400,
                      size: 18,
                    )),
              ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.grey300, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.grey300, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.primary, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
