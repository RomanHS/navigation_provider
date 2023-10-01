import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/presentation/app/app.dart';
import 'package:flutter_application_88/core/domain/entity/user.dart';

const bool isImportantMessages = false;

void main() {
  const User user = User();

  runApp(App.create(user: user));
}
