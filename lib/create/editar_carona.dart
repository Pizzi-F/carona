import 'package:carona/models/minha_carona.dart';

import '../models/carona.dart';

class EditarCarona {
  EditarCarona();
  static void deletaCarona(List<Carona> carona, int index) {
    carona.removeAt(index);
  }

  static void deletaDoMenu(List<Carona> carona, int index) {
    for (int i = 0; i < carona.length; i++) {
      if (carona[i].id == index) {
        deletaCarona(carona, i);
        break;
      }
    }
  }

  static void deletaDeMinhaCarona(Carona carona, int index) {
    if (carona.id == index) {
      MinhaCarona.pegou_carona = false;
    }
  }
}
