import 'package:flutter/material.dart';

class TextFormField1 extends StatelessWidget {
  final TextEditingController textEditingController;
  final String text;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;

  const TextFormField1(
      {Key? key,
      required this.textEditingController,
      required this.text,
      this.obscureText = false,
      this.enableSuggestions = true,
      this.autocorrect = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(13),
        hintText: text,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      textInputAction: TextInputAction.next,
    );
  }
}