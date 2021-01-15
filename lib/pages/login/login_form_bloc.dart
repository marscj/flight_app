import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_event.dart';
import 'package:saadiyat/pages/login/index.dart';

import 'login_event.dart';

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

    email.addFieldError(errors['email']);
    password.addFieldError(
        errors['password'] ?? errors['non_field_errors'] ?? errors['detail']);
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
  Future<void> close() {
    // TODO: implement close
    email.close();
    password.close();
    return super.close();
  }

  @override
  void onSubmitting() {
    // ignore_for_file: close_sinks
    LoginBloc loginBloc = BlocProvider.of<LoginBloc>(context);
    AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    loginBloc.add(LoadLoginEvent(true));
    RestClient()
        .login({'email': email.value, 'password': password.value}).then((res) {
      appBloc.add(AppLoginEvent(res));
      emitSuccess(canSubmitAgain: true);
    }).catchError((onError) {
      emitFailure();
      addErrors(onError?.response?.data);
    }).whenComplete(() {
      loginBloc.add(LoadLoginEvent(false));
    });
  }
}
