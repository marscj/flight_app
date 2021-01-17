import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:saadiyat/pages/booking_detail/itinerary_screen.dart';
import 'package:saadiyat/router/router.gr.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/booking_create/index.dart';
import 'package:auto_route/auto_route.dart';

import 'booking_form_bloc.dart';

class BookingCreateScreen extends StatefulWidget {
  const BookingCreateScreen({
    Key key,
  }) : super(key: key);

  @override
  BookingCreateScreenState createState() {
    return BookingCreateScreenState();
  }
}

class BookingCreateScreenState extends State<BookingCreateScreen> {
  final List<Widget> pages = [
    AddBookingScreen(),
    AddItineraryListPage(),
    AddBtaPage()
  ];

  @override
  Widget build(BuildContext context) {
    VoidCallback nextButtonCall(BookingCreateState state) {
      // ignore: close_sinks
      BookingCreateBloc bloc = BlocProvider.of<BookingCreateBloc>(context);
      switch (state.step) {
        case 0:
          if (state.booking != null) {
            return () {
              bloc.add(StepContinueEvent());
            };
          }
          return null;
        case 1:
          if (state.itineraries.length > 0) {
            return () {
              bloc.add(StepContinueEvent());
            };
          }
          return null;
        case 2:
          return null;
      }
      return null;
    }

    return BlocBuilder<BookingCreateBloc, BookingCreateState>(
      builder: (context, currentState) {
        return WillPopScope(
            onWillPop: () async {
              if (EasyLoading.isShow) {
                EasyLoading.dismiss();
                return false;
              } else {
                if (currentState.step > 0) {
                  context.bloc<BookingCreateBloc>().add(StepCancelEvent());
                  return false;
                }
              }

              return showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                          title: Text('Are you sure you want to quit?'),
                          actions: <Widget>[
                            RaisedButton(
                                child: Text('Cancel'),
                                onPressed: () =>
                                    Navigator.of(context).pop(false)),
                            RaisedButton(
                                child: Text('Quit'),
                                onPressed: () =>
                                    Navigator.of(context).pop(true)),
                          ]));
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: BackButton(),
                      alignment: Alignment.centerLeft,
                      height: 60,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 0, bottom: 10),
                      alignment: Alignment.center,
                      child: StepProgressIndicator(
                        totalSteps: 3,
                        currentStep: currentState.step + 1,
                        customColor: (index) => index == currentState.step
                            ? Colors.indigo
                            : Colors.grey,
                        size: 2,
                      ),
                    ),
                    Expanded(
                      child: PageTransitionSwitcher(
                        duration: const Duration(milliseconds: 300),
                        reverse: currentState.step == 0,
                        transitionBuilder: (
                          Widget child,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                        ) {
                          return SharedAxisTransition(
                            child: child,
                            animation: animation,
                            secondaryAnimation: secondaryAnimation,
                            transitionType: SharedAxisTransitionType.horizontal,
                          );
                        },
                        child: pages[currentState.step],
                      ),
                    ),
                    currentState.step < 2
                        ? Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: nextButtonCall(currentState),
                              child: const Text('NEXT'),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ));
      },
    );
  }
}

class AddBookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingFormBloc>(
        create: (context) => BookingFormBloc(context),
        child: FormBlocListener<BookingFormBloc, String, String>(
          onFailure: (context, state) {
            EasyLoading.showError('Failed!');
          },
          onSuccess: (context, state) {
            EasyLoading.showSuccess('Success!');
          },
          onSubmitting: (context, state) {
            EasyLoading.show();
          },
          child: BlocBuilder<BookingCreateBloc, BookingCreateState>(
              builder: (context, state) {
            // ignore: close_sinks
            BookingFormBloc formBloc =
                BlocProvider.of<BookingFormBloc>(context);

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
                      ..updateInitialValue(state?.booking?.title),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: '*Title',
                        errorMaxLines: 6,
                        border: OutlineInputBorder())),
                TextFieldBlocBuilder(
                    textFieldBloc: formBloc.remark
                      ..updateInitialValue(state?.booking?.remark),
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
                  icon: state.booking == null
                      ? Icon(Icons.add)
                      : Icon(Icons.change_history),
                  label: state.booking == null ? Text('ADD') : Text('SUBMIT'),
                  onPressed: () {
                    formBloc.submit();
                  },
                )
              ],
            ));
          }),
        ));
  }
}

class AddItineraryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCreateBloc, BookingCreateState>(
        builder: (context, state) {
      return ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Text(
            'Add Itinerary Informations',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          ListBody(
              children: state.itineraries.map((f) {
            return ItineraryItem(
              data: f,
            );
          }).toList()),
          ElevatedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add a itinerary'),
            onPressed: () {
              context.router.push(ItineraryCreateRoute(state: state));
            },
          )
        ],
      );
    });
  }
}

class AddBtaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ListView(
        children: [
          Text(
            'Upload BTA Files',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ],
      );
    });
  }
}
