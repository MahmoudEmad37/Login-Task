import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_task/core/utils/color_manager.dart';
import 'package:login_task/core/utils/routes_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const LoginTask());
}

class LoginTask extends StatelessWidget {
  const LoginTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'LoginTask',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColor.primaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
      ),
    );
  }
}
