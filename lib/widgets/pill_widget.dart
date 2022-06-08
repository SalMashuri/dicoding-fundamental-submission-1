import 'dart:math';

import 'package:flutter/material.dart';

class PillWidget extends StatelessWidget {
  final String text;

  const PillWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: generateRandomColor(),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
          overflow: TextOverflow.clip,
          maxLines: 1,
        ),
      ),
    );
  }

  Color generateRandomColor() =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
