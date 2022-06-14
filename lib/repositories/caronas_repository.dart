import 'dart:collection';

import 'package:carona/models/carona.dart';
import 'package:flutter/material.dart';

class CaronasRepository extends ChangeNotifier{
  List<Carona> _lista =[];

  UnmodifiableListView<Carona> get lista => UnmodifiableListView(_lista);

  saveAll(List<Carona> caronas){
    caronas.forEach((caronas) {
      if(!_lista.contains(caronas)) _lista.add(caronas);
    });
    notifyListeners();

  }

  remove(Carona carona){
    _lista.remove(carona);
    notifyListeners();
  }
}