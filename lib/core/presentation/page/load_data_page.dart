import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/domain/entity/user.dart';
import 'package:flutter_application_88/core/presentation/view/load_data_view.dart';

class LoadDataPage extends Page<void> {
  final User user;

  const LoadDataPage({
    required this.user,
  });

  @override
  Route<void> createRoute(BuildContext context) => createRouteNotContext();

  Route<void> createRouteNotContext() => MaterialPageRoute<void>(
        builder: (BuildContext context) => LoadDataView(user: user),
      );
}
