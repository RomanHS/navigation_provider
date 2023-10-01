import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/presentation/view/aut_view.dart';

class AutPage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) => createRouteNotContext();

  Route<void> createRouteNotContext() => MaterialPageRoute<void>(
        builder: (BuildContext context) => AutView.create(),
      );
}
