import 'package:brasil_fields/brasil_fields.dart';
import 'package:laverdi/src/features/user/value_objects/value_object.dart';

class Cpf implements ValueObject {
  final String _value;

  Cpf(this._value);

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'O CPF deve ser inserido';
    }

    if (!UtilBrasilFields.isCPFValido(_value)) {
      return 'Insira um CPF válido';
    }
    return null;
  }

  @override
  String toString() => _value;
}
