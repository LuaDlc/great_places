import 'package:flutter/material.dart';
import 'package:great_places/models/places.dart';

class GratePlaces with ChangeNotifier {
  List<Place> _items = [];

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
