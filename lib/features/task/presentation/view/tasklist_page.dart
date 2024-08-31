import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savingsbox_test/features/task/presentation/bloc/task_bloc.dart';

import '../../../../core/componenets/custom_scaffold.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../core/navigators/routes_manager.dart';
import '../bloc/task_state.dart';
import '../widgets/completedtasklist.dart';
import '../widgets/hometasklist.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  TaskListViewState createState() => TaskListViewState();
}

class TaskListViewState extends State<TaskListView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return DefaultTabController(
          length: 4,
          child: CustomScaffold(
            useFloatingActionButton: true,
            onFloatingActionButtonPressed: () {
              UiHelpers.navigateToPage(RoutesManager.taskCreateRoute);
            },
            appBar: _selectedIndex == 0
                ? AppBar(
                    title: const Text(
                      'To-do List',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 20,
                      ),
                    ),
                    centerTitle: true,
                    foregroundColor: AppColor.white,
                    backgroundColor: AppColor.primary,
                    automaticallyImplyLeading: false,
                    bottom: const TabBar(
                      labelColor: AppColor.white,
                      indicatorColor: AppColor.divider,
                      unselectedLabelColor: AppColor.grey400,
                      tabs: [
                        Tab(text: 'All Tasks'),
                        Tab(text: 'Work'),
                        Tab(text: 'Personal'),
                        Tab(text: 'Others'),
                      ],
                    ),
                    elevation: 0,
                  )
                : AppBar(
                    title: const Text(
                      'Completed List',
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 20,
                      ),
                    ),
                    foregroundColor: AppColor.white,
                    backgroundColor: AppColor.primary,
                    automaticallyImplyLeading: false,
                  ),
            body: _selectedIndex == 0
                ? const TabBarView(
                    children: [
                      HomeTaskList(),
                      HomeTaskList(),
                      HomeTaskList(),
                      HomeTaskList(),
                    ],
                  )
                : const CompletedTaskList(),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColor.white,
              elevation: 10.0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.apps_rounded),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle),
                  label: 'Completed',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: AppColor.primary,
              onTap: _onItemTapped,
            ),
          ),
        );
      },
    );
  }
}
