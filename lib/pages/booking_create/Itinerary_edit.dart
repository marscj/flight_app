import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/index.dart';

import 'Itinerary_form_bloc.dart';

class ItineraryEditPage extends StatefulWidget {
  static const String routeName = '/itineraryEdit';

  final Booking booking;

  final Itinerary data;

  final void Function(Itinerary data) onResult;

  ItineraryEditPage({Key key, this.booking, this.data, this.onResult})
      : super(key: key);

  @override
  _ItineraryEditPageState createState() => _ItineraryEditPageState();
}

class _ItineraryEditPageState extends State<ItineraryEditPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (_, appState) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
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
                      widget.onResult(null);
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
                            TextFieldBlocBuilder(
                                textFieldBloc: formBloc.emial
                                  ..updateInitialValue(widget?.data?.email),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: '* Email',
                                    errorMaxLines: 6,
                                    border: OutlineInputBorder())),
                            TextFieldBlocBuilder(
                                textFieldBloc: formBloc.name
                                  ..updateInitialValue(widget?.data?.name),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Name',
                                    errorMaxLines: 6,
                                    border: OutlineInputBorder())),
                            TextFieldBlocBuilder(
                                textFieldBloc: formBloc.passport_no
                                  ..updateInitialValue(
                                      widget?.data?.passport_no),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Passport No.',
                                    errorMaxLines: 6,
                                    border: OutlineInputBorder())),
                            TextFieldBlocBuilder(
                                textFieldBloc: formBloc.exit
                                  ..updateInitialValue(widget?.data?.exit),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: '* Exit',
                                    errorMaxLines: 6,
                                    border: OutlineInputBorder())),
                            TextFieldBlocBuilder(
                                textFieldBloc: formBloc.entry
                                  ..updateInitialValue(widget?.data?.entry),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: '* Entry',
                                    errorMaxLines: 6,
                                    border: OutlineInputBorder())),
                            TextFieldBlocBuilder(
                                textFieldBloc: formBloc.ticket1
                                  ..updateInitialValue(widget?.data?.ticket1),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Ticket 1',
                                    errorMaxLines: 6,
                                    border: OutlineInputBorder())),
                            TextFieldBlocBuilder(
                                textFieldBloc: formBloc.ticket2
                                  ..updateInitialValue(widget?.data?.ticket2),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Ticket 2',
                                    errorMaxLines: 6,
                                    border: OutlineInputBorder())),
                            TextFieldBlocBuilder(
                                textFieldBloc: formBloc.remark
                                  ..updateInitialValue(widget?.booking?.remark),
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
    });
  }
}
