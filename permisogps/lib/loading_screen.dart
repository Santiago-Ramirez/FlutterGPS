import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permisogps/blocs/blocs.dart';
import 'package:permisogps/blocs/gps/gps_bloc.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: BlocBuilder<GpsBloc, GpsState>(
      builder: (context, state) {
        print("state: $state");
        return !state.isGpsEnabled
            ? const _EnableGpsMessage()
            : const _AccessButton();
      },
    )
        // _AccessButton(),
        ));
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Es necesario el acceso al GPS"),
        MaterialButton(
            child: const Text("Solicitar Acceso",
                style: TextStyle(color: Colors.white)),
            color: Colors.red,
            shape: const StadiumBorder(),
            elevation: 0,
            splashColor: Colors.transparent,
            onPressed: () {
              final gpsBloc = BlocProvider.of<GpsBloc>(context);
              gpsBloc.askGpsAcess();
              // final gpsBlocFormaDos = context.read<GpsBloc>();
            })
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Debe de habilitar el GPS",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
    );
  }
}
