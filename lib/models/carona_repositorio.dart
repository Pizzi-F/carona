import 'package:carona/models/carona.dart';
import 'package:flutter/material.dart';

import 'carona.dart';

class CaronaRepositorio {
  CaronaRepositorio();

  void addCarona(
    List<Carona> carona,
    String nome,
    double preco,
    int vagas,
    String destino,
    String carro,
    String cor,
    String placa,
    String data,
    String horario,
    int ra,
    int id,
  ) {
    carona.add(Carona(
      nome: nome,
      preco: preco,
      vagas: vagas,
      destino: destino,
      carro: carro,
      cor: cor,
      placa: placa,
      data: data,
      horario: horario,
      ra: ra,
      id: id,
    ));
  }

  void removeCarona(
    List<Carona> carona,
    String nome,
  ) {
    carona.removeWhere((carona) => carona.nome == nome);
  }
}
