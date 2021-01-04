import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'bta_bloc.dart';
import 'bta_state.dart';

class BtaScreen extends StatefulWidget {
  const BtaScreen({
    Key key,
  }) : super(key: key);

  @override
  BtaScreenState createState() {
    return BtaScreenState();
  }
}

class BtaScreenState extends State<BtaScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BtaBloc, BtaState>(builder: (
      BuildContext context,
      BtaState currentState,
    ) {
      return Container();
    });
  }
}
