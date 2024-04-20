import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:login_task/core/api/api_services.dart';
import 'package:login_task/features/login/data/repo/login_repo_impl.dart';

final di = GetIt.instance;

Future<void> init() async {
  di.registerSingleton<ApiService>(ApiService((FirebaseAuth.instance)));
  di.registerSingleton<LoginRepoImpl>(LoginRepoImpl(
    di.get<ApiService>(),
  ));
}
