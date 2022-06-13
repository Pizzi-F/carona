// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:carona/pages/cadastro.dart';
import 'package:carona/pages/menu.dart';
import 'package:carona/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _form1 = GlobalKey<FormState>();
final _form2 = GlobalKey<FormState>();
final email = TextEditingController();
final senha = TextEditingController();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Form(
                  key: _form1,
                  child: TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: _form2,
                  child: TextFormField(
                    controller: senha,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: Text('Entrar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Cadastro(),
                        ));
                  },
                  child: Text('Cadastrar'),
                ),
              ]),
        ),
      ),
    );
  }

  login() async {
    try {
      await context.read<AuthService>().login(email.text, senha.text);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Bem Vindo ' + email.text)));
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Menu(),
          ));
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
