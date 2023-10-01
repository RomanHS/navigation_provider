import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/domain/entity/user.dart';
import 'package:flutter_application_88/core/domain/value/data_context.dart';
import 'package:flutter_application_88/core/presentation/provider/documents_provider.dart';
import 'package:flutter_application_88/core/presentation/provider/important_messages_provider.dart';
import 'package:flutter_application_88/core/presentation/provider/messages_provider.dart';
import 'package:flutter_application_88/core/presentation/provider/products_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class HomeProviders {
  static List<SingleChildWidget> create({
    required User user,
    required DataContext dataContext,
  }) =>
      [
        ///
        ChangeNotifierProvider(
          create: (BuildContext context) => DocumentsProvider(
            user: user,
            dataContext: dataContext,
          ),
        ),

        ///
        ChangeNotifierProvider(
          create: (BuildContext context) => MessagesProvider(
            user: user,
            dataContext: dataContext,
          ),
        ),

        ///
        ChangeNotifierProvider(
          create: (BuildContext context) => ImportantMessagesProvider(
            context: context,
          ),
        ),

        ///
        ChangeNotifierProvider(
          create: (BuildContext context) => ProductsProvider(
            user: user,
            dataContext: dataContext,
          ),
        ),
      ];

  static List<SingleChildWidget> of(BuildContext context) => [
        ///
        ChangeNotifierProvider.value(
          value: context.read<DocumentsProvider>(),
        ),

        ///
        ChangeNotifierProvider.value(
          value: context.read<MessagesProvider>(),
        ),

        ///
        ChangeNotifierProvider.value(
          value: context.read<ImportantMessagesProvider>(),
        ),

        ///
        ChangeNotifierProvider.value(
          value: context.read<ProductsProvider>(),
        ),
      ];
}
