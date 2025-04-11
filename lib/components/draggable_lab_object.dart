import 'package:flutter/material.dart';

class DraggableLabObject extends StatelessWidget {
  final String imagePath;
  final String label;
  final String data;

  const DraggableLabObject({
    super.key,
    required this.imagePath,
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: data,
      feedback: Image.asset(imagePath, width: 60),
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: Column(children: [Image.asset(imagePath, width: 60), Text(label)]),
      ),
      child: Column(children: [Image.asset(imagePath, width: 60), Text(label)]),
    );
  }
}
