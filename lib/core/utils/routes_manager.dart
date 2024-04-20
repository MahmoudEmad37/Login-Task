import 'package:go_router/go_router.dart';
import 'package:login_task/features/login/presentation/pages/login_page.dart';
import 'package:login_task/features/splash/presentation/pages/splash_screen.dart';

abstract class AppRouter {
  static const loginPage = '/loginPage';
  static const homePage = '/homePage';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: loginPage,
        builder: (context, state) => const LoginPage(),
      ),
      // GoRoute(
      //   path: homePage,
      //   builder: (context, state) => const HomePage(),
      // ),
    ],
  );
}
