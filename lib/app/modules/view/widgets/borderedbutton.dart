import 'package:flutter/material.dart';
import 'package:pazar_iraq/app/core/constants.dart';

class BorderedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback function;
  const BorderedButton({Key? key, required this.buttonText, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width:deviceWidth,
        padding: const EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child:  Text(
          buttonText,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
