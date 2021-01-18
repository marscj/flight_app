import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/booking_create/index.dart';

class BookingFormBloc extends FormBloc<String, String> {
  final TextFieldBloc title = TextFieldBloc();
  final TextFieldBloc remark = TextFieldBloc();

  final BuildContext context;

  BookingFormBloc(this.context) {
    addFieldBlocs(fieldBlocs: [title, remark]);
    addValidators();
  }

  void addErrors(Map<String, dynamic> errors) {
    if (errors == null) {
      return;
    }

    title.addFieldError(errors['email']);
    remark.addFieldError(
        errors['password'] ?? errors['non_field_errors'] ?? errors['detail']);
  }

  void addValidators() {
    title.addValidators(
        [RequiredValidator(errorText: 'This field is required!')]);
  }

  @override
  Stream<FormBlocState<String, String>> mapEventToState(FormBlocEvent event) {
    return super.mapEventToState(event);
  }

  @override
  Future<void> close() {
    // TODO: implement close
    title.close();
    remark.close();
    return super.close();
  }

  @override
  void onSubmitting() async {
    // ignore_for_file: close_sinks

    BookingCreateBloc bloc = BlocProvider.of<BookingCreateBloc>(context);

    if (bloc.state.booking == null) {
      RestClient().createBooking(
          {'title': title.value, 'remark': remark.value}).then((res) {
        bloc.add(
            UpdateBookingEvent(action: 'booking_created', booking: res.data));
        emitSuccess(canSubmitAgain: true);
      }).catchError((error) {
        emitFailure();
        addErrors(error?.response?.data);
      }).whenComplete(() {});
    } else {
      RestClient().updateBooking(bloc.state.booking.id,
          {'title': title.value, 'remark': remark.value}).then((res) {
        bloc.add(
            UpdateBookingEvent(action: 'booking_updated', booking: res.data));
        emitSuccess(canSubmitAgain: true);
      }).catchError((error) {
        emitFailure();
        addErrors(error?.response?.data);
      }).whenComplete(() {});
    }
  }
}
