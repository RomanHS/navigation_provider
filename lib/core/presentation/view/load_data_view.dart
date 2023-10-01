import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/domain/catalogs/product.dart';
import 'package:flutter_application_88/core/domain/documents/document.dart';
import 'package:flutter_application_88/core/domain/entity/user.dart';
import 'package:flutter_application_88/core/domain/value/data_context.dart';
import 'package:flutter_application_88/core/presentation/page/home_page.dart';

class LoadDataView extends StatefulWidget {
  final User user;

  const LoadDataView({
    super.key,
    required this.user,
  });

  @override
  State<LoadDataView> createState() => _LoadDataViewState();
}

class _LoadDataViewState extends State<LoadDataView> {
  User get user => widget.user;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    await Future.delayed(const Duration(seconds: 1));

    final DataContext dataContext = DataContext(
      documents: List.generate(100, (int i) => Document(uid: '${i + 1}')),
      products: List.generate(100, (int i) => Product(uid: '${i + 1}', l: 0)),
    );

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        HomePage(
          user: user,
          dataContext: dataContext,
        ).createRoute(context),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
