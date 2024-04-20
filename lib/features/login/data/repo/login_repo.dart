import 'package:dartz/dartz.dart';
import 'package:login_task/core/errors/failure.dart';
import 'package:login_task/features/login/data/models/user_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, dynamic>> login({required UserModel user});
}
