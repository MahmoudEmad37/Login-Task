import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task/features/login/data/repo/login_repo_impl.dart';
import 'package:login_task/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:login_task/features/login/presentation/widgets/login_page_body.dart';
import 'package:login_task/injection_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(loginRepo: di.get<LoginRepoImpl>()),
      child: const Scaffold(
        body: LoginPageBody(),
      ),
    );
  }
}
