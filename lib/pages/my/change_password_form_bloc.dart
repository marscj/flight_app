import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_event.dart';

class ChangePasswordFormBloc extends FormBloc<String, String> {
  // ignore_for_file: non_constant_identifier_names
  final TextFieldBloc new_password1 = TextFieldBloc();
  final TextFieldBloc new_password2 = TextFieldBloc();

  final BuildContext context;

  ChangePasswordFormBloc(this.context) {
    addFieldBlocs(fieldBlocs: [new_password1, new_password2]);
    addValidators();
  }

  void addErrors(Map<String, dynamic> errors) {
    if (errors == null) {
      return;
    }

    new_password1.addFieldError(errors['new_password1']);
    new_password2.addFieldError(errors['new_password2'] ??
        errors['non_field_errors'] ??
        errors['detail']);
  }

  void addValidators() {
    new_password1.addValidators(
        [RequiredValidator(errorText: 'This field is required!')]);
    new_password2.addValidators(
        [RequiredValidator(errorText: 'This field is required!')]);
  }

  @override
  Stream<FormBlocState<String, String>> mapEventToState(FormBlocEvent event) {
    return super.mapEventToState(event);
  }

  @override
  void onSubmitting() {
    // ignore_for_file: close_sinks
    AppBloc appBloc = BlocProvider.of<AppBloc>(context);

    RestClient().changePassword({
      'new_password1': new_password1.value,
      'new_password2': new_password2.value
    }).then((res) {
      appBloc.add(AppChangePasswordEvent(new_password1.value));
      emitSuccess(canSubmitAgain: true);
    }).catchError((onError) {
      emitFailure();
      addErrors(onError?.response?.data);
    });
  }
}
