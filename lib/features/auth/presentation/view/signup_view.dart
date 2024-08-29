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
import '../../../../core/utils/logger.dart';
import '../../../../core/utils/validators.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/alreadyhave.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  SignupViewState createState() => SignupViewState();
}

class SignupViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  late bool passwordVisible;
  late bool confirmPasswordVisible;
  bool _formCompleted = false;

  @override
  void initState() {
    _formCompleted = false;
    passwordVisible = true;
    confirmPasswordVisible = true;
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _emailFocusNode.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordController.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          logger.e(state.message);
          UiHelpers.showToast('error', state.message);
        } else if (state is AuthAuthenticated) {
          UiHelpers.navigateToPage(RoutesManager.signInRoute);
        }
      },
      builder: (context, state) {
        return CustomScaffold(
          appBar: AppBar(
            title: const Text(
              'Create Account',
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
                        'We need your personal information',
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
                              label: 'First name',
                            ),
                            const Gap(5),
                            CustomInputField(
                              controller: _firstNameController,
                              currentFocus: _firstNameFocus,
                              nextFocus: _lastNameFocus,
                              hintText: 'Place|holder',
                              action: TextInputAction.next,
                              validator: (value) =>
                                  Validators.validateFirstName(value),
                              onChanged: (value) => checkValidity(),
                            ),
                            const Gap(20),
                            const CustomInputFieldLabel(
                              label: 'Last name',
                            ),
                            const Gap(5),
                            CustomInputField(
                              controller: _lastNameController,
                              currentFocus: _lastNameFocus,
                              nextFocus: _emailFocusNode,
                              hintText: 'Place|holder',
                              action: TextInputAction.next,
                              validator: (value) =>
                                  Validators.validateLastName(value),
                              onChanged: (value) => checkValidity(),
                            ),
                            const Gap(20),
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
                              validator: (value) =>
                                  Validators.validateEmail(value),
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
                              nextFocus: _confirmPasswordFocusNode,
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
                              validator: (value) => Validators.validatePassword(
                                  _passwordController.text),
                            ),
                            const Gap(15),
                            const CustomInputFieldLabel(
                              label: 'Confirm Password',
                            ),
                            const Gap(5),
                            CustomInputField(
                              controller: _confirmPasswordController,
                              currentFocus: _confirmPasswordFocusNode,
                              hintTextColor: AppColor.grey400,
                              hintText: '● ● ● ● ● ● ● ●',
                              prefixIconPath: Assets.icons.lock03.path,
                              isPasswordfield: true,
                              obscureText: confirmPasswordVisible,
                              onSuffixIconTap: () => setState(() {
                                confirmPasswordVisible =
                                    !confirmPasswordVisible;
                              }),
                              action: TextInputAction.done,
                              validator: (value) =>
                                  Validators.validateConfirmPassword(
                                      _passwordController.text, value!),
                              onChanged: (value) => checkValidity(),
                            ),
                            const Gap(20),
                            AlreadyHave(
                              text: 'Already have an account?',
                              authName: 'Sign In',
                              onPressed: () => UiHelpers.navigateToPage(
                                  RoutesManager.signInRoute),
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
            backgroundColor:
                _formCompleted ? AppColor.primary : AppColor.neutral300,
            onPressed: _formCompleted ? () => onContinue() : null,
            isLoading: context.watch<AuthBloc>().state is AuthLoading,
          ),
        );
      },
    );
  }

  onContinue() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            SignUpEvent(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  checkValidity() {
    if (_firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty) {
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
