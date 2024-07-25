import 'package:flutter/material.dart';

abstract class ProfileRepo {
  Future<String> logout(BuildContext context);
}
