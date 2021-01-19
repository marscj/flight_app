import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:saadiyat/apis/client.dart';

// ignore_for_file: non_constant_identifier_names
class ItineraryFormBloc extends FormBloc<String, String> {
  final TextFieldBloc emial = TextFieldBloc();
  final TextFieldBloc name = TextFieldBloc();
  final TextFieldBloc passport_no = TextFieldBloc();
  final TextFieldBloc exit = TextFieldBloc();
  final TextFieldBloc entry = TextFieldBloc();
  final TextFieldBloc ticket1 = TextFieldBloc();
  final TextFieldBloc ticket2 = TextFieldBloc();
  final TextFieldBloc remark = TextFieldBloc();

  final Booking booking;
  final Itinerary data;

  ItineraryFormBloc(this.booking, this.data) {
    addFieldBlocs(fieldBlocs: [
      emial,
      name,
      passport_no,
      exit,
      entry,
      ticket1,
      ticket2,
      remark
    ]);
    addValidators();
  }

  void addErrors(Map<String, dynamic> errors) {
    if (errors == null) {
      return;
    }

    emial.addFieldError(errors['email']);
    name.addFieldError(errors['name']);
    passport_no.addFieldError(errors['passport_no']);
    exit.addFieldError(errors['exit']);
    entry.addFieldError(errors['entry']);
    ticket1.addFieldError(errors['ticket1']);
    ticket2.addFieldError(errors['ticket2']);
    remark.addFieldError(
        errors['remark'] ?? errors['non_field_errors'] ?? errors['detail']);
  }

  void addValidators() {
    emial.addValidators(
        [RequiredValidator(errorText: 'This field is required!')]);
    exit.addValidators(
        [RequiredValidator(errorText: 'This field is required!')]);
    entry.addValidators(
        [RequiredValidator(errorText: 'This field is required!')]);
  }

  @override
  Stream<FormBlocState<String, String>> mapEventToState(FormBlocEvent event) {
    return super.mapEventToState(event);
  }

  @override
  void onSubmitting() async {
    // ignore_for_file: close_sinks

    if (data == null) {
      RestClient().createItinerry({
        'serial_no': 'unknow',
        'email': emial.value,
        'name': name.value,
        'passport_no': passport_no.value,
        'exit': exit.value,
        'entry': entry.value,
        'ticket1': ticket1.value,
        'ticket2': ticket2.value,
        'remark': remark.value,
        'booking_id': booking.id
      }).then((res) {
        emitSuccess(canSubmitAgain: true);
      }).catchError((error) {
        emitFailure();
        addErrors(error?.response?.data);
      }).whenComplete(() {});
    } else {
      RestClient().updateItinerary(data.id, {
        'serial_no': 'unknow',
        'email': emial.value,
        'name': name.value,
        'passport_no': passport_no.value,
        'exit': exit.value,
        'entry': entry.value,
        'ticket1': ticket1.value,
        'ticket2': ticket2.value,
        'remark': remark.value,
        'booking_id': booking.id
      }).then((res) {
        emitSuccess(canSubmitAgain: true);
      }).catchError((error) {
        emitFailure();
        addErrors(error?.response?.data);
      }).whenComplete(() {});
    }
  }
}
