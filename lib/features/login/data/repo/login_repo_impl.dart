import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_task/core/api/api_services.dart';
import 'package:login_task/core/errors/failure.dart';
import 'package:login_task/features/login/data/models/user_model.dart';
import 'package:login_task/features/login/data/repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final ApiService apiService;

  LoginRepoImpl(this.apiService);

  @override
  Future<Either<Failure, dynamic>> login({required UserModel user}) async {
    try {
      var data =
          await apiService.login(email: user.email, password: user.password);
      return right(data);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(ServerFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        return left(ServerFailure('Wrong password provided for that user.'));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
