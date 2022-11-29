import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permisogps/loading_screen.dart';
import 'package:permisogps/carga_screen.dart';

import 'blocs/gps/gps_bloc.dart';

class CargaScreen extends StatelessWidget {
  const CargaScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<GpsBloc, GpsState>(
      builder: (context, state) {
        return state.isAllGranted
            ? const CargaScreen()
            : const GpsAccessScreen();
      },
    ));
  }
}
