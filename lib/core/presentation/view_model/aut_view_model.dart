import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/domain/entity/user.dart';
import 'package:flutter_application_88/core/presentation/provider/aut_provider.dart';
import 'package:flutter_application_88/core/presentation/state/aut_state.dart';

class AutViewModel extends ValueNotifier<AutState> {
  final AutProvider autProvider;

  AutViewModel({
    required this.autProvider,
  }) : super(const AutNotUserState());

  void aut() async {
    value = const AutLoadState();

    await Future.delayed(const Duration(seconds: 1));

    const User user = User();

    autProvider.aut(user);
  }
}
