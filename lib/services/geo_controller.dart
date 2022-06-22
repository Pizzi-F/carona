import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeoController extends ChangeNotifier{
  double lat= 0.0;
  double long = 0.0;
  String erro = '';

  GeoController(){
    getPosicao();
  }

  getPosicao() async{
    try{
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long= posicao.longitude;

    }catch(e){
      erro=e.toString();
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async{
    LocationPermission permissao;
    bool ativado = await Geolocator.isLocationServiceEnabled();
    if(!ativado){
      return Future.error("Habilite a localização");
    }
    permissao=await Geolocator.checkPermission();
    if(permissao == LocationPermission.denied){
      permissao=await Geolocator.requestPermission();
      if(permissao == LocationPermission.denied){
        return Future.error("precisa autorizar o acesso");
      }
    }
    if(permissao == LocationPermission.deniedForever){
      return Future.error("autorizar a localização");
    }

    return await Geolocator.getCurrentPosition();
  }

}