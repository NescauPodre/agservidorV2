// ignore_for_file: unused_local_variable

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({Key? key}) : super(key: key);

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  var selectedValue = '';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _matriculaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _secret_password = true;
  bool _secret_password_confirm = true;

  List<DropdownMenuItem<String>> get dropDownItens {
    List<DropdownMenuItem<String>> menuItens = [
      const DropdownMenuItem(
        child: Text('Selecione um Município'),
      ),
      const DropdownMenuItem(
        value: '.agape',
        child: Text('Agape'),
      ),
    ];
    return menuItens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 50),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    child: const Text(
                      'Cadastre-se',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Flexible(
                    flex: 1,
                    child: TextFormField(
                      validator: (cpf) {
                        if (cpf == null || cpf.isEmpty) {
                          return "CPF obrigatório!";
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                      maxLength: 14,
                      keyboardType: TextInputType.number,
                      controller: _cpfController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          // icon: Icon(Icons.mail),
                          prefixIcon: const Icon(Icons.mail),
                          suffixIcon: _cpfController.text.isEmpty
                              ? const Text('')
                              : GestureDetector(
                                  onTap: () {
                                    _cpfController.clear();
                                  },
                                  child: const Icon(Icons.close)),
                          hintText: '000.000.000-00',
                          labelText: 'CPF',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 1))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Flexible(
                    flex: 1,
                    child: TextFormField(
                      validator: (matricula) {
                        if (matricula == null || matricula.isEmpty) {
                          return 'Matrícula Obrigatória!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: _matriculaController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.assignment_ind_outlined),
                        suffixIcon: _matriculaController.text.isEmpty
                            ? const Text('')
                            : GestureDetector(
                                onTap: () {
                                  _matriculaController.clear();
                                },
                                child: const Icon(Icons.close),
                              ),
                        labelText: 'Matrícula',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Flexible(
                    flex: 1,
                    child: TextFormField(
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Email Obrigatório!';
                        }
                        return null;
                      },
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: _emailController.text.isEmpty
                            ? const Text('')
                            : GestureDetector(
                                onTap: () {
                                  _emailController.clear();
                                },
                                child: const Icon(Icons.close),
                              ),
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Flexible(
                    flex: 1,
                    child: TextFormField(
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Senha Obrigatória!';
                        }
                        return null;
                      },
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: _secret_password,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _secret_password = !_secret_password;
                            setState(() {});
                          },
                          child: Icon(_secret_password
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        labelText: 'Senha',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Flexible(
                    flex: 1,
                    child: TextFormField(
                      validator: (confirmPassword) {
                        if (confirmPassword == null ||
                            confirmPassword.isEmpty) {
                          return 'Confirmação de senha obrigatória!';
                        } else if (confirmPassword !=
                            _passwordController.text) {
                          return 'Confirmar senha não confere com a senha digitada!';
                        }
                        return null;
                      },
                      controller: _confirmPasswordController,
                      keyboardType: TextInputType.text,
                      obscureText: _secret_password_confirm,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _secret_password_confirm =
                                !_secret_password_confirm;
                            setState(() {});
                          },
                          child: Icon(_secret_password_confirm
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        labelText: 'Confirmar Senha',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      DropdownButtonFormField(
                        // value: selectedValue,
                        decoration: InputDecoration(
                          labelText: 'Cliente',
                          prefixIcon: const Icon(Icons.contact_page_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Colors.red, width: 1)),
                        ),
                        elevation: 2,
                        // value: ,
                        items: dropDownItens,
                        onChanged: (String? value) {
                          setState(
                            () {
                              // this.selectedValue = value;
                            },
                          );
                        },
                        validator: (cliente) {
                          if (cliente == null || cliente.toString() == '') {
                            return 'Favor selecione um cliente';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: const Text('Cadastrar'),
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
