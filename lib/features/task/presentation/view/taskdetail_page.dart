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
        backgroundColor: AppColor.primary,
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.newspaper_rounded,
                          size: 80, color: AppColor.primary),
                    ],
                  ),
                  ListTile(
                    title: Text(
                      'ID: ${args.id}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const CustomDivider(
                    height: 0,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text(
                      'User ID: ${args.userId}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const CustomDivider(
                    height: 0,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text(
                      'Title: ${args.name}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const CustomDivider(
                    height: 0,
                    thickness: 2,
                  ),
                  ListTile(
                    title: Text(
                      'Body: ${args.description}',
                      style: Theme.of(context).textTheme.titleMedium,
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
