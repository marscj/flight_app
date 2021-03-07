import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/index.dart';
import 'package:saadiyat/pages/ticket_detail/index.dart';

class TicketDetailBloc extends Bloc<TicketDetailEvent, TicketDetailState> {
  TicketDetailBloc() : super(TicketDetailState.initial());

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  Stream<TicketDetailState> mapEventToState(
    TicketDetailEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'TicketDetailBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}

class ConfrimFormBloc extends FormBloc<String, String> {
  TextFieldBloc reason = TextFieldBloc();

  final BuildContext context;
  TicketDetailBloc bloc;
  final Ticket data;
  final bool confirm;

  ConfrimFormBloc(this.context, this.bloc, this.data, this.confirm) {
    addFieldBlocs(fieldBlocs: [reason]);
    addValidators();
  }

  void addValidators() {
    reason.addValidators(
        [RequiredValidator(errorText: 'This field is required!')]);
  }

  void addErrors(Map<String, dynamic> errors) {
    if (errors == null) {
      return;
    }

    reason.addFieldError(errors['reason'] ?? errors['non_field_errors']);
  }

  @override
  void onSubmitting() {
    EasyLoading.show();

    // ignore: close_sinks
    AppBloc appBloc = BlocProvider.of<AppBloc>(context);

    if (confirm) {
      RestClient().confirmTicket(
          data.id, {'confirm': false, 'reason': reason.value}).then((res) {
        bloc.add(RefreshTicketDetailEvent(res, context));
        appBloc.add(UpdateMessagesEvent(res.extra ?? []));
        emitSuccess(canSubmitAgain: true);
        EasyLoading.showSuccess('Success');
      }).catchError((error) {
        emitFailure();
        EasyLoading.showError('Failed');
      });
    } else {
      RestClient().createComments({
        'object_id': data.id,
        'content_type': 'ticket',
        'content': reason.value
      }).then((value) {
        emitSuccess(canSubmitAgain: true);
        EasyLoading.showSuccess('Success');
      }).catchError((error) {
        emitFailure();
        EasyLoading.showError('Failed');
      });
    }
  }
}
