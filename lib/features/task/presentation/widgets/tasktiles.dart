import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:savingsbox_test/core/helpers/date_helpers.dart';

import '../../../../core/componenets/custom_ripple.dart';
import '../../../../core/constants/app_color.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String body;
  final DateTime startDate;
  final DateTime endDate;
  final void Function() onTaskTileTap;
  final void Function() onEditTap;
  final void Function() onDeleteTap;
  final bool isCompleted;
  final void Function(bool?) onCheckboxChanged;

  const TaskTile({
    required this.title,
    required this.body,
    required this.startDate,
    required this.endDate,
    required this.onTaskTileTap,
    required this.onEditTap,
    required this.onDeleteTap,
    required this.isCompleted,
    required this.onCheckboxChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRipple(
      borderRadius: 8,
      onTap: onTaskTileTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: isCompleted,
                  onChanged: onCheckboxChanged,
                  shape: const CircleBorder(),
                  activeColor: AppColor.primary,
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: isCompleted
                              ? AppColor.grey400
                              : AppColor.textHeader,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          decoration: isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.flag,
                            color: isCompleted
                                ? AppColor.grey400
                                : AppColor.primary,
                            size: 16,
                          ),
                          const Gap(5),
                          Text(
                            '${DateHelpers.formatDateTime(startDate)} - ${DateHelpers.formatDateTime(endDate)}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColor.textBody,
                              fontSize: 10,
                              decoration: isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                isCompleted
                    ? const SizedBox()
                    : IconButton(
                        onPressed: onEditTap,
                        icon: const Icon(Icons.edit_document),
                        color: AppColor.primary,
                        iconSize: 20,
                      ),
                IconButton(
                  onPressed: onDeleteTap,
                  icon: const Icon(Icons.delete),
                  color: AppColor.errorBorder,
                  iconSize: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
