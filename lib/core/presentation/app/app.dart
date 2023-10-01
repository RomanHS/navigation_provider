import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/domain/entity/user.dart';
import 'package:flutter_application_88/core/presentation/provider/aut_provider.dart';
import 'package:flutter_application_88/core/presentation/provider/navigator_provider.dart';
import 'package:flutter_application_88/core/presentation/view/aut_view.dart';
import 'package:flutter_application_88/core/presentation/view/load_data_view.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App._();

  static Widget create({
    required User? user,
  }) =>
      MultiProvider(
        providers: [
          ///
          ChangeNotifierProvider(
            create: (BuildContext context) => AutProvider(user),
          ),

          ///
          ChangeNotifierProvider(
            create: (BuildContext context) => NavigatorProvider(
              autProvider: context.read(),
            ),
          ),
        ],
        child: const App._(),
      );

  @override
  Widget build(BuildContext context) {
    final AutProvider autProvider = context.read();
    final NavigatorProvider navigatorProvider = context.read();

    final User? user = autProvider.value;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorProvider.navigatorKey,
      home: user == null ? AutView.create() : LoadDataView(user: user),
    );
  }
}
