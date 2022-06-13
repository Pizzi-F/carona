// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carona/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

final _form = GlobalKey<FormState>();
final _form2 = GlobalKey<FormState>();
final _form3 = GlobalKey<FormState>();
final _form4 = GlobalKey<FormState>();
final _form5 = GlobalKey<FormState>();
final _form6 = GlobalKey<FormState>();
final _form7 = GlobalKey<FormState>();

final _nome = TextEditingController();
final _email = TextEditingController();
final _carro = TextEditingController();
final _placa = TextEditingController();
final _cor = TextEditingController();
final _senha = TextEditingController();
final _conf_senha = TextEditingController();

late String senha;

class Cadastro extends StatefulWidget {
  Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                /*Form(
                  key: _form,
                  child: TextFormField(
                    controller: _nome,
                    keyboardType: TextInputType.name,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp("[0-9]"))
                    ],
                    decoration: InputDecoration(
                      labelText: 'Nome Completo',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe seu Nome';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),*/

                Form(
                  key: _form2,
                  child: TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe seu Email';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 20),

                /*Form(
                  key: _form3,
                  child: TextFormField(
                    controller: _carro,
                    decoration: InputDecoration(
                      labelText: 'Carro',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe o Carro';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),

                Form(
                  key: _form4,
                  child: TextFormField(
                    controller: _placa,
                    decoration: InputDecoration(
                      labelText: 'Placa',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe a Placa';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),

                Form(
                  key: _form5,
                  child: TextFormField(
                    controller: _cor,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp("[0-9]"))
                    ],
                    decoration: InputDecoration(
                      labelText: 'Cor',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe a Cor';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),*/

                Form(
                  key: _form6,
                  child: TextFormField(
                    controller: _senha,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe a Senha';
                      }
                      senha = value;
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),

                Form(
                  key: _form7,
                  child: TextFormField(
                    controller: _conf_senha,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirmação de Senha',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Confirme a Senha';
                      } else if (value != senha) {
                        return 'Senhas Diferentes!';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),

                //BOTAO
                ElevatedButton(
                  onPressed: () {
                    if (_form2.currentState!.validate() &&
                        _form6.currentState!.validate() &&
                        _form7.currentState!.validate()) {
                      regristrar();
                    }
                  },
                  child: Text('Cadastrar'),
                ),
              ]),
        ),
      ),
    );
  }

  regristrar() async {
    try {
      await context.read<AuthService>().registrar(_email.text, _senha.text);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cadastro Realizado com Sucesso')));
      Navigator.pop(context);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
