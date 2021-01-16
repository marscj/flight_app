import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCreateBloc, BookingCreateState>(builder: (
      BuildContext context,
      BookingCreateState currentState,
    ) {
      BookingCreateBloc bloc = BlocProvider.of<BookingCreateBloc>(context);
      return Scaffold(
        appBar: AppBar(title: Text('Add Booking')),
        body: Stepper(
          type: StepperType.vertical,
          currentStep: currentState.step,
          onStepContinue: () {
            bloc.add(StepContinueEvent());
          },
          onStepCancel: () {
            bloc.add(StepCancelEvent());
          },
          onStepTapped: (value) {
            bloc.add(StepTappedEvent(value));
          },
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            print('111');
            return Row(
              children: <Widget>[
                TextButton(
                  onPressed: onStepContinue,
                  child: const Text('NEXT'),
                ),
                currentState.step > 0
                    ? TextButton(
                        onPressed: onStepCancel,
                        child: const Text('CANCEL'),
                      )
                    : Container(),
              ],
            );
          },
          steps: [
            Step(
                isActive: currentState.step == 0,
                state: StepState.indexed,
                title: Text('Step1: '),
                subtitle: Text('Add Booking Information'),
                content: SizedBox.fromSize(
                    size: Size.fromHeight(500), child: Text('content'))),
            Step(
                isActive: currentState.step == 1,
                state: StepState.complete,
                title: Text('Step2: '),
                subtitle: Text('Add Itinerary Information'),
                content: SizedBox.fromSize(
                    size: Size.fromHeight(500), child: Text('content'))),
            Step(
                isActive: currentState.step == 2,
                state: StepState.disabled,
                title: Text('Step3: '),
                subtitle: Text('Upload BTAS'),
                content: SizedBox.fromSize(
                    size: Size.fromHeight(500), child: Text('content'))),
            Step(
                isActive: currentState.step == 3,
                state: StepState.editing,
                title: Text('Step3: '),
                subtitle: Text('Upload BTAS'),
                content: SizedBox.fromSize(
                    size: Size.fromHeight(500), child: Text('content'))),
          ],
        ),
      );
    });
  }
}
