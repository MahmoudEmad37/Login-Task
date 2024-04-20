import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSuccessDialog(BuildContext context, String? message,
    {required void Function()? onPressed}) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Icon(
                CupertinoIcons.check_mark_circled,
                color: Colors.green,
                size: 86,
              ),
            ),
            if (message != null) ...[
              Text(
                message,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ]
          ],
        ),
        actions: [
          TextButton(
              onPressed: onPressed,
              child: Text(
                "Success",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.w700,
                    ),
              ))
        ],
      );
    },
  );
}
