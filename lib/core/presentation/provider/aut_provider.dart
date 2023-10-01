import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/domain/entity/user.dart';

class AutProvider extends ValueNotifier<User?> {
  AutProvider(super.value);

  void aut(User user) {
    value = user;
  }

  void exit() {
    value = null;
  }
}
