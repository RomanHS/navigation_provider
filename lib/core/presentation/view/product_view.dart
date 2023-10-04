import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/domain/catalogs/product.dart';
import 'package:flutter_application_88/core/presentation/widget_model/product_widget_model.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductWidgetModel productWidgetModel = context.watch();

    final Product product = productWidgetModel.value;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: InkWell(
          onTap: productWidgetModel.click,
          child: Text(product.l.toString()),
        ),
      ),
    );
  }
}
