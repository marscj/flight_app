import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/support/index.dart';

class SupportPage extends StatefulWidget {
  static const String routeName = '/support';

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SupportBloc>(
        create: (context) => SupportBloc(), child: SupportScreen());
  }
}
