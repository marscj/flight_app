import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:saadiyat/index/index.dart';
import 'package:saadiyat/login/index.dart';
import 'package:saadiyat/login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final Widget buildForm = BlocProvider<LoginFormBloc>(
    create: (context) => LoginFormBloc(),
    child: Builder(
      builder: (context) {
        // ignore: close_sinks
        final LoginFormBloc formBloc = BlocProvider.of<LoginFormBloc>(context);
        return FormBlocListener<LoginFormBloc, String, String>(
          onFailure: (context, state) {},
          onSuccess: (context, state) {},
          onSubmitting: (context, state) {},
          child: ListBody(
            children: [
              TextFieldBlocBuilder(
                  textFieldBloc: formBloc.email,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      errorMaxLines: 6,
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.email))),
              TextFieldBlocBuilder(
                textFieldBloc: formBloc.password,
                textInputAction: TextInputAction.done,
                suffixButton: SuffixButton.obscureText,
                decoration: InputDecoration(
                    hintText: 'Password',
                    errorMaxLines: 6,
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.lock)),
                onSubmitted: (value) {
                  formBloc.submit();
                },
              )
            ],
          ),
        );
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, IndexState>(builder: (
      BuildContext context,
      IndexState currentState,
    ) {
      if (currentState is InLoginState) {
        return Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                'assets/bg.png',
                fit: BoxFit.cover,
              ),
            ),
            ListView(
              padding: const EdgeInsets.all(32),
              children: [
                SizedBox.fromSize(
                  size: Size.fromHeight(MediaQuery.of(context).size.height / 4),
                  child: Image.asset('assets/logo.png', fit: BoxFit.fitHeight),
                ),
                Center(
                  child: Text(
                    'SAADIYAT WAY',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                buildForm,
              ],
            )
          ],
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
