import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
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
  TextFieldBloc comment = TextFieldBloc();

  final int object_id;
  final String content_type;
  final BuildContext context;

  CommentFormBloc(this.context, this.object_id, this.content_type) {
    addFieldBlocs(fieldBlocs: [comment]);
    addValidators();
  }

  void addValidators() {
    comment.addValidators(
        [RequiredValidator(errorText: 'This field is required!')]);
  }

  void addErrors(Map<String, dynamic> errors) {
    if (errors == null) {
      return;
    }

    comment.addFieldError(errors['comment'] ?? errors['non_field_errors']);
  }

  @override
  void onSubmitting() {
    // RestService.instance.postComment({
    //   'object_id': object_id,
    //   'content_type': content_type,
    //   'comment': comment.value,
    //   'rating': rating.value.toInt()
    // }).then((value) {
    //   emitSuccess(canSubmitAgain: true);
    // }).catchError((onError) {
    //   emitFailure();
    //   addErrors(onError?.response?.data);
    // });
  }
}
