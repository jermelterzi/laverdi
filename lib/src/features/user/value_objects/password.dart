import 'package:laverdi/src/features/user/value_objects/value_object.dart';

class Password implements ValueObject {
  final String _value;

  Password(this._value);

  @override
  String? validator() {
    if (_value.isEmpty) {
      return 'A senha deve ser inserida';
    }
    return null;
  }

  @override
  String toString() => _value;
}
