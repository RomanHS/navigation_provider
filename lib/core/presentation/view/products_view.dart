import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/domain/catalogs/product.dart';
import 'package:flutter_application_88/core/presentation/app/state_notifier.dart';
import 'package:flutter_application_88/core/presentation/provider/products_provider.dart';
import 'package:flutter_application_88/core/presentation/widget/important_messages_widget.dart';
import 'package:flutter_application_88/core/presentation/widget_model/product_widget_model.dart';
import 'package:provider/provider.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsProvider productsProvider = context.watch();

    final List<Product> products = productsProvider.products;

    Widget body() {
      return ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int i) {
          final Product product = products[i];

          return ChangeNotifierProvider(
            create: (BuildContext context) => StateNotifier.getOrCreate<ProductWidgetModel>(
              key: product.uid,
              create: () => ProductWidgetModel(product: product),
            ),
            builder: (BuildContext context, Widget? _) {
              final ProductWidgetModel productWidgetModel = context.watch();
              final Product product = productWidgetModel.value;

              return Card(
                child: ListTile(
                  title: Text('Product №${product.uid}'),
                  subtitle: Text(product.l.toString()),
                  onTap: productWidgetModel.click,
                ),
              );
            },
          );
        },
      );
    }

    return Stack(
      children: [
        ///
        Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Expanded(child: body()),
              Expanded(child: body()),
            ],
          ),
        ),

        ///
        const ImportantMessagesWidget(),
      ],
    );
  }
}
