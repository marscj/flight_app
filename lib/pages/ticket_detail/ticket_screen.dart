import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/ticket_detail/index.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({
    Key key,
  }) : super(key: key);

  @override
  TickeScreenState createState() {
    return TickeScreenState();
  }
}

class TickeScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketDetailBloc, TicketDetailState>(builder: (
      BuildContext context,
      TicketDetailState currentState,
    ) {
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
