import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/tickets/tickets_bloc.dart';

import 'tickets_screen.dart';

class TicketsPage extends StatefulWidget {
  static const String routeName = 'tickets';

  @override
  _TicketsPageState createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TicketsBloc>(
      create: (_) => TicketsBloc(),
      child: TicketsScreen(),
    );
  }
}
