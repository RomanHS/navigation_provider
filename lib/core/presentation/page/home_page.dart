import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/domain/entity/user.dart';
import 'package:flutter_application_88/core/domain/value/data_context.dart';
import 'package:flutter_application_88/core/presentation/view/home_view.dart';

class HomePage extends Page<void> {
  final User user;
  final DataContext dataContext;

  const HomePage({
    required this.user,
    required this.dataContext,
  });

  @override
  Route<void> createRoute(BuildContext context) => createRouteNotContext();

  Route<void> createRouteNotContext() => MaterialPageRoute(
        builder: (BuildContext context) => HomeView.create(
          user: user,
          dataContext: dataContext,
        ),
      );
}
