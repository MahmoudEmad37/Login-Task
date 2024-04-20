import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String email;
  final String password;

  const UserModel({required this.email, required this.password});

  @override
  List<Object?> get props {
    return [
      email,
      password,
    ];
  }
}
