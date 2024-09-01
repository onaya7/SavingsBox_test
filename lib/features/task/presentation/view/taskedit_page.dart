import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:savingsbox_test/features/task/data/models/task_model.dart';
import 'package:savingsbox_test/features/task/presentation/bloc/task_bloc.dart';
import 'package:savingsbox_test/features/task/presentation/bloc/task_state.dart';

import '../../../../core/componenets/custom_button.dart';
import '../../../../core/componenets/custom_inputfield.dart';
import '../../../../core/componenets/custom_inputfield_label.dart';
import '../../../../core/componenets/custom_scaffold.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../core/utils/validators.dart';
import '../bloc/task_event.dart';

class TaskEditView extends StatefulWidget {
  final TaskModel args;

  const TaskEditView({
    super.key,
    required this.args,
  });

  @override
  State<TaskEditView> createState() => _TaskEditViewState();
}

class _TaskEditViewState extends State<TaskEditView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  final FocusNode _titleFocus = FocusNode();
  final FocusNode _bodyFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.args.name);
    _bodyController = TextEditingController(text: widget.args.description);
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _bodyController.dispose();
    _titleFocus.dispose();
    _bodyFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state is UpdateTaskSuccess) {
          UiHelpers.showToast('success', 'Task updated successfully');
          context.read<TaskBloc>().add(GetTasksEvent());
        } else if (state is UpdateTaskError) {
          UiHelpers.showToast('error', state.message);
        }
      },
      builder: (context, state) {
        return CustomScaffold(
          backgroundColor: AppColor.white,
          appBar: AppBar(
            title: const Text(
              'Edit Task',
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
                          hintText: 'Enter title',
                          action: TextInputAction.next,
                          validator: (value) => Validators.validateTitle(value),
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
                          hintText: 'Enter body',
                          action: TextInputAction.done,
                          validator: (value) => Validators.validateBody(value),
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'Save',
                          textColor: AppColor.white,
                          backgroundColor: AppColor.primary,
                          onPressed: () => onSave(context),
                          isLoading: context.watch<TaskBloc>().state
                              is UpdateTaskLoading,
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: CustomButton(
                          text: 'Cancel',
                          textColor: AppColor.white,
                          backgroundColor: AppColor.primary,
                          onPressed: () => UiHelpers.popPage(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  onSave(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<TaskBloc>().add(UpdateTaskEvent(
              task: widget.args.copyWith(
            name: _titleController.text,
            description: _bodyController.text,
          )));

    }
  }
}
