import 'dart:developer';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laverdi/src/features/user/components/edit_text_field.dart';

import '../entities/user.dart';

class UserDetailsScreen extends StatefulWidget {
  final User? user;

  const UserDetailsScreen({
    super.key,
    this.user,
  });

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
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
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          const AssetImage('assets/images/laverdi_logo.png'),
                      backgroundColor: Theme.of(context).colorScheme.primary,
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
                      children: [
                        EditTextField(
                          value: user.name.toString(),
                          label: 'Nome',
                          hint: 'Nome Completo',
                          validator: (_) => user.name.validator(),
                          onChanged: user.setName,
                        ),
                        const SizedBox(height: 8.0),
                        EditTextField(
                          value: user.email.toString(),
                          label: 'E-mail',
                          hint: 'exemplo@laverdi.com',
                          validator: (_) => user.email.validator(),
                          onChanged: user.setEmail,
                        ),
                        const SizedBox(height: 8.0),
                        EditTextField(
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
                        EditTextField(
                          value: user.cep.toString(),
                          label: 'CEP',
                          hint: '01234-567',
                          validator: (_) => user.cep.validator(),
                          onChanged: user.setAddress,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CepInputFormatter(),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        EditTextField(
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
                                    foregroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    side: BorderSide(
                                      width: 2.0,
                                      color:
                                          Theme.of(context).colorScheme.primary,
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

                                  if (valid) {
                                    log('Usuário salvo com sucesso!');
                                    log(user.toString());
                                  } else {
                                    log('Erro ao salvar!');
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
    );
  }
}
