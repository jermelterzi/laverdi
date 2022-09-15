import 'package:brasil_fields/brasil_fields.dart';
import 'package:laverdi/src/features/user/value_objects/value_object.dart';

class Cep implements ValueObject {
  final String _value;

  Cep(this._value);

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'O CEP deve ser inserido';
    }
    return null;
  }

  @override
  String toString() => _value;
}
