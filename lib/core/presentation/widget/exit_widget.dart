import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/presentation/provider/aut_provider.dart';
import 'package:provider/provider.dart';

class ExitWidget extends StatelessWidget {
  const ExitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final AutProvider autProvider = context.read();
        autProvider.exit();
      },
      icon: const Icon(Icons.exit_to_app),
    );
  }
}
