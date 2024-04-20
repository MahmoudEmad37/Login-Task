import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_task/core/utils/color_manager.dart';
import 'package:login_task/core/utils/values_manager.dart';

void showErrorDialog(BuildContext context, [String? message]) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSize.s32),
                child: Icon(
                  CupertinoIcons.xmark_circle,
                  color: AppColor.red,
                  size: AppSize.s86,
                ),
              ),
              if (message != null) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s15),
                  child: Text(
                    message,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: AppSize.s32)
              ]
            ],
          ),
        );
      },
    );
  });
}
