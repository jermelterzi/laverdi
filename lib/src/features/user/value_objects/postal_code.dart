import 'package:laverdi/src/features/user/value_objects/value_object.dart';

class PostalCode implements ValueObject {
  final String _value;

  PostalCode(this._value);

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'O código postal deve ser inserido';
    }
    return null;
  }

  @override
  String toString() => _value;
}
