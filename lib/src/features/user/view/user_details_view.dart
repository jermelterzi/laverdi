import 'dart:developer';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laverdi/src/features/user/components/laverdi_dropdown_field.dart';
import 'package:laverdi/src/features/user/components/laverdi_text_field.dart';
import 'package:laverdi/src/features/user/data/countries_list.dart';

import '../entities/user.dart';

class UserDetailsView extends StatefulWidget {
  final User? user;

  const UserDetailsView({
    super.key,
    this.user,
  });

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  final _formKey = GlobalKey<FormState>();
  FormState get form => _formKey.currentState!;

  late User user;

  @override
  void initState() {
    super.initState();
    user = widget.user ?? User.empty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Cadastro')),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/laverdi_background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Center(
                        child: FormField(
                          validator: (value) => null,
                          builder: (field) {
                            return Column(
                              children: [
                                CircleAvatar(
                                  radius: 80,
                                  backgroundImage: const AssetImage(
                                      'assets/images/laverdi_logo.png'),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                ),
                                if (field.hasError) Text(field.errorText ?? ''),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 7,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(32.0)),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            LaverdiTextField(
                              value: user.name.toString(),
                              label: 'Nome',
                              hint: 'Nome Completo',
                              validator: (_) => user.name.validator(),
                              onChanged: user.setName,
                            ),
                            const SizedBox(height: 8.0),
                            LaverdiTextField(
                              value: user.email.toString(),
                              label: 'E-mail',
                              hint: 'exemplo@laverdi.com',
                              validator: (_) => user.email.validator(),
                              onChanged: user.setEmail,
                            ),
                            const SizedBox(height: 8.0),
                            LaverdiTextField(
                              value: user.phone.toString(),
                              label: 'Celular',
                              hint: '(11) 99999-9999',
                              validator: (_) => user.phone.validator(),
                              onChanged: user.setPhone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter(),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            LaverdiTextField(
                              value: user.cpf.toString(),
                              label: 'CPF',
                              hint: '123.456.789-00',
                              validator: (_) => user.cpf.validator(),
                              onChanged: user.setCpf,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CpfInputFormatter(),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            LaverdiDropdownField(
                              value: user.country.toString(),
                              items: countries,
                              hint: 'Selecione o país',
                              validator: (_) => user.country.validator(),
                              onChanged: user.setCountry,
                            ),
                            const SizedBox(height: 8.0),
                            LaverdiTextField(
                              value: user.cep.toString(),
                              label: 'Código Postal',
                              hint: '01234-567',
                              validator: (_) => user.cep.validator(),
                              onChanged: user.setAddress,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CepInputFormatter(),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            SwitchListTile(
                              value: user.isAlergic,
                              title: const Text('É alérgico a algum alimento?'),
                              onChanged: user.setIsAlergic,
                            ),
                            const SizedBox(height: 8.0),
                            SwitchListTile(
                              value: user.isLac,
                              title: const Text('É intolerante a lactose?'),
                              onChanged: user.setIsLac,
                            ),
                            const SizedBox(height: 8.0),
                            SwitchListTile(
                              value: user.isVeg,
                              title: const Text('É vegetariano?'),
                              onChanged: user.setIsVeg,
                            ),
                            const SizedBox(height: 8.0),
                            SwitchListTile(
                              value: user.isVegan,
                              title: const Text('É vegano?'),
                              onChanged: user.setIsVegan,
                            ),
                            const SizedBox(height: 16.0),
                            Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  flex: 10,
                                  child: SizedBox(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size.fromHeight(48),
                                        backgroundColor: Colors.white,
                                        elevation: 0,
                                        foregroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        side: BorderSide(
                                          width: 2.0,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text('CANCELAR'),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 10,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size.fromHeight(48),
                                      elevation: 0,
                                    ),
                                    onPressed: () {
                                      final valid = form.validate();

                                      if (!valid) {
                                        _showSnackbarError(
                                          'Existem campos inválidos!',
                                        );
                                        return;
                                      }

                                      if (user.id == -1) {
                                        log('Usuário criado com sucesso!');
                                        log(user.toString());
                                      } else {
                                        log('Usuário editado com sucesso!');
                                        log(user.toString());
                                      }
                                    },
                                    child: const Text('SALVAR'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackbarError(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
