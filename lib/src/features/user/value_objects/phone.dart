import 'package:laverdi/src/features/user/value_objects/value_object.dart';

class Phone implements ValueObject {
  final String _value;

  Phone(this._value);

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'O Telefone deve ser inserido';
    }
    return null;
  }

  @override
  String toString() => _value;
}
