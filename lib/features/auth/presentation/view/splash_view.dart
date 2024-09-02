import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:savingsbox_test/core/constants/env.dart';

import '../../../../core/componenets/custom_scaffold.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_size.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../core/navigators/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () async {
      UiHelpers.navigateToPage(RoutesManager.welcomeRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      statusBarColor: AppColor.black,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColor.black,
      backgroundColor: AppColor.black,
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: AppSizes.screenWidth(context),
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      Env.appName ?? 'Todo App',
                      style: const TextStyle(
                        color: AppColor.primary,
                        fontSize: 45,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(38),
                    const SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColor.white,
                        ),
                        strokeWidth: 2.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
