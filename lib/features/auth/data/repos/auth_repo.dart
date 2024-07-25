import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:iegy/features/auth/data/models/sign_up_request_body.dart';
import 'package:iegy/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<String, UserModel>> signUpWithEmailAndPassword(
      SignUpRequestBody signUpRequestBody, BuildContext context);
}
