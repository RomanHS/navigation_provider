import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeNotifierProviderGetOrCreate<T extends ChangeNotifier?> extends ChangeNotifierProvider<T> {
  ChangeNotifierProviderGetOrCreate({
    Key? key,
    required Create<T> create,
    bool? lazy,
    TransitionBuilder? builder,
    Widget? child,
  }) : super(
          key: key,
          create: create,
          lazy: lazy,
          builder: builder,
          child: child,
        );
}
