import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/componenets/custom_button.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../core/utils/logger.dart';

class TaskDeleteConfirmation {
  const TaskDeleteConfirmation._();
  static show(BuildContext context, {required int id}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: BottomSheet(
            id: id,
          ),
        );
      },
    );
  }
}

class BottomSheet extends StatelessWidget {
  final int id;
  const BottomSheet({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    logger.i('id: $id');
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => UiHelpers.popPage(),
                child: Assets.icons.xCloseBorder.svg(),
              ),
            ],
          ),
          const Gap(10),
          Assets.icons.warning.svg(),
          const Gap(40),
          const Text(
            'Delete Task',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColor.textHeader,
            ),
          ),
          const Gap(10),
          const SizedBox(
            width: 261,
            child: Text(
              'Are you sure you want to delete this task? This action cannot be undone',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.textBody,
              ),
            ),
          ),
          const Gap(43),
          CustomButton(
            text: 'No',
            borderColor: AppColor.grey300,
            textColor: AppColor.textHeader,
            backgroundColor: AppColor.white,
            onPressed: () => UiHelpers.popPage(),
          ),
          const Gap(7),
          CustomButton(
            text: 'Yes',
            textColor: AppColor.white,
            backgroundColor: AppColor.red600,
            onPressed: () {},
            isLoading: false,
          ),
          const Gap(7),
        ],
      ),
    );
  }
}
