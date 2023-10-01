import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/domain/documents/document.dart';
import 'package:flutter_application_88/core/presentation/delegate/show_document_delegate.dart';
import 'package:flutter_application_88/core/presentation/provider/documents_provider.dart';
import 'package:flutter_application_88/core/presentation/widget/important_messages_widget.dart';
import 'package:provider/provider.dart';

class DocumentsView extends StatelessWidget {
  const DocumentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final DocumentsProvider documentsProvider = context.watch();

    final List<Document> documents = documentsProvider.documents;

    return Stack(
      children: [
        ///
        Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: ShowDocumentDelegate(context: context));
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: documents.length,
            itemBuilder: (BuildContext context, int i) {
              final Document document = documents[i];

              return Card(
                child: ListTile(
                  title: Text('Document №${document.uid}'),
                ),
              );
            },
          ),
        ),

        ///
        const ImportantMessagesWidget(),
      ],
    );
  }
}
