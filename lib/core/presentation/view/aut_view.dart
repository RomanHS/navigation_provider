import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/presentation/state/aut_state.dart';
import 'package:flutter_application_88/core/presentation/view_model/aut_view_model.dart';
import 'package:provider/provider.dart';

class AutView extends StatelessWidget {
  const AutView._();

  static Widget create() => MultiProvider(
        ///
        providers: [
          ///
          ChangeNotifierProvider(
            create: (BuildContext context) => AutViewModel(
              autProvider: context.read(),
            ),
          ),
        ],

        ///
        child: const AutView._(),
      );

  @override
  Widget build(BuildContext context) {
    final AutViewModel autViewModel = context.watch();
    final AutState state = autViewModel.value;

    return Scaffold(
      ///
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Aut'),
      ),

      ///
      body: Center(
        child: switch (state) {
          ///
          AutNotUserState() => TextButton(
              onPressed: () => autViewModel.aut(),
              child: const Text('Aut'),
            ),

          ///
          AutLoadState() => const CircularProgressIndicator()
        },
      ),
    );
  }
}
