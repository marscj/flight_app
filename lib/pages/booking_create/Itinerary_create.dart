import 'package:animations/animations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:saadiyat/apis/client.dart';

import 'Itinerary_form_bloc.dart';
import 'booking_create_state.dart';

class ItineraryEditPage extends StatefulWidget {
  static const String routeName = '/itineraryEdit';

  final Booking data;

  final void Function(Booking data, bool create) onResult;

  ItineraryEditPage({Key key, this.data, this.onResult}) : super(key: key);

  @override
  _ItineraryCreatePageState createState() => _ItineraryCreatePageState();
}

class _ItineraryCreatePageState extends State<ItineraryEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: SafeArea(
            child: BlocProvider<ItineraryFormBloc>(
                create: (context) => ItineraryFormBloc(context),
                child: FormBlocListener<ItineraryFormBloc, String, String>(
                  onFailure: (context, state) {
                    EasyLoading.showError('Failed!');
                  },
                  onSuccess: (context, state) {
                    EasyLoading.showSuccess('Success!');
                  },
                  onSubmitting: (context, state) {
                    EasyLoading.show();
                  },
                  child: Builder(
                    builder: (context) {
                      // ignore: close_sinks
                      final formBloc =
                          BlocProvider.of<ItineraryFormBloc>(context);

                      return Form(
                          child: ListView(
                        padding: const EdgeInsets.all(15),
                        children: [
                          Text(
                            'Add Booking Informations',
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFieldBlocBuilder(
                              textFieldBloc: formBloc.title
                                ..updateInitialValue(widget?.data?.title),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  isDense: true,
                                  hintText: '*Title',
                                  errorMaxLines: 6,
                                  border: OutlineInputBorder())),
                          TextFieldBlocBuilder(
                              textFieldBloc: formBloc.remark
                                ..updateInitialValue(widget?.data?.remark),
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.multiline,
                              maxLines: 10,
                              decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Remark',
                                  errorMaxLines: 6,
                                  border: OutlineInputBorder())),
                          SizedBox(height: 24),
                          ElevatedButton.icon(
                            icon: widget?.data == null
                                ? Icon(Icons.add)
                                : Icon(Icons.update),
                            label: widget?.data == null
                                ? Text('ADD')
                                : Text('SUBMIT'),
                            onPressed: () {
                              formBloc.submit();
                            },
                          )
                        ],
                      ));
                    },
                  ),
                ))));
  }
}
