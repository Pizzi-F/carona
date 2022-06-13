import 'package:carona/models/carona_repositorio.dart';
import 'package:flutter/material.dart';

class Carona {
  String nome;
  double preco;
  int vagas;
  String destino;
  String carro;
  String cor;
  String placa;
  String data;
  String horario;
  int ra;
  int id;

  Carona({
    required this.nome,
    required this.preco,
    required this.vagas,
    required this.destino,
    required this.carro,
    required this.cor,
    required this.placa,
    required this.data,
    required this.horario,
    required this.ra,
    required this.id,
  });
}
