// ignore_for_file: prefer_const_constructors

import 'package:carona/create/dar_carona.dart';
import 'package:carona/models/carona_repositorio.dart';
import 'package:carona/models/carona.dart';
import 'package:carona/models/motorista.dart';
import 'package:carona/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:carona/models/minha_carona.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);
  static int id = 0;
  static Widget Refresh() => DarCarona.caronas.isEmpty
      ? Center(child: CircularProgressIndicator())
      : ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: DarCarona.caronas.length,
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                title: Text('Caroneiro: ' +
                    DarCarona.caronas[index].nome +
                    '\nData: ' +
                    DarCarona.caronas[index].data +
                    '\nHorário: ' +
                    DarCarona.caronas[index].horario),
                trailing: Text('R\$: ' +
                    DarCarona.caronas[index].preco.toString() +
                    '\nDestino: ' +
                    DarCarona.caronas[index].destino +
                    '\nVagas: ' +
                    DarCarona.caronas[index].vagas.toString()),
                onTap: () {
                  if (MinhaCarona.pegou_carona == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Você já Possui Carona Cadastrada!')),
                    );
                  } else {
                    MinhaCarona.pegou_carona = true;
                    DarCarona.caronas[index].vagas--;
                    MinhaCarona.AddMinhaCarona(
                      DarCarona.caronas[index].nome,
                      DarCarona.caronas[index].preco,
                      DarCarona.caronas[index].vagas,
                      DarCarona.caronas[index].destino,
                      DarCarona.caronas[index].carro,
                      DarCarona.caronas[index].cor,
                      DarCarona.caronas[index].placa,
                      DarCarona.caronas[index].data,
                      DarCarona.caronas[index].horario,
                      DarCarona.caronas[index].ra,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Carona Cadastrada com Sucesso!')),
                    );
                  }
                },
              ),
            );
          });
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        centerTitle: true,
      ),
      body: (Column(
        children: [
          Flexible(
            child: Menu.Refresh(),
          ),
        ],
      )),
      // floatingActionButton: FloatingActionButton.extended(
      //   icon: Icon(Icons.car_rental),
      //   label: Text('Dar Carona'),
      //   onPressed: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (_) => DarCarona(),
      //         ));
      //     //DarCarona.caronas = [];
      //     //CaronaRepositorio().addCarona(DarCarona.caronas, 'Cláudia', 2.05, 3,
      //     // 'UTFPR', 'Gol', 'Preto', 'XXX-123', '16/07/1996', '13:50');
      //     //CaronaRepositorio().addCarona(caronas, 'Felipe', 4, '1', 'UTFPR',
      //     //'Saveiro', 'Branco', 'AAA-000', '2');
      //     //CaronaRepositorio().addCarona(caronas, 'Humnerto', 10.50, '3',
      //     //'UTFPR', 'Virtus', 'Prata', 'BBB-222', '3');
      //     //for (int i = 0; i < caronas.length; i++) {
      //     //print(caronas[i].carro);
      //     //}
      //     //print(caronas.length);
      //     //CaronaRepositorio().removeCarona(DarCarona.caronas, 'Cláudia');
      //     //CaronaRepositorio().removeCarona(caronas, '1');
      //     //print('aqui');
      //     // print(caronas.length);
      //   },
      // ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.car_rental), label: 'Dar Carona'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'Minha Carona'),
            ],
          onTap: (index) {
            if (index == 0) {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DarCarona(),
              ));
            } else if (index == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MinhaCarona(),
                  ));
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
