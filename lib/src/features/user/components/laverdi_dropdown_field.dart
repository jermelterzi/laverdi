import 'package:flutter/material.dart';

class LaverdiDropdownField extends StatelessWidget {
  final String value;
  final List<String> items;
  final String hint;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const LaverdiDropdownField({
    super.key,
    required this.value,
    required this.items,
    required this.hint,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value.isEmpty ? null : value,
      hint: Text(hint),
      decoration: const InputDecoration(),
      items: items
          .map(
            (country) => DropdownMenuItem<String>(
              value: country,
              child: Text(country),
            ),
          )
          .toList(),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
