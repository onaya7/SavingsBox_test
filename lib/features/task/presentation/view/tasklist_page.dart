import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savingsbox_test/core/componenets/custom_loading.dart';
import 'package:savingsbox_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:savingsbox_test/features/auth/presentation/bloc/auth_event.dart';
import 'package:savingsbox_test/features/auth/presentation/bloc/auth_state.dart';

import '../../../../core/componenets/custom_scaffold.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../core/navigators/routes_manager.dart';
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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          UiHelpers.navigateToPageAndRemoveUntil(RoutesManager.welcomeRoute);
        } else if (state is SignOutError) {
          UiHelpers.showToast('error', state.message);
        }
      },
      builder: (context, state) {
        if (state is SignOutLoading) {
          return _buildLoadingState();
        }
        return _buildDefaultState();
      },
    );
  }

  Widget _buildDefaultState() {
    return PopScope(
      canPop: false,
      child: DefaultTabController(
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
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () {
                        context.read<AuthBloc>().add(SignOutEvent());
                      },
                    ),
                  ],
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
      ),
    );
  }

  Widget _buildLoadingState() {
    return const CustomLoading(
      title: 'Logging Out ...',
    );
  }
}
