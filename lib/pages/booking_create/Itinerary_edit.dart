import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/index.dart';
import 'package:auto_route/auto_route.dart';

import 'Itinerary_form_bloc.dart';

class ItineraryEditPage extends StatefulWidget {
  static const String routeName = '/itineraryEdit';

  final Booking booking;

  final Itinerary data;

  ItineraryEditPage({Key key, this.booking, this.data}) : super(key: key);

  @override
  _ItineraryEditPageState createState() => _ItineraryEditPageState();
}

class _ItineraryEditPageState extends State<ItineraryEditPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (_, appState) {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              'Add Itinerary Informations',
              style: TextStyle(color: Colors.black),
            ),
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          body: SafeArea(
              child: BlocProvider<ItineraryFormBloc>(
                  create: (context) =>
                      ItineraryFormBloc(widget.booking, widget.data),
                  child: FormBlocListener<ItineraryFormBloc, String, String>(
                    onFailure: (context, state) {
                      EasyLoading.showError('Failed!');
                    },
                    onSuccess: (context, state) {
                      EasyLoading.showSuccess('Success!');
                      Navigator.of(context).pop(true);
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
                          padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 15,
                              bottom: kToolbarHeight),
                          children: [
                            TextFieldBlocBuilder(
                                readOnly: true,
                                textFieldBloc: formBloc.emial
                                  ..updateInitialValue(widget?.data?.email ??
                                      appState?.user?.email ??
                                      ''),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    enabled: false,
                                    isDense: true,
                                    labelText: '* Email',
                                    errorMaxLines: 6,
                                    border: OutlineInputBorder())),
                            TextFieldBlocBuilder(
                                readOnly: true,
                                textFieldBloc: formBloc.name
                                  ..updateInitialValue(widget?.data?.name ??
                                      appState?.user?.name ??
                                      ''),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    enabled: false,
                                    isDense: true,
                                    labelText: 'Name',
                                    errorMaxLines: 6,
                                    border: OutlineInputBorder())),
                            TextFieldBlocBuilder(
                                readOnly: true,
                                textFieldBloc: formBloc.passport_no
                                  ..updateInitialValue(
                                      widget?.data?.passport_no ??
                                          appState?.user?.passport_no ??
                                          ''),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    enabled: false,
                                    isDense: true,
                                    labelText: 'Passport No.',
                                    errorMaxLines: 6,
                                    border: OutlineInputBorder())),
                            TextFieldBlocBuilder(
                                textFieldBloc: formBloc.exit
                                  ..updateInitialValue(
                                      widget?.data?.exit ?? ''),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: '* Exit',
                                    errorMaxLines: 6,
                                    border: OutlineInputBorder())),
                            TextFieldBlocBuilder(
                                textFieldBloc: formBloc.entry
                                  ..updateInitialValue(
                                      widget?.data?.entry ?? ''),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: '* Entry',
                                    errorMaxLines: 6,
                                    border: OutlineInputBorder())),
                            TextFieldBlocBuilder(
                                textFieldBloc: formBloc.ticket1
                                  ..updateInitialValue(
                                      widget?.data?.ticket1 ?? ''),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Ticket 1',
                                    errorMaxLines: 6,
                                    border: OutlineInputBorder())),
                            TextFieldBlocBuilder(
                                textFieldBloc: formBloc.ticket2
                                  ..updateInitialValue(
                                      widget?.data?.ticket2 ?? ''),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Ticket 2',
                                    errorMaxLines: 6,
                                    border: OutlineInputBorder())),
                            TextFieldBlocBuilder(
                                textFieldBloc: formBloc.remark
                                  ..updateInitialValue(
                                      widget?.data?.remark ?? ''),
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.multiline,
                                maxLines: 10,
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: 'Remark',
                                    errorMaxLines: 3,
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
    });
  }
}
