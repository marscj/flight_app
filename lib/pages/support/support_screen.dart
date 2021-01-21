import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/support/index.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({
    Key key,
  }) : super(key: key);

  @override
  SupportScreenState createState() {
    return SupportScreenState();
  }
}

class SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupportBloc, SupportState>(builder: (
      BuildContext context,
      SupportState currentState,
    ) {
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
