import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:savingsbox_test/core/constants/app_color.dart';
import 'package:savingsbox_test/features/task/presentation/bloc/task_bloc.dart';
import 'package:savingsbox_test/features/task/presentation/bloc/task_event.dart';
import 'package:savingsbox_test/features/task/presentation/bloc/task_state.dart';

import '../../../../core/componenets/custom_emptyitemstate.dart';
import '../../../../core/componenets/custom_refreshindicator.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../core/navigators/routes_manager.dart';
import '../../../../core/utils/logger.dart';
import '../widgets/taskdeleteconfirmation.dart';
import 'taskshimmer.dart';
import 'tasktiles.dart';

class HomeTaskList extends StatefulWidget {
  const HomeTaskList({super.key});

  @override
  State<HomeTaskList> createState() => _HomeTaskListState();
}

class _HomeTaskListState extends State<HomeTaskList> {
  late bool isCompleted;

  @override
  void initState() {
    super.initState();
    isCompleted = false;
    context.read<TaskBloc>().add(GetTasksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state is GetTasksError) {
          UiHelpers.showToast('error', state.message);
        }
      },
      builder: (context, state) {
        if (state is GetTasksLoading) {
          return _buildLoadingState();
        } else if (state is GetTasksSuccess) {
          return _buildSuccessState(state);
        }
        return _buildDefaultState();
      },
    );
  }

  Widget _buildLoadingState() {
    return const TaskShimmer(
      itemCount: 10,
    );
  }

  Widget _buildSuccessState(GetTasksSuccess state) {
    return CustomRefreshIndicator(
      onRefresh: () async {
        context.read<TaskBloc>().add(GetTasksEvent());
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListView.separated(
                itemCount: state.tasks.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Gap(10),
                itemBuilder: (context, index) {
                  final tasks = state.tasks;
                  logger.i('task length: ${tasks.length}');
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
                        setState(() {
                          isCompleted = p0 ?? false;
                        });
                      },
                      isCompleted: isCompleted,
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

  Widget _buildDefaultState() {
    return const CustomEmptyItemState(
      title: 'No tasks',
      subtitle: 'You have no tasks yet',
    );
  }
}
