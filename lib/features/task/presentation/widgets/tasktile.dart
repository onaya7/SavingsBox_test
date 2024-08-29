import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/componenets/custom_ripple.dart';
import '../../../../core/constants/app_color.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final String body;
  final void Function() onTaskTileTap;
  final void Function() onEditTap;
  final void Function() onDeleteTap;

  const TaskTile({
    required this.title,
    required this.body,
    required this.onTaskTileTap,
    required this.onEditTap,
    required this.onDeleteTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRipple(
      borderRadius: 8,
      onTap: onTaskTileTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColor.textHeader,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    body,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColor.textBody,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: onEditTap,
                  icon: const Icon(Icons.edit_document),
                  color: AppColor.primary,
                ),
                const Gap(2),
                IconButton(
                  onPressed: onDeleteTap,
                  icon: const Icon(Icons.delete),
                  color: AppColor.errorBorder,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
