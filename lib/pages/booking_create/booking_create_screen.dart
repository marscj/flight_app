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
      return Scaffold(
        appBar: AppBar(title: Text('Add Booking')),
        body: Stepper(
          currentStep: currentState.step,
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Row(
              children: <Widget>[
                TextButton(
                  onPressed: onStepContinue,
                  child: const Text('NEXT'),
                ),
                TextButton(
                  onPressed: onStepCancel,
                  child: const Text('CANCEL'),
                ),
              ],
            );
          },
          steps: [
            Step(
                isActive: currentState.step == 0,
                state: StepState.indexed,
                title: Text('Step1: '),
                subtitle: Text('Add Booking Information'),
                content: Text('content')),
            Step(
                isActive: currentState.step == 1,
                state: StepState.complete,
                title: Text('Step2: '),
                subtitle: Text('Add Itinerary Information'),
                content: Text('content')),
            Step(
                isActive: currentState.step == 2,
                state: StepState.disabled,
                title: Text('Step3: '),
                subtitle: Text('Upload BTAS'),
                content: Text('content'))
          ],
        ),
      );
    });
  }
}
