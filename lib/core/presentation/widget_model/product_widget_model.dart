import 'package:flutter_application_88/core/domain/catalogs/product.dart';
import 'package:flutter_application_88/core/presentation/app/state_notifier.dart';

class ProductWidgetModel extends StateNotifier<Product> {
  ProductWidgetModel({
    required Product product,
  }) : super(product.uid, product);

  void click() {
    value = value.plus();
  }
}
