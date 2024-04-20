import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_task/core/utils/constants_manager.dart';
import 'package:login_task/core/utils/routes_manager.dart';
import 'package:login_task/core/utils/strings_manager.dart';
import 'package:login_task/core/utils/style_manager.dart';
import 'package:login_task/core/utils/values_manager.dart';
import 'package:login_task/features/splash/presentation/widgets/sliding_text.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
        vsync: this, duration: AppConstants.transtionDuration);

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          AppStrings.loginTask,
          textAlign: TextAlign.center,
          style: AppTextStyle.textStyle30,
        ),
        const SizedBox(
          height: AppSize.s4,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(AppConstants.delayedDuration, () {
      GoRouter.of(context).push(AppRouter.loginPage);
    });
  }
}
