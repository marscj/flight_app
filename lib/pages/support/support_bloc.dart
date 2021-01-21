import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/support/index.dart';

// ignore_for_file: non_constant_identifier_names

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  SupportBloc() : super(SupportState.initial());

  @override
  Stream<SupportState> mapEventToState(
    SupportEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'SupportBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}

class CommentFormBloc extends FormBloc<String, String> {
  TextFieldBloc content = TextFieldBloc();

  final int object_id;
  final String content_type;
  final BuildContext context;

  CommentFormBloc(this.context, this.object_id, this.content_type) {
    addFieldBlocs(fieldBlocs: [content]);
    addValidators();
  }

  void addValidators() {
    content.addValidators(
        [RequiredValidator(errorText: 'This field is required!')]);
  }

  void addErrors(Map<String, dynamic> errors) {
    if (errors == null) {
      return;
    }

    content.addFieldError(errors['content'] ?? errors['non_field_errors']);
  }

  @override
  void onSubmitting() {
    EasyLoading.show();
    RestClient().createComments({
      'object_id': object_id,
      'content_type': content_type,
      'content': content.value
    }).then((value) {
      emitSuccess(canSubmitAgain: true);
      EasyLoading.showSuccess('Success');
    }).catchError((error) {
      emitFailure();
      EasyLoading.showError('Failed');
    });
  }
}
