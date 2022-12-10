import 'package:flutter/material.dart';
import 'package:places_navigation_flutter/screen/add_place_screen.dart';
import 'package:places_navigation_flutter/screen/placel_list_screen.dart';
import 'package:provider/provider.dart';

import 'providers/greate_places.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatePlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PlaceListScreen(),
        routes: {
          AddPlaceScreen.routeName: (context) => AddPlaceScreen(),
        },
      ),
    );
  }
}
