import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task/core/components/dialog/dismiss_dialog_func.dart';
import 'package:login_task/core/components/dialog/error_dialog.dart';
import 'package:login_task/core/components/dialog/loading_dialog.dart';
import 'package:login_task/core/components/dialog/success_dialog.dart';
import 'package:login_task/core/utils/color_manager.dart';
import 'package:login_task/core/utils/strings_manager.dart';
import 'package:login_task/core/utils/style_manager.dart';
import 'package:login_task/core/utils/values_manager.dart';
import 'package:login_task/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:login_task/features/login/presentation/widgets/text_form_field_widget.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({
    super.key,
  });

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  bool _obscureText = true;

// Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return SafeArea(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            dismissDialog(context);
            showSuccessDialog(context, "Login Successfully", onPressed: () {
              Navigator.pop(context);
            });
          } else if (state is LoginLoading) {
            showLoadingDialog(context);
          } else if (state is LoginFailure) {
            dismissDialog(context);
            showErrorDialog(context);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p50,
                  horizontal: AppPadding.p24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: AppPadding.p12),
                      child: Text(
                        AppStrings.welcomeOnBoard,
                        style: AppTextStyle.textStyle30.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: AppPadding.p14),
                      child: Text(
                        AppStrings.signIn,
                        style: AppTextStyle.textbody.copyWith(
                          fontSize: AppSize.s14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: AppPadding.p20),
                      child: Text(
                        AppStrings.email,
                        style: AppTextStyle.textbody.copyWith(
                          fontSize: AppSize.s16,
                        ),
                      ),
                    ),
                    TextFormFieldWidget(
                      topPadding: AppPadding.p10,
                      validator: (value) =>
                          value!.isEmpty ? AppStrings.emailError : null,
                      controller: cubit.emailController,
                      hintText: AppStrings.emailHint,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: AppPadding.p24),
                      child: Text(
                        AppStrings.password,
                        style: AppTextStyle.textbody.copyWith(
                          fontSize: AppSize.s16,
                        ),
                      ),
                    ),
                    TextFormFieldWidget(
                      topPadding: AppPadding.p10,
                      validator: (value) =>
                          value!.isEmpty ? AppStrings.passwordError : null,
                      controller: cubit.passwordController,
                      hintText: AppStrings.passwordHint,
                      obscureText: _obscureText,
                      suffixIcon: GestureDetector(
                        onTap: _toggle,
                        child: _obscureText
                            ? const Icon(Icons.lock_outline_rounded)
                            : const Icon(Icons.lock_open_rounded),
                      ),
                    ),
                    cubit.isLoading == false
                        ? Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(top: AppPadding.p70),
                            child: ElevatedButton(
                              onPressed: () {
                                cubit.loginValiate();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.buttonColor,
                                padding: const EdgeInsets.symmetric(
                                  vertical: AppPadding.p14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s12),
                                ),
                              ),
                              child: Text(
                                AppStrings.login,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.textStyle20.copyWith(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ))
                        : Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircularProgressIndicator(
                                color: AppColor.buttonColor,
                              ),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: AppPadding.p16),
                      child: Text(
                        AppStrings.register,
                        style: AppTextStyle.textbody.copyWith(
                          fontSize: AppSize.s12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
