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
import '../../data/models/task_model.dart';
import '../widgets/taskdeleteconfirmation.dart';
import 'taskshimmer.dart';
import 'tasktiles.dart';

class CompletedTaskList extends StatefulWidget {
  final String category;
  const CompletedTaskList({required this.category, super.key});

  @override
  State<CompletedTaskList> createState() => _CompletedTaskListState();
}

class _CompletedTaskListState extends State<CompletedTaskList> {
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
        } else if (state is UpdateTaskSuccess) {
          context.read<TaskBloc>().add(GetTasksEvent());
        } else if (state is UpdateTaskError) {
          UiHelpers.showToast('error', state.message);
        }
      },
      builder: (context, state) {
        if (state is GetTasksLoading) {
          return _buildLoadingState();
        } else if (state is GetTasksSuccess) {
          return _buildSuccessState(
            state,
            widget.category,
          );
        }
        return _buildLoadingState();
      },
    );
  }

  Widget _buildLoadingState() {
    return const TaskShimmer(
      itemCount: 10,
    );
  }

  Widget _buildSuccessState(GetTasksSuccess state, String category) {
    final filteredTasks = category == 'All Tasks'
        ? state.tasks
        : state.tasks
            .where((task) =>
                task.taskCategory == category && task.isCompleted == false)
            .toList();

    if (filteredTasks.isEmpty) {
      return _buildDefaultState();
    }

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
                itemCount: filteredTasks.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Gap(10),
                itemBuilder: (context, index) {
                  final TaskModel task = filteredTasks[index];
                  return Dismissible(
                    key: Key(task.id.toString()),
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
                        context.read<TaskBloc>().add(UpdateTaskEvent(
                              task: task.copyWith(
                                isCompleted: true,
                              ),
                            ));
                        logger.i('Marked as completed');
                      }
                    },
                    child: TaskTile(
                      title: task.name ?? '',
                      body: task.description ?? '',
                      onTaskTileTap: () => UiHelpers.navigateToPage(
                        RoutesManager.taskDetailRoute,
                        arguments: task,
                      ),
                      onEditTap: () => UiHelpers.navigateToPage(
                        RoutesManager.taskEditRoute,
                        arguments: task,
                      ),
                      onDeleteTap: () => TaskDeleteConfirmation.show(context,
                          id: task.id ?? ''),
                      onCheckboxChanged: (p0) {
                        setState(() {
                          isCompleted = p0 ?? false;
                        });
                      },
                      isCompleted: task.isCompleted ?? false,
                      startDate: task.startDate ?? DateTime.now(),
                      endDate: task.endDate ?? DateTime.now(),
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


// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// import '../../../../core/componenets/custom_refreshindicator.dart';
// import '../../../../core/helpers/ui_helpers.dart';
// import '../../../../core/navigators/routes_manager.dart';
// import '../widgets/taskdeleteconfirmation.dart';
// import 'tasktiles.dart';

// class CompletedTaskList extends StatelessWidget {
//   const CompletedTaskList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomRefreshIndicator(
//       onRefresh: () async {
//         await Future.delayed(const Duration(seconds: 2));
//       },
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               ListView.separated(
//                 itemCount: 10,
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 separatorBuilder: (context, index) => const Gap(10),
//                 itemBuilder: (context, index) {
//                   return TaskTile(
//                     title: 'Completed Title',
//                     body: 'Completed Body',
//                     onTaskTileTap: () => UiHelpers.navigateToPage(
//                       RoutesManager.taskDetailRoute,
//                       arguments: {
//                         'title':
//                             'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
//                         'body':
//                             'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto',
//                         'userId': '3',
//                         'id': '1',
//                       },
//                     ),
//                     onEditTap: () => UiHelpers.navigateToPage(
//                       RoutesManager.taskEditRoute,
//                       arguments: {
//                         'title':
//                             'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
//                         'body':
//                             'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto',
//                         'userId': '3',
//                         'id': '1',
//                       },
//                     ),
//                     onDeleteTap: () =>
//                         TaskDeleteConfirmation.show(context, id: '1'),
//                     onCheckboxChanged: (p0) {
//                       // ignore: avoid_print
//                       print(p0);
//                     },
//                     isCompleted: true,
//                     startDate: DateTime.now(),
//                     endDate: DateTime.now(),
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
