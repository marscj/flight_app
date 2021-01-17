import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/booking_create/index.dart';

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
    AddBookingPage(),
    AddItineraryListPage(),
    AddBtaPage()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCreateBloc, BookingCreateState>(
      builder: (context, currentState) {
        return WillPopScope(
            onWillPop: () async {
              if (currentState.step > 0) {
                context.bloc<BookingCreateBloc>().add(StepCancelEvent());
                return false;
              }
              return true;
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: BackButton(),
                      alignment: Alignment.centerLeft,
                      height: 80,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 0, bottom: 30),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .bloc<BookingCreateBloc>()
                                  .add(StepContinueEvent());
                            },
                            child: Text('Next'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}

class AddBookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ListView(
        children: [
          Text(
            'Add Booking Informations',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ],
      );
    });
  }
}

class AddBookingScreen extends StatelessWidget {
  const AddBookingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}

class AddItineraryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ListView(
        children: [
          Text(
            'Add Itinerary Informations',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
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
