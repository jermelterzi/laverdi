import '../value_objects/cep.dart';
import '../value_objects/cpf.dart';
import '../value_objects/email.dart';
import '../value_objects/name.dart';
import '../value_objects/password.dart';
import '../value_objects/phone.dart';

class User {
  int id;
  DateTime? registeredAt;
  Name _name;
  Email _email;
  Phone _phone;
  Cep _cep;
  Cpf _cpf;
  Password _password;
  bool isAlergic;
  bool isVeg;
  bool isVegan;
  bool isLac;

  Name get name => _name;
  void setName(String? value) => _name = Name(value ?? '');

  Email get email => _email;
  void setEmail(String? value) => _email = Email(value ?? '');

  Phone get phone => _phone;
  void setPhone(String? value) => _phone = Phone(value ?? '');

  Cpf get cpf => _cpf;
  void setCpf(String? value) => _cpf = Cpf(value ?? '');

  Cep get cep => _cep;
  void setAddress(String? value) => _cep = Cep(value ?? '');

  Password get password => _password;
  void setPassword(String? value) => _password = Password(value ?? '');

  User({
    required this.id,
    this.registeredAt,
    required String name,
    required String email,
    required String phone,
    required String cep,
    required String cpf,
    required String password,
    required this.isAlergic,
    required this.isVeg,
    required this.isVegan,
    required this.isLac,
  })  : _name = Name(name),
        _email = Email(email),
        _phone = Phone(phone),
        _cep = Cep(cep),
        _cpf = Cpf(cpf),
        _password = Password(password);

  factory User.empty() {
    return User(
      id: -1,
      name: '',
      email: '',
      phone: '',
      cep: '',
      cpf: '',
      password: '',
      isAlergic: false,
      isVeg: false,
      isVegan: false,
      isLac: false,
    );
  }

  static User fromJson(dynamic data) {
    return User(
      id: data['id'],
      registeredAt: data['registeredAt'],
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
      cep: data['cep'],
      cpf: data['cpf'],
      password: data['password'],
      isAlergic: data['isAlergic'],
      isVeg: data['isVeg'],
      isVegan: data['isVegan'],
      isLac: data['isLac'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != -1) 'id': id,
      if (registeredAt != null) 'registeredAt': registeredAt!.toIso8601String(),
      'name': name.toString(),
      'email': email.toString(),
      'phone': phone.toString(),
      'cep': cep.toString(),
      'cpf': cpf.toString(),
      'password': password.toString(),
      'isAlergic': isAlergic,
      'isVeg': isVeg,
      'isVegan': isVegan,
      'isLac': isLac,
    };
  }
}
