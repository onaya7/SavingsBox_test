import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:savingsbox_test/core/constants/app_color.dart';

import '../../../../core/componenets/custom_refreshindicator.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../core/navigators/routes_manager.dart';
import '../../../../core/utils/logger.dart';
import '../widgets/taskdeleteconfirmation.dart';
import 'tasktiles.dart';

class HomeTaskList extends StatelessWidget {
  const HomeTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListView.separated(
                itemCount: 10,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Gap(10),
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: const Key('key'),
                    direction: DismissDirection.startToEnd,
                    background: Container(
                      color: AppColor.primary,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.mark_chat_read_sharp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        logger.i('Marked as completed');
                      }
                    },
                    child: TaskTile(
                      title: 'Title',
                      body: 'Body',
                      onTaskTileTap: () => UiHelpers.navigateToPage(
                        RoutesManager.taskDetailRoute,
                        arguments: {
                          'title':
                              'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
                          'body':
                              'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto',
                          'userId': '3',
                          'id': '1',
                        },
                      ),
                      onEditTap: () => UiHelpers.navigateToPage(
                        RoutesManager.taskEditRoute,
                        arguments: {
                          'title':
                              'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
                          'body':
                              'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto',
                          'userId': '3',
                          'id': '1',
                        },
                      ),
                      onDeleteTap: () =>
                          TaskDeleteConfirmation.show(context, id: 1),
                      onCheckboxChanged: (p0) {
                        // ignore: avoid_print
                        print(p0);
                      },
                      isCompleted: false,
                      startDate: DateTime.now(),
                      endDate: DateTime.now(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
