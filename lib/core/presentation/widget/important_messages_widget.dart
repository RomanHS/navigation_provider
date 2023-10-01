import 'package:flutter/material.dart';
import 'package:flutter_application_88/core/presentation/provider/important_messages_provider.dart';
import 'package:flutter_application_88/main.dart';
import 'package:provider/provider.dart';

class ImportantMessagesWidget extends StatelessWidget {
  const ImportantMessagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (isImportantMessages == false) {
      return const SizedBox();
    }

    final ImportantMessagesProvider importantMessagesProvider = context.watch();

    final Offset offset = importantMessagesProvider.offset;

    final Size sizeButton = importantMessagesProvider.sizeButton;

    return Positioned(
      left: offset.dx,
      top: offset.dy,
      // child: Material(
      //   color: Colors.transparent,
      //   child: InsertsWidget(),
      // ),
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails d) {
          importantMessagesProvider.setOffset(d);
        },
        child: Material(
          color: Colors.transparent,
          child: Container(
            color: Colors.red,
            width: sizeButton.width,
            height: sizeButton.height,
            child: const Center(
              child: IconButton(
                onPressed: null,
                iconSize: 30,
                icon: Icon(
                  // Icons.help,
                  Icons.message,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
