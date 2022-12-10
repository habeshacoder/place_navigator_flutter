import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:places_navigation_flutter/helpers/db_helpers.dart';
import 'package:places_navigation_flutter/models/place.dart';

class GreatePlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(File? placeImage, String fileName) {
    //
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: fileName,
      Image: placeImage,
      location: null,
    );
    print('........addplace ingret...');
    _items.add(newPlace);
    notifyListeners();
    //
    DbHelper.insert(
      'user_places',
      {
        'id': newPlace.id.toString(),
        'title': newPlace.title.toString(),
        'image': newPlace.Image.toString(),
      },
    );
  }

  Future<void> fetchAndSet() async {
    final table = await DbHelper.fetchData('user_places');
    _items = table
        .map(
          (pmap) => Place(
              id: pmap['id'],
              title: pmap['title'],
              Image: File(pmap['image']),
              location: null),
        )
        .toList();
    notifyListeners();
  }
}
