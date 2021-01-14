import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_event.dart';
import 'package:saadiyat/pages/app/app_page.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => AppBloc()..add(AppInitEvent()), child: AppPage()));
}
