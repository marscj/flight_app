import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_event.dart';
import 'package:saadiyat/pages/app/app_page.dart';

Future<void> main() async {
  await Hive.initFlutter();

  runApp(BlocProvider(
      create: (context) => AppBloc()..add(AppInitEvent()), child: AppPage()));
}
