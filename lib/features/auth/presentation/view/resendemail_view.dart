import 'package:flutter/material.dart';
import 'package:savingsbox_test/core/navigators/routes_manager.dart';

import '../../../../core/componenets/custom_button.dart';
import '../../../../core/componenets/custom_scaffold.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../gen/assets.gen.dart';

class ResendEmailView extends StatelessWidget {
  const ResendEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        statusBarColor: AppColor.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColor.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          foregroundColor: AppColor.black,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: AppColor.textHeader,
            ),
            onPressed: () {
              UiHelpers.popPage();
            },
          ),
        ),
        body: SafeArea(
          child: Container(
            color: AppColor.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 35,
                      left: 35,
                      right: 60,
                      bottom: 0,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Assets.json.emailsent.lottie(
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          const Text(
                            'Password Reset Email Sent',
                            style: TextStyle(
                              color: AppColor.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'We have sent a password reset link to your email address.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColor.grey700,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ]),
                  ),
                ),
                Container(
                  width: AppSizes.screenWidth(context),
                  padding: const EdgeInsets.only(left: 35, right: 34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomButton(
                        text: 'Done',
                        textColor: AppColor.white,
                        backgroundColor: AppColor.primary,
                        onPressed: () => UiHelpers.navigateToPageAndRemoveUntil(
                            RoutesManager.welcomeRoute),
                        isLoading: false,
                        iconColor: AppColor.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
