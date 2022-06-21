// ignore_for_file: prefer_const_constructors

import 'package:carona/models/motorista.dart';
import 'package:carona/repositories/caronas_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carona/models/carona_repositorio.dart';
import 'package:provider/provider.dart';
import '../models/carona.dart';
import 'package:carona/pages/menu.dart';
import 'package:brasil_fields/brasil_fields.dart';

final _form = GlobalKey<FormState>();
final _form2 = GlobalKey<FormState>();
final _form3 = GlobalKey<FormState>();
final _form4 = GlobalKey<FormState>();
final _form5 = GlobalKey<FormState>();
final _form6 = GlobalKey<FormState>();
final _form7 = GlobalKey<FormState>();
final _form8 = GlobalKey<FormState>();
final _form9 = GlobalKey<FormState>();

class DarCarona extends StatefulWidget {
  DarCarona({Key? key, }) : super(key: key);
  static List<Carona> caronas = [];
  late CaronasRepository caro;

  @override
  State<DarCarona> createState() => _DarCaronaState();
}

class _DarCaronaState extends State<DarCarona> {
  late String nome;
  late double preco;
  late int vagas;
  late String destino;
  late String carro;
  late String cor;
  late String placa;
  late String data;
  late String horario;
  late CaronasRepository caro;
  int ra = 1650920;

  static List<Carona> caronas = [];



  @override
  Widget build(BuildContext context) {
    //caro = Provider.of<CaronasRepository>(context);
    caro = context.watch<CaronasRepository>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Dar Carona'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Form(
                  key: _form,
                  child: TextFormField(
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
                      nome = value;
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: _form2,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Preço',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                        //prefixIcon: Icon(Icons.monetization_on_outlined),
                        suffix:Text(
                          'reais',
                          style: TextStyle(fontSize: 11),
                        )
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe o Preço';
                      }
                      preco = double.parse(value);
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: _form3,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Vagas',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe o Número de Vagas';
                      }
                      vagas = int.parse(value);
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: _form4,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp("[0-9]"))
                    ],
                    decoration: InputDecoration(
                      labelText: 'Destino',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe o Destino';
                      }
                      destino = value;
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: _form5,
                  child: TextFormField(
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
                      carro = value;
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: _form6,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
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
                      cor = value;
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: _form7,
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,

                    decoration: InputDecoration(
                      labelText: 'Placa',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                        suffix:Text(
                          'LLL-1L11',
                          style: TextStyle(fontSize: 11),
                        )
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe a Placa';
                      }
                      placa = value;
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: _form8,
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      DataInputFormatter(),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Data',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                      suffix:Text(
                        'DD/MM/AAAA',
                        style: TextStyle(fontSize: 11),
                      )
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe a Data';
                      }
                      data = value;
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                Form(
                  key: _form9,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      HoraInputFormatter(),
                    ],
                    decoration: InputDecoration(
                      labelText: 'Horario',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                        suffix:Text(
                          'HH:MM',
                          style: TextStyle(fontSize: 11),
                        )
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe o Horario';
                      }
                      horario = value;
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_form.currentState!.validate() &&
                        _form2.currentState!.validate() &&
                        _form3.currentState!.validate() &&
                        _form4.currentState!.validate() &&
                        _form5.currentState!.validate() &&
                        _form6.currentState!.validate() &&
                        _form7.currentState!.validate() &&
                        _form8.currentState!.validate() &&
                        _form9.currentState!.validate()) {
                      setState(() {
                        CaronaRepositorio().addCarona(
                            DarCarona.caronas,
                            nome,
                            preco,
                            vagas,
                            destino,
                            carro,
                            cor,
                            placa,
                            data,
                            horario,
                            ra,
                            Menu.id++);
                        CaronaRepositorio().addCarona(
                          Motorista.euMotorista,
                          nome,
                          preco,
                          vagas,
                          destino,
                          carro,
                          cor,
                          placa,
                          data,
                          horario,
                          ra,
                          Menu.id,
                        );
                      });
                      caro.saveAll(caronas);
                      
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Carona Cadastrada com Sucesso!')),
                      );
                    }
                  },
                  child: Text('Cadastrar'),
                ),
              ],
            )),
      ),
    );
  }
}
