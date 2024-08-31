import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:savingsbox_test/core/helpers/ui_helpers.dart';
import 'package:savingsbox_test/core/utils/validators.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/componenets/custom_bottom_btn.dart';
import '../../../../core/componenets/custom_inputfield.dart';
import '../../../../core/componenets/custom_inputfield_label.dart';
import '../../../../core/componenets/custom_scaffold.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/navigators/routes_manager.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ForgotPasswordViewState createState() => ForgotPasswordViewState();
}

class ForgotPasswordViewState extends State<ForgotPasswordView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  bool _formCompleted = false;

  @override
  void initState() {
    _formCompleted = false;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignInError) {
          UiHelpers.showToast('error', state.message);
        } else if (state is SignInSuccess) {
          UiHelpers.navigateToPage(RoutesManager.tasklistRoute);
        }
      },
      builder: (context, state) {
        return CustomScaffold(
          appBar: AppBar(
            title: const Text(
              'Forgot Password',
              style: TextStyle(
                color: AppColor.textHeader,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            backgroundColor: AppColor.white,
            foregroundColor: AppColor.black,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColor.textHeader,
              ),
              onPressed: () {
                UiHelpers.popPage();
              },
            ),
          ),
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Enter your email address and we will send you a link to reset your password',
                        style: TextStyle(
                          color: AppColor.textBody,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Gap(20),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const CustomInputFieldLabel(
                              label: 'Email address',
                            ),
                            const Gap(5),
                            CustomInputField(
                              controller: _emailController,
                              currentFocus: _emailFocusNode,
                              hintText: 'e.g user@email.com',
                              prefixIconPath: Assets.icons.mail01.path,
                              action: TextInputAction.done,
                              onChanged: (value) => checkValidity(),
                              validator: (value) =>
                                  Validators.validateEmail(value),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomBtn(
            text: 'Continue',
            textColor: AppColor.white,
            backgroundColor:
                _formCompleted ? AppColor.primary : AppColor.neutral300,
            onPressed: _formCompleted ? () => onContinue() : null,
            isLoading: context.watch<AuthBloc>().state is SignInLoading,
          ),
        );
      },
    );
  }

  onContinue() async {
    if (_formKey.currentState!.validate()) {
      UiHelpers.navigateToPage(RoutesManager.resendEmailRoute);
      // context.read<AuthBloc>().add(
      //       SignInEvent(
      //         email: _emailController.text,
      //         password: _passwordController.text,
      //       ),
      //     );
    }
  }

  checkValidity() {
    if (_emailController.text.isNotEmpty) {
      setState(() {
        _formCompleted = true;
      });
    } else {
      setState(() {
        _formCompleted = false;
      });
    }
  }
}
