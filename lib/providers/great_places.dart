import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:great_places/models/places.dart';
import 'package:great_places/utils/db_util.dart';

class GreatePlaces with ChangeNotifier {
  List<Place> _items = [];
//funcao responsavel por carregar os lugares
  Future<void> loadPlaces() async {
    final dataList = await DbUtil.getData('places');
    _items = dataList
        .map((item) => Place(
              id: item['id'],
              title: item['title'],
              location: item['location'],
              image: File(
                item['image'],
              ),
            ))
        .toList();
    notifyListeners();
  }

  List<Place> get items {
    return [..._items];
    //retorna um clne da lista _items para que não seja possível alterar a lista original
  }

  int get itemsCount {
    return _items.length;
    //pegar o tamanho da lista de itens
  }

  Place itemByIndex(int index) {
    return _items[index];
    //pegar um item da lista pelo index
  }

  //metodor responsavel por adicionar um novo lugar
  void addPlace(String title, File image) {
    final newPlace = Place(
        id: Random().nextDouble().toString(),
        title: title,
        location: null,
        image: image);
    _items.add(newPlace);
    DbUtil.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
    notifyListeners(); //para notificar os listeners que a lista foi alterada e atualizar os componentes
  }

  // void addPlace(String title, PlaceLocation location, File image) {
  //   final newPlace = Place(
  //     id: DateTime.now().toString(),
  //     title: title,
  //     location: location,
  //     image: image,
  //   );
  //   _items.add(newPlace);
  //   notifyListeners();
  // }
}
