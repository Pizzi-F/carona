import 'package:carona/create/dar_carona.dart';
import 'package:flutter/material.dart';
import 'carona.dart';

class MinhaCarona extends StatefulWidget {
  MinhaCarona({Key? key}) : super(key: key);

  static bool pegou_carona = false;
  static Carona minha_carona = new Carona(
      nome: '0',
      preco: 0,
      vagas: 0,
      destino: '0',
      carro: '0',
      cor: '0',
      placa: '0',
      data: '0',
      horario: '0',
      ra: 1650920,
      id: 0);

  static void AddMinhaCarona(
      String nome,
      double preco,
      int vagas,
      String destino,
      String carro,
      String cor,
      String placa,
      String data,
      String horario,
      int ra) {
    minha_carona.nome = nome;
    minha_carona.preco = preco;
    minha_carona.vagas = vagas;
    minha_carona.destino = destino;
    minha_carona.carro = carro;
    minha_carona.cor = cor;
    minha_carona.placa = placa;
    minha_carona.data = data;
    minha_carona.horario = horario;
    minha_carona.ra = ra;
  }

  static Widget Refresh() => MinhaCarona.pegou_carona == false
      ? Center(
          child: Text(
          'Sem Carona',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ))
      : ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 1,
          padding: EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return ListTile(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              title: Text('Caroneiro: ' +
                  minha_carona.nome +
                  '\nCarro: ' +
                  minha_carona.carro +
                  '\nCor: ' +
                  minha_carona.cor +
                  '\nPlaca: ' +
                  minha_carona.placa +
                  '\nData: ' +
                  minha_carona.data +
                  ' ' +
                  minha_carona.horario),
              trailing: Text('R\$: ' +
                  minha_carona.preco.toString() +
                  '\nDestino: ' +
                  minha_carona.destino +
                  '\nVagas: ' +
                  minha_carona.vagas.toString()),
            );
          });

  @override
  State<MinhaCarona> createState() => _MinhaCaronaState();
}

class _MinhaCaronaState extends State<MinhaCarona> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Minha Carona'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: MinhaCarona.Refresh(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.refresh), label: 'Atualizar'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.cancel), label: 'Cancelar'),
            ],
            onTap: (index) {
              if (index == 0) {
                setState(() {
                  MinhaCarona.Refresh();
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Página Atualizada!')),
                );
              } else if (index == 1) {
                setState(() {
                  int i = 0;
                  for (i = 0; i < DarCarona.caronas.length; i++) {
                    if (DarCarona.caronas[i].nome ==
                        MinhaCarona.minha_carona.nome) {
                      break;
                    }
                  }
                  if (MinhaCarona.pegou_carona == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Você já Está Sem Carona!')),
                    );
                  } else {
                    DarCarona.caronas[i].vagas++;
                    MinhaCarona.pegou_carona = false;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Carona Cancelada!')),
                    );
                  }
                });
              }
            }));
  }
}
