import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


import '../../gen/assets.gen.dart';
import '../constants/app_color.dart';
import 'custom_scaffold.dart';

class CustomLoading extends StatelessWidget {
  final String? title;
  final String? subtitile;
  final Color? backgroundColor;

  const CustomLoading({
    super.key,
    this.title,
    this.subtitile = 'This will only take few seconds',
    this.backgroundColor = AppColor.white,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.loadingForever
                  .image(fit: BoxFit.cover, width: 40, height: 40),
              const Gap(33),
              Text(
                title.toString(),
                style: const TextStyle(
                  color: AppColor.textHeader,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Gap(10),
              Text(
                subtitile.toString(),
                style: const TextStyle(
                  color: AppColor.textBody,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ));
  }
}
