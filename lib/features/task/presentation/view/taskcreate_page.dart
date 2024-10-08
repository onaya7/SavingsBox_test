import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:savingsbox_test/features/task/data/models/task_model.dart';
import 'package:savingsbox_test/features/task/presentation/bloc/task_state.dart';

import '../../../../core/componenets/custom_button.dart';
import '../../../../core/componenets/custom_inputfield.dart';
import '../../../../core/componenets/custom_inputfield_label.dart';
import '../../../../core/componenets/custom_scaffold.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../core/utils/logger.dart';
import '../../../../core/utils/validators.dart';
import '../bloc/task_bloc.dart';
import '../bloc/task_event.dart';

class TaskCreateView extends StatefulWidget {
  const TaskCreateView({super.key});

  @override
  State<TaskCreateView> createState() => _TaskCreateViewState();
}

class _TaskCreateViewState extends State<TaskCreateView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final FocusNode _titleFocus = FocusNode();
  final FocusNode _bodyFocus = FocusNode();
  late bool _formCompleted;
  String? selectedCategory;

  List<String> categories = [
    'Work',
    'Personal',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _formCompleted = false;
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _bodyController.dispose();
    _titleFocus.dispose();
    _bodyFocus.dispose();
  }

  Future<void> checkValidity() async {
    if (_titleController.text.isNotEmpty && _bodyController.text.isNotEmpty) {
      setState(() {
        _formCompleted = true;
      });
    } else {
      setState(() {
        _formCompleted = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state is CreateTaskError) {
          UiHelpers.showToast('error', state.message);
        } else if (state is CreateTaskSuccess) {
          UiHelpers.showToast('success', 'Task created successfully');
          context.read<TaskBloc>().add(GetTasksEvent());
        }
      },
      builder: (context, state) {
        return CustomScaffold(
          backgroundColor: AppColor.white,
          appBar: AppBar(
            title: const Text(
              'Create Task',
              style: TextStyle(
                color: AppColor.white,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            foregroundColor: AppColor.white,
            backgroundColor: AppColor.primary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => UiHelpers.popPage(),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const CustomInputFieldLabel(
                          label: 'Title',
                        ),
                        const Gap(5),
                        CustomInputField(
                          controller: _titleController,
                          currentFocus: _titleFocus,
                          nextFocus: _bodyFocus,
                          hintText: 'Please give a descriptive title',
                          action: TextInputAction.next,
                          validator: (value) => Validators.validateTitle(value),
                          onChanged: (value) => checkValidity(),
                        ),
                        const Gap(20),
                        const CustomInputFieldLabel(
                          label: 'Body',
                        ),
                        const Gap(5),
                        CustomInputField(
                          controller: _bodyController,
                          maxlines: 5,
                          currentFocus: _bodyFocus,
                          hintText: 'Give detailed body of the post .........',
                          action: TextInputAction.done,
                          validator: (value) => Validators.validateBody(value),
                          onChanged: (value) => checkValidity(),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  CustomDropdown(
                    items: categories,
                    hintText: 'Select Category',
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                        logger.i('selectedCategory: $selectedCategory');
                      });
                    },
                    decoration: CustomDropdownDecoration(
                      closedFillColor: AppColor.white,
                      closedBorder: Border.all(
                        color: AppColor.grey300,
                        width: 2,
                      ),
                      headerStyle: const TextStyle(
                        color: AppColor.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      listItemStyle: const TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      hintStyle: const TextStyle(
                        color: AppColor.grey400,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Gap(20),
                  CustomButton(
                    text: 'Save',
                    textColor: AppColor.white,
                    backgroundColor:
                        _formCompleted ? AppColor.primary : AppColor.neutral300,
                    onPressed:
                        _formCompleted ? () => onContinue(context) : null,
                    isLoading:
                        context.watch<TaskBloc>().state is CreateTaskLoading,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  onContinue(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      TaskModel task = TaskModel(
        name: _titleController.text,
        description: _bodyController.text,
        taskCategory: selectedCategory,
      );
      context.read<TaskBloc>().add(
            CreateTaskEvent(
              task: task,
            ),
          );
    }
  }
}
