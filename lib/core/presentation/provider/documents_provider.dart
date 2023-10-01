import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/domain/documents/document.dart';
import 'package:flutter_application_88/core/domain/entity/user.dart';
import 'package:flutter_application_88/core/domain/value/data_context.dart';

class DocumentsProvider with ChangeNotifier {
  final User user;
  final DataContext dataContext;

  DocumentsProvider({
    required this.user,
    required this.dataContext,
  });

  List<Document> get documents => dataContext.documents;

  void myyyy() {
    notifyListeners();
  }
}
