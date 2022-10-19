import 'package:laverdi/src/features/user/value_objects/value_object.dart';

class Country extends ValueObject {
  Country(this._value);

  final String _value;

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'O país deve ser preenchido';
    }
    return null;
  }

  @override
  String toString() => _value;
}
