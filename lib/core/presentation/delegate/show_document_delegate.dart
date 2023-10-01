import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_88/core/domain/documents/document.dart';
import 'package:flutter_application_88/core/presentation/app/home_providers.dart';
import 'package:flutter_application_88/core/presentation/provider/documents_provider.dart';

class ShowDocumentDelegate extends SearchDelegate<void> {
  final BuildContext context;

  ShowDocumentDelegate({
    required this.context,
  });

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) => _build(context);

  @override
  Widget buildSuggestions(BuildContext context) => _build(context);

  Widget _build(BuildContext context) => MultiProvider(
        providers: HomeProviders.of(this.context),
        builder: (BuildContext context, Widget? child) => __build(context),
      );

  Widget __build(BuildContext context) {
    final DocumentsProvider documentsProvider = context.watch();

    final String s = query.toLowerCase();

    final List<Document> documents = documentsProvider.documents.where((Document element) => element.uid.toLowerCase().contains(s)).toList();

    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (BuildContext context, int i) {
        final Document document = documents[i];

        return Card(
          child: ListTile(
            title: Text('Document №${document.uid}'),
          ),
        );
      },
    );
  }
}
