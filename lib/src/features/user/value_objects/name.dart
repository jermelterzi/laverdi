import 'package:laverdi/src/features/user/value_objects/value_object.dart';

class Name implements ValueObject {
  Name(this._value);

  final String _value;

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'O Nome deve ser inserido';
    }

    if (_value.split(' ').length < 2) {
      return 'O Nome precisa ter um sobrenome';
    }
    return null;
  }

  @override
  String toString() => _value;
}
