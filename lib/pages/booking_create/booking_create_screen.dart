import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  PageRouteInfo itineraryRouteInfo() {
    return ItineraryEditRoute(onResult: (data, create) {});
  }

  List<Widget> floatingActionButton(BookingCreateState state) {
    // ignore: close_sinks
    BookingCreateBloc bloc = BlocProvider.of<BookingCreateBloc>(context);
    return [
      FloatingActionButton(
        onPressed: () {
          bloc.add(SubmitBookingEvent());
        },
        child: state.booking == null ? Icon(Icons.add) : Icon(Icons.update),
      ),
      FloatingActionButton(
        onPressed: () {
          context.router.push(itineraryRouteInfo());
        },
        child: Icon(Icons.add),
      ),
      FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.file_upload),
      ),
    ];
  }

  List<Widget> buildForwardButton(BookingCreateState state) {
    // ignore: close_sinks
    BookingCreateBloc bloc = BlocProvider.of<BookingCreateBloc>(context);
    return [
      IconButton(
        icon: Icon(Icons.arrow_forward),
        onPressed: state.booking != null
            ? () {
                bloc.add(StepContinueEvent());
              }
            : null,
      ),
      IconButton(
          icon: state.itineraries.length == 0
              ? Icon(Icons.skip_next)
              : Icon(Icons.arrow_forward),
          onPressed: () {
            bloc.add(StepContinueEvent());
          }),
      IconButton(icon: Icon(Icons.done_all), onPressed: () {})
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingCreateBloc, BookingCreateState>(
      listener: (context, state) {
        if (state.action == 'booking_created') {
          context.router.push(itineraryRouteInfo());
        }
      },
      child: BlocBuilder<BookingCreateBloc, BookingCreateState>(
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
                              ElevatedButton(
                                  child: Text('Cancel'),
                                  onPressed: () =>
                                      Navigator.of(context).pop(false)),
                              ElevatedButton(
                                  child: Text('Quit'),
                                  onPressed: () =>
                                      Navigator.of(context).pop(true)),
                            ]));
              },
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                floatingActionButton:
                    floatingActionButton(currentState)[currentState.step],
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: BottomAppBar(
                  color: Theme.of(context).primaryColor,
                  shape: CircularNotchedRectangle(),
                  child: IconTheme(
                    data: IconThemeData(
                        color: Theme.of(context).colorScheme.onPrimary),
                    child: Row(
                      children: [
                        BackButton(),
                        Spacer(),
                        buildForwardButton(currentState)[currentState.step],
                      ],
                    ),
                  ),
                ),
                body: SafeArea(
                  child: Stack(
                    children: <Widget>[
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
                              transitionType:
                                  SharedAxisTransitionType.horizontal,
                            );
                          },
                          child: pages[currentState.step],
                        ),
                      ),
                      Positioned(
                        bottom: kToolbarHeight,
                        left: MediaQuery.of(context).size.width / 4,
                        right: MediaQuery.of(context).size.width / 4,
                        child: StepProgressIndicator(
                          totalSteps: 3,
                          currentStep: currentState.step + 1,
                          customColor: (index) => index == currentState.step
                              ? Colors.indigo
                              : Colors.grey,
                          size: 2,
                        ),
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
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
        }, onSuccess: (context, state) {
          EasyLoading.showSuccess('Success!');
        }, onSubmitting: (context, state) {
          EasyLoading.show();
        }, child: BlocBuilder<BookingCreateBloc, BookingCreateState>(
                builder: (context, state) {
          // ignore: close_sinks
          BookingFormBloc formBloc = BlocProvider.of<BookingFormBloc>(context);

          return BlocListener<BookingCreateBloc, BookingCreateState>(
            listener: (context, state) {
              if (state.action == 'booking_create') {
                formBloc.submit();
              }
            },
            child: Form(
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
              ],
            )),
          );
        })));
  }
}

class AddItineraryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCreateBloc, BookingCreateState>(
        builder: (_, state) {
      return ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Text(
            'Itinerary List',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          ListBody(
              children: state.itineraries.map((f) {
            return ItineraryItem(
              data: f,
            );
          }).toList()),
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
