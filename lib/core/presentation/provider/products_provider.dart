import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/domain/catalogs/product.dart';
import 'package:flutter_application_88/core/domain/entity/user.dart';
import 'package:flutter_application_88/core/domain/value/data_context.dart';

class ProductsProvider with ChangeNotifier {
  final User user;
  final DataContext dataContext;

  ProductsProvider({
    required this.user,
    required this.dataContext,
  });

  List<Product> get products => dataContext.products;
}
