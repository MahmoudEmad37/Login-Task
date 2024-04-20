import 'package:flutter/material.dart';
import 'package:login_task/core/utils/color_manager.dart';
import 'package:login_task/core/utils/style_manager.dart';
import 'package:login_task/core/utils/values_manager.dart';

// ignore: must_be_immutable
class TextFormFieldWidget extends StatelessWidget {
  final double topPadding;
  final bool obscureText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  Widget? suffixIcon;
  final String hintText;
  TextInputType? keyboardType;

  TextFormFieldWidget({
    super.key,
    this.topPadding = AppPadding.p16,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    required this.validator,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
      ),
      child: TextFormField(
        obscureText: obscureText,
        validator: validator,
        style: AppTextStyle.textbody
            .copyWith(fontSize: AppSize.s14, fontWeight: FontWeight.w600),
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.red, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.grey, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColor.grey.withOpacity(0.5), width: 2.0),
          ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColor.grey,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
