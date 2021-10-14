import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final keyboardType;
  final int? maxLines;
  const FieldWidget({Key? key, required this.title, this.controller, this.keyboardType, this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
          controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
            hintText: title,
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
          ),))
    );
  }
}
