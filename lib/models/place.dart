import 'dart:io';

class PlaceLocation {
  final String? longitude;
  final String? latitude;
  final String? address;
  PlaceLocation({
    required this.latitude,
    required this.longitude,
    this.address,
  });
}

class Place {
  final String? id;
  final String? title;
  final PlaceLocation? location;
  final File? Image;

  Place({
    required this.id,
    required this.title,
    required this.Image,
    required this.location,
  });
}
