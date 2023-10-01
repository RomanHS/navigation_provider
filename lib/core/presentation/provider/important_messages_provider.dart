import 'dart:math' as math;
import 'package:flutter/material.dart';

class ImportantMessagesProvider with ChangeNotifier {
  final BuildContext context;

  late final Size size = MediaQuery.of(context).size;

  final Size sizeButton = const Size(100, 100);

  late Offset _offset = Offset(size.width / 2 - sizeButton.width / 2, size.height - sizeButton.height);

  ImportantMessagesProvider({
    required this.context,
  });

  Offset get offset => _offset;

  void setOffset(DragUpdateDetails d) {
    double x = math.max<double>(0, _offset.dx + d.delta.dx);

    x = math.min(x, size.width - sizeButton.width);

    double y = math.max<double>(0, _offset.dy + d.delta.dy);

    y = math.min(y, size.height - sizeButton.height);

    _offset = Offset(x, y);

    notifyListeners();
  }
}
