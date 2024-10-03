import 'package:flutter/material.dart';
import 'package:savingsbox_test/core/constants/app_color.dart';
import 'package:savingsbox_test/core/constants/keys.dart';
import 'package:toastification/toastification.dart';

import '../utils/logger.dart';

class UiHelpers {
  UiHelpers._();

  //Toastification helper------------------------------------------------------------------------------------------------
  static void showToast(String status, String message) {
    final context = Keys.navigatorKey.currentContext as BuildContext;

    final statusToToastType = {
      'success': ToastificationType.success,
      'error': ToastificationType.error,
      'info': ToastificationType.info,
      'warning': ToastificationType.warning,
    };

    final statusToIcon = {
      'success': const Icon(
        Icons.check_circle_outline,
        color: AppColor.successBorder,
      ),
      'error': const Icon(
        Icons.error_outline,
        color: AppColor.errorBorder,
      ),
      'info': const Icon(
        Icons.info_outline,
        color: AppColor.infoBorder,
      ),
      'warning': const Icon(
        Icons.warning_amber_outlined,
        color: AppColor.warningBorder,
      ),
    };

    final toastType = statusToToastType[status];
    final icon = statusToIcon[status];
    if (toastType != null) {
      toastification.show(
        context: context,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        type: toastType,
        style: ToastificationStyle.flatColored,
        title: Text(
          message,
          style: const TextStyle(
            color: AppColor.black,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
        alignment: Alignment.topCenter,
        autoCloseDuration: const Duration(seconds: 3),
        showProgressBar: false,
        dragToClose: true,
        icon: icon,
      );
    }
  }

  //Unfocus helper ------------------------------------------------------------------------------------------------------------
  static void unfocus(BuildContext context) {
    FocusScope.of(context).unfocus();
    
  }

  //CloseKeyboard helper ------------------------------------------------------------------------------------------------------
  static void closeKeyboard(BuildContext context) {
    if (FocusScope.of(context).hasPrimaryFocus ||
        FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  //Navigate to page helper --------------------------------------------------------------------------------------------
  static navigateToPage(String routeName, {Object? arguments}) {
    logger.i(
        ':::::::::::::::::::::::::::Navigating to $routeName::::::::::::::::::::::::::::');
    Keys.navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  static void popPage() {
    Keys.navigatorKey.currentState!.pop();
  }

  static navigateToPageAndReplace(String routeName, {Object? arguments}) {
    logger.i(
        ':::::::::::::::::::::::::::Navigating to $routeName::::::::::::::::::::::::::::');
    Keys.navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static navigateToPageAndRemoveUntil(String routeName, {Object? arguments}) {
    logger.i(
        ':::::::::::::::::::::::::::Navigating to $routeName::::::::::::::::::::::::::::');
    Keys.navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  //isDarkMode helper ---------------------------------------------------------------------------------------------------------
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

//Shift focus helper --------------------------------------------------------------------------------------------
  static void shiftFocus(
      BuildContext context, FocusNode? currentFocus, FocusNode? nextFocus) {
    if (nextFocus != null) {
      currentFocus?.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    } else {
      currentFocus?.unfocus();
    }
  }
}
