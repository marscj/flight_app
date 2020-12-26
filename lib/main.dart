import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'app/app_bloc.dart';
void main() {
  runApp(BlocProvider<AppBloc>(
    create: (_) => AppBloc()..add(AppInitial()),
    child: App(),
  ));
}