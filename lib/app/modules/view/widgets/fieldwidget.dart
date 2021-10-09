import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  const FieldWidget( {Key? key, required this.title, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(

            controller: controller,
            decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true))
      ],
    ),
  )
    ;
  }
}
