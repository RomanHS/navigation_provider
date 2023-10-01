import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/domain/entity/user.dart';
import 'package:flutter_application_88/core/presentation/page/aut_page.dart';
import 'package:flutter_application_88/core/presentation/page/load_data_page.dart';
import 'package:flutter_application_88/core/presentation/provider/aut_provider.dart';

class NavigatorProvider with ChangeNotifier {
  final AutProvider autProvider;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigatorProvider({
    required this.autProvider,
  }) {
    _init();
  }

  @override
  void dispose() {
    autProvider.removeListener(_update);
    super.dispose();
  }

  void _init() {
    autProvider.addListener(_update);
  }

  void _update() {
    final User? user = autProvider.value;

    if (user == null) {
      navigatorKey.currentState?.pushReplacement(AutPage().createRouteNotContext());
    }
    //
    else {
      navigatorKey.currentState?.pushReplacement(LoadDataPage(user: user).createRouteNotContext());
    }
  }
}
