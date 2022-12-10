import 'package:flutter/material.dart';
import 'package:places_navigation_flutter/widget/image_input.dart';
import 'package:places_navigation_flutter/widget/location_input.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:places_navigation_flutter/providers/greate_places.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = 'AddPlaceScreen';
  File? _imageFile;

  void pickimage(File imageFile) {
    _imageFile = imageFile;
  }

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  void savePlace() {
    print('.................inside saveplace');
    if (widget._imageFile == null || _placeNameController.text == null) {
      return;
    }
    Provider.of<GreatePlaces>(context, listen: false)
        .addPlace(widget._imageFile, _placeNameController.text);
    Navigator.of(context).pop();
  }

  final _placeNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add your places'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  TextField(
                    controller: _placeNameController,
                    decoration:
                        const InputDecoration(labelText: 'name of the place'),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ImageInput(widget.pickimage),
                  const SizedBox(
                    height: 10,
                  ),
                  LocationInput(),
                ],
              ),
            ),
          ),
          ElevatedButton.icon(
            // ignore: prefer_const_constructors
            style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            icon: const Icon(Icons.add),
            label: const Text('add place'),
            onPressed: savePlace,
          ),
        ],
      ),
    );
  }
}
