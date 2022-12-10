import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _imagePreview;
  //
  Future<void> getUserLocation() async {
    //
    final locData = await Location().getLocation();
    print('..........................locaion data:');
    print(locData.latitude);
    print(locData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 170,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          width: double.infinity,
          child: _imagePreview == null
              ? const Text(
                  'no image preview',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _imagePreview!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              onPressed: getUserLocation,
              label: const Text('current location'),
            ),
            TextButton.icon(
              icon: const Icon(Icons.map_sharp),
              onPressed: () {},
              label: const Text('current location'),
            )
          ],
        ),
      ],
    );
  }
}
