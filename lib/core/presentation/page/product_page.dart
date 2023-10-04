import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/domain/catalogs/product.dart';
import 'package:flutter_application_88/core/presentation/app/home_providers.dart';
import 'package:flutter_application_88/core/presentation/app/state_notifier.dart';
import 'package:flutter_application_88/core/presentation/view/product_view.dart';
import 'package:flutter_application_88/core/presentation/widget_model/product_widget_model.dart';
import 'package:provider/provider.dart';

class ProductPage extends Page<void> {
  final Product product;

  const ProductPage({
    required this.product,
  });

  @override
  Route<void> createRoute(BuildContext context) => MaterialPageRoute<void>(
        builder: (BuildContext _) => MultiProvider(
          providers: [
            ///
            ...HomeProviders.of(context),

            ///
            ChangeNotifierProvider(
              create: (BuildContext context) => StateNotifier.getOrCreate<ProductWidgetModel>(
                key: product.uid,
                create: () => ProductWidgetModel(product: product),
              ),
            ),
          ],
          child: const ProductView(),
        ),
      );
}
