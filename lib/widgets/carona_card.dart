import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/carona.dart';

class CaronaCard extends StatefulWidget {
  Carona carona;

  CaronaCard({Key? key, required this.carona}) : super(key: key);

  @override
  _CaronaCardState createState() => _CaronaCardState();
}

class _CaronaCardState extends State<CaronaCard> {

  late num real;
  static Map<String, Color> precoColor = <String, Color>{
    'up': Colors.teal,
    'down': Colors.indigo,
  };


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  
}
