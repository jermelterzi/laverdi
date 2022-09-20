import 'package:laverdi/src/features/user/value_objects/value_object.dart';
import 'package:string_validator/string_validator.dart' as string_validator;

class Email implements ValueObject {
  final String _value;

  Email(this._value);

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'O E-mail deve ser preenchido';
    }

    if (!string_validator.isEmail(_value)) {
      return 'Insira um e-mail válido';
    }
    return null;
  }

  @override
  String toString() => _value;
}
