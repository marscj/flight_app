import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_event.dart';
import 'package:saadiyat/pages/app/app_page.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => AppBloc()..add(UnAppEvent(context)), child: App()));
}
