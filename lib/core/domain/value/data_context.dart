import 'package:flutter_application_88/core/domain/catalogs/product.dart';
import 'package:flutter_application_88/core/domain/documents/document.dart';

class DataContext {
  final List<Document> documents;
  final List<Product> products;

  DataContext({
    required this.documents,
    required this.products,
  });
}
