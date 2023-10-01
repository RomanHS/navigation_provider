import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/presentation/app/home_providers.dart';
import 'package:flutter_application_88/core/presentation/view/documents_view.dart';
import 'package:provider/provider.dart';

class DocumentsPage extends Page<void> {
  @override
  Route<void> createRoute(BuildContext context) => MaterialPageRoute<void>(
        builder: (BuildContext _) => MultiProvider(
          providers: HomeProviders.of(context),
          child: const DocumentsView(),
        ),
      );
}
