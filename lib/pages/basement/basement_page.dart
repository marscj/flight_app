import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/basement/basement_screen.dart';
import 'package:saadiyat/pages/basement/index.dart';
import 'package:saadiyat/pages/bookings/index.dart';
import 'package:saadiyat/pages/home/index.dart';
import 'package:saadiyat/pages/my/index.dart';
import 'package:saadiyat/pages/tickets/index.dart';

// import 'container_transition.dart';
// import 'fade_scale_transition.dart';
// import 'fade_through_transition.dart';

class BasementPage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _BasementPageState createState() => _BasementPageState();
}

class _BasementPageState extends State<BasementPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BasementBloc>(
      create: (context) => BasementBloc(),
      child: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => HomeBloc()..add(LoadHomeEvent())),
        BlocProvider(create: (context) => BookingsBloc()),
        BlocProvider(create: (context) => TicketsBloc()),
        BlocProvider(create: (context) => MyBloc()..add(LoadMyEvent()))
      ], child: BasementScreen()),
    );
  }
}
