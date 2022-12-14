import 'package:laverdi/src/features/user/value_objects/country.dart';
import 'package:laverdi/src/features/user/value_objects/cpf.dart';
import 'package:laverdi/src/features/user/value_objects/email.dart';
import 'package:laverdi/src/features/user/value_objects/name.dart';
import 'package:laverdi/src/features/user/value_objects/password.dart';
import 'package:laverdi/src/features/user/value_objects/phone.dart';
import 'package:laverdi/src/features/user/value_objects/postal_code.dart';

class User {
  User({
    required this.id,
    this.registeredAt,
    required String name,
    required String email,
    required String phone,
    required String cep,
    required String country,
    required String cpf,
    required String password,
    required bool isAlergic,
    required bool isVeg,
    required bool isVegan,
    required bool isLac,
  })  : _name = Name(name),
        _email = Email(email),
        _phone = Phone(phone),
        _cep = PostalCode(cep),
        _country = Country(country),
        _cpf = Cpf(cpf),
        _password = Password(password),
        _isAlergic = isAlergic,
        _isVeg = isVeg,
        _isVegan = isVegan,
        _isLac = isLac;

  factory User.empty() {
    return User(
      id: '-1',
      name: '',
      email: '',
      phone: '',
      cep: '',
      country: '',
      cpf: '',
      password: '',
      isAlergic: false,
      isVeg: false,
      isVegan: false,
      isLac: false,
    );
  }

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      id: data['id'] as String,
      registeredAt: data['registeredAt'] != null
          ? DateTime.parse(data['registeredAt'] as String)
          : null,
      name: data['name'] as String,
      email: data['email'] as String,
      phone: data['phone'] as String,
      cep: data['cep'] as String,
      country: data['country'] as String,
      cpf: data['cpf'] as String,
      password: data['password'] as String,
      isAlergic: data['isAlergic'] as bool,
      isVeg: data['isVeg'] as bool,
      isVegan: data['isVegan'] as bool,
      isLac: data['isLac'] as bool,
    );
  }

  String id;
  DateTime? registeredAt;
  Name _name;
  Email _email;
  Phone _phone;
  PostalCode _cep;
  Country _country;
  Cpf _cpf;
  Password _password;
  bool _isAlergic;
  bool _isVeg;
  bool _isVegan;
  bool _isLac;

  Name get name => _name;
  void setName(String? value) => _name = Name(value ?? '');

  Email get email => _email;
  void setEmail(String? value) => _email = Email(value ?? '');

  Phone get phone => _phone;
  void setPhone(String? value) => _phone = Phone(value ?? '');

  PostalCode get cep => _cep;
  void setAddress(String? value) => _cep = PostalCode(value ?? '');

  Country get country => _country;
  void setCountry(String? value) => _country = Country(value ?? '');

  Cpf get cpf => _cpf;
  void setCpf(String? value) => _cpf = Cpf(value ?? '');

  Password get password => _password;
  void setPassword(String? value) => _password = Password(value ?? '');

  bool get isAlergic => _isAlergic;
  void setIsAlergic({bool? value}) => _isAlergic = value ?? false;

  bool get isVeg => _isVeg;
  void setIsVeg({bool? value}) => _isVeg = value ?? false;

  bool get isVegan => _isVegan;
  void setIsVegan({bool? value}) => _isVegan = value ?? false;

  bool get isLac => _isLac;
  void setIsLac({bool? value}) => _isLac = value ?? false;

  Map<String, dynamic> toJson() {
    return {
      if (id != '-1') 'id': id,
      if (registeredAt != null) 'registeredAt': registeredAt!.toIso8601String(),
      'name': name.toString(),
      'email': email.toString(),
      'phone': phone.toString(),
      'cep': cep.toString(),
      'country': country.toString(),
      'cpf': cpf.toString(),
      'password': password.toString(),
      'isAlergic': isAlergic,
      'isVeg': isVeg,
      'isVegan': isVegan,
      'isLac': isLac,
    };
  }

  @override
  String toString() {
    return '''
    Nome: $_name, 
    E-mail: $_email,
    Celular: $_phone, 
    CEP: $_cep,
    Pa??s: $_country,
    CPF: $_cpf,
    Al??rgico: $_isAlergic,
    Vegetariano: $_isVeg,
    Vegano: $_isVegan,
    Intolerante: $_isLac,''';
  }
}
