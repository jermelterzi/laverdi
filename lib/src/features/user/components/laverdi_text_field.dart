import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LaverdiTextField extends StatelessWidget {
  const LaverdiTextField({
    super.key,
    required this.value,
    required this.label,
    this.hint,
    this.onChanged,
    this.validator,
    this.inputFormatters,
  });

  final String value;
  final String label;
  final String? hint;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black38,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      inputFormatters: inputFormatters,
    );
  }
}
