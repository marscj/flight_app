import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final TextFieldBloc email = TextFieldBloc();
  final TextFieldBloc password = TextFieldBloc();

  final BuildContext context;

  LoginFormBloc(this.context) {
    addFieldBlocs(fieldBlocs: [email, password]);
    addValidators();
  }

  void addErrors(Map<String, dynamic> errors) {
    if (errors == null) {
      return;
    }

    email.addFieldError(errors['email'] ?? errors['non_field_errors']);
    password.addFieldError(errors['password'] ?? errors['non_field_errors']);
  }

  void addValidators() {
    email.addValidators(
        [RequiredValidator(errorText: 'This field is required!')]);
    password.addValidators(
        [RequiredValidator(errorText: 'This field is required!')]);
  }

  @override
  Stream<FormBlocState<String, String>> mapEventToState(FormBlocEvent event) {
    return super.mapEventToState(event);
  }

  @override
  void onSubmitting() {}
}
