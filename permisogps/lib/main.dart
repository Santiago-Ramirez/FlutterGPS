import 'package:flutter/material.dart';
import 'package:permisogps/blocs/gps/gps_bloc.dart';
import 'package:permisogps/loading_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permisogps/carga_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [BlocProvider(create: (context) => GpsBloc())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MapsApp',
        home: GpsAccessScreen());
  }
}
