import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/domain/entity/user.dart';
import 'package:flutter_application_88/core/domain/value/data_context.dart';
import 'package:flutter_application_88/core/presentation/app/home_providers.dart';
import 'package:flutter_application_88/core/presentation/page/documents_page.dart';
import 'package:flutter_application_88/core/presentation/page/products_page.dart';
import 'package:flutter_application_88/core/presentation/widget/exit_widget.dart';
import 'package:flutter_application_88/core/presentation/widget/important_messages_widget.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView._();

  static Widget create({
    required User user,
    required DataContext dataContext,
  }) =>
      MultiProvider(
        providers: HomeProviders.create(
          user: user,
          dataContext: dataContext,
        ),
        child: const HomeView._(),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Home'),
            actions: const [
              ExitWidget(),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///
                TextButton(
                  onPressed: () => Navigator.push(context, ProductsPage().createRoute(context)),
                  child: const Text('Products'),
                ),

                ///
                TextButton(
                  onPressed: () => Navigator.push(context, DocumentsPage().createRoute(context)),
                  child: const Text('Documents'),
                ),
              ],
            ),
          ),
        ),

        ///
        const ImportantMessagesWidget(),
      ],
    );
  }
}
