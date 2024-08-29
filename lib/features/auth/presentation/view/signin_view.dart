import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:savingsbox_test/core/helpers/ui_helpers.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/componenets/custom_bottom_btn.dart';
import '../../../../core/componenets/custom_inputfield.dart';
import '../../../../core/componenets/custom_inputfield_label.dart';
import '../../../../core/componenets/custom_scaffold.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/navigators/routes_manager.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/alreadyhave.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  SignInViewState createState() => SignInViewState();
}

class SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  late bool passwordVisible;
  bool _formCompleted = false;

  @override
  void initState() {
    _formCompleted = false;
    passwordVisible = true;

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          UiHelpers.showToast('error', state.message);
        } else if (state is AuthAuthenticated) {
          UiHelpers.navigateToPage(RoutesManager.tasklistRoute);
        }
      },
      builder: (context, state) {
        return CustomScaffold(
          appBar: AppBar(
            title: const Text(
              'Sign in',
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
                        'Sign in to your account',
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
                            ),
                            const Gap(20),
                            const CustomInputFieldLabel(
                              label: 'Password',
                            ),
                            const Gap(5),
                            CustomInputField(
                              controller: _passwordController,
                              currentFocus: _passwordFocusNode,
                              hintTextColor: AppColor.grey400,
                              hintText: '● ● ● ● ● ● ● ●',
                              prefixIconPath: Assets.icons.lock03.path,
                              isPasswordfield: true,
                              obscureText: passwordVisible,
                              onSuffixIconTap: () => setState(() {
                                passwordVisible = !passwordVisible;
                              }),
                              action: TextInputAction.next,
                              onChanged: (value) => checkValidity(),
                            ),
                            const Gap(20),
                            AlreadyHave(
                              text: 'Don\'t have an account?',
                              authName: 'Create Account',
                              onPressed: () => UiHelpers.navigateToPage(
                                  RoutesManager.signUpRoute),
                            )
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
            backgroundColor: _formCompleted
                ? AppColor.primary
                : AppColor.neutral300,
            onPressed: _formCompleted ? () => onContinue() : null,
            isLoading: context.watch<AuthBloc>().state is AuthLoading,
          ),
        );
      },
    );
  }

  onContinue() async {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            SignInEvent(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  checkValidity() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
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
