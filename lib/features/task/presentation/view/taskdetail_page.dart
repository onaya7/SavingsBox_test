import 'package:flutter/material.dart';
import 'package:savingsbox_test/features/task/data/models/task_model.dart';

import '../../../../core/componenets/custom_divider.dart';
import '../../../../core/componenets/custom_scaffold.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/helpers/ui_helpers.dart';

class TaskDetailView extends StatelessWidget {
  final TaskModel args;

  const TaskDetailView({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    Map<bool, Color> statusColor = {
      false: AppColor.orange500,
      true: AppColor.green600,
    };
    Map<bool, IconData> statusIcon = {
      false: Icons.sentiment_very_dissatisfied,
      true: Icons.sentiment_very_satisfied,
    };
    return CustomScaffold(
      appBar: AppBar(
        title: const Text(
          'Task Detail',
          style: TextStyle(
            color: AppColor.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => UiHelpers.popPage(),
        ),
        backgroundColor: statusColor[args.isCompleted],
        foregroundColor: AppColor.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(statusIcon[args.isCompleted],
                          size: 80, color: statusColor[args.isCompleted]),
                    ],
                  ),
                  ListTile(
                    title: Text(
                      'Task ID: ${args.id}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const CustomDivider(
                    height: 0,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text(
                      'Title: ${args.name}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const CustomDivider(
                    height: 0,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text(
                      'Body: ${args.description}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const CustomDivider(
                    height: 0,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text(
                      'Start Date: ${args.startDate}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const CustomDivider(
                    height: 0,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text(
                      'End Date: ${args.endDate}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const CustomDivider(
                    height: 0,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text(
                      'Status: ${args.isCompleted == true ? 'Completed' : 'Pending'}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    trailing: CircleAvatar(
                      radius: 10,
                      backgroundColor: statusColor[args.isCompleted],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
