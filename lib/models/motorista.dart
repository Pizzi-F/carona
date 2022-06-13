import 'package:carona/create/editar_carona.dart';
import 'package:carona/models/carona_repositorio.dart';
import 'package:carona/models/minha_carona.dart';
import 'package:flutter/material.dart';
import 'package:carona/create/dar_carona.dart';
import 'carona.dart';

class Motorista extends StatefulWidget {
  Motorista({Key? key}) : super(key: key);
  static bool carona_cadastrada = false;
  static List<Carona> euMotorista = [];

  static void addCaronaMotorista() {
    for (int i = 0; i < DarCarona.caronas.length; i++) {
      if (DarCarona.caronas[i].ra == 1650920) {
        euMotorista.add(DarCarona.caronas[i]);
      }
    }
  }

  static Widget Refresh() => euMotorista.isEmpty
      ? Center(
          child: Text(
          'Nenhuma Carona Cadastrada',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ))
      : ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: euMotorista.length,
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 5),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                title: Text('Caroneiro: ' +
                    euMotorista[index].nome +
                    '\nCarro: ' +
                    euMotorista[index].carro +
                    '\nCor: ' +
                    euMotorista[index].cor +
                    '\nPlaca: ' +
                    euMotorista[index].placa +
                    '\nData: ' +
                    euMotorista[index].data +
                    '\nHorário: ' +
                    euMotorista[index].horario),
                trailing: Text('R\$: ' +
                    euMotorista[index].preco.toString() +
                    '\nDestino: ' +
                    euMotorista[index].destino +
                    '\nVagas: ' +
                    euMotorista[index].vagas.toString()),
                onLongPress: () {
                  EditarCarona.deletaDoMenu(
                      DarCarona.caronas, DarCarona.caronas[index].id);
                  MinhaCarona.pegou_carona = false;
                  EditarCarona.deletaCarona(euMotorista, index);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Carona Excluída')),
                  );
                },
              ),
            );
          });
  @override
  State<Motorista> createState() => _MotoristaState();
}

class _MotoristaState extends State<Motorista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Carona'),
        centerTitle: true,
      ),
      body: Motorista.Refresh(),
    );
  }
}
