import 'package:flutter/material.dart';

import '../../../../core/componenets/custom_button.dart';
import '../../../../core/componenets/custom_scaffold.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../core/navigators/routes_manager.dart';
import '../../../../gen/assets.gen.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        statusBarColor: AppColor.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColor.white,
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
                          const Text(
                            'Welcome to',
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Assets.json.bookreveal.lottie(
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                            repeat: false,
                          ),
                          const Text(
                            'TraTask',
                            style: TextStyle(
                              color: AppColor.primary,
                              fontSize: 45,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'A place where you can stay on top of your task.',
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
                      const Text(
                        'Let\'s Get Started...',
                        style: TextStyle(
                          color: AppColor.grey700,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      CustomButton(
                        text: 'Next',
                        textColor: AppColor.white,
                        backgroundColor: AppColor.primary,
                        onPressed: () =>
                            UiHelpers.navigateToPage(RoutesManager.signInRoute),
                        isLoading: false,
                        hasSuffixIcon: true,
                        iconPath: Assets.icons.chevronRight.path,
                        iconColor: AppColor.white,
                      ),
                      const SizedBox(
                        height: 18,
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
