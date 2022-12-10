import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places_navigation_flutter/screen/add_place_screen.dart';
import 'package:provider/provider.dart';
import 'package:places_navigation_flutter/providers/greate_places.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('places list'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatePlaces>(
          context,
          listen: false,
        ).fetchAndSet(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatePlaces>(
                builder: (context, places, child) => ListView.builder(
                  itemCount: places.items.length,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      //
                    },
                    leading: CircleAvatar(
                      backgroundImage: FileImage(places.items[index].Image!),
                    ),
                    title: Text(places.items[index].title!),
                  ),
                ),
              ),
      ),
    );
  }
}
