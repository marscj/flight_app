import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:saadiyat/apis/client.dart';
import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/login/index.dart';
import 'package:saadiyat/store/store.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final TextFieldBloc email = TextFieldBloc();
  final TextFieldBloc password = TextFieldBloc();
  final IndexBloc bloc;

  LoginFormBloc(this.bloc) {
    addFieldBlocs(fieldBlocs: [email, password]);
    addValidators();
  }

  void addErrors(Map<String, dynamic> errors) {
    if (errors == null) {
      return;
    }
    print(errors);
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
    bloc.add(LoadLoginEvent(true));
    RestClient()
        .login({'email': email.value, 'password': password.value}).then((res) {
      return Store.instance.setToken(res.token);
    }).then((res) {
      Future.delayed(Duration(seconds: 1)).then((res) {
        // bloc.add(LoadHomeEvent());
      });
    }).catchError((onError) {
      emitFailure();
      addErrors(onError?.response?.data);
    }).whenComplete(() {
      bloc.add(LoadLoginEvent(false));
    });
  }
}
