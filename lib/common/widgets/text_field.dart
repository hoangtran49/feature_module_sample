import 'package:flutter/material.dart';

// ignore: inference_failure_on_function_return_type
typedef OnChangeText = Function(String value);

class TextFieldCustome extends StatelessWidget {
  const TextFieldCustome({super.key, this.onChangeText});

  final OnChangeText? onChangeText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChangeText,
      decoration: const InputDecoration(
        label: Text('Text'),
      ),
    );
  }
}
