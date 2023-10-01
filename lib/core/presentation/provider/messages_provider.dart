import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/domain/entity/user.dart';
import 'package:flutter_application_88/core/domain/value/data_context.dart';

class MessagesProvider with ChangeNotifier {
  final User user;
  final DataContext dataContext;

  MessagesProvider({
    required this.user,
    required this.dataContext,
  });
}
