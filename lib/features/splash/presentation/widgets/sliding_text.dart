import 'package:flutter/material.dart';
import 'package:login_task/core/utils/strings_manager.dart';
import 'package:login_task/core/utils/values_manager.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text(
            AppStrings.welcomeApp,
            style:
                TextStyle(fontSize: AppSize.s16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
