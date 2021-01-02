import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import 'login_bloc.dart';
import 'login_form_bloc.dart';
import 'login_state.dart';

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
  final _formKey = GlobalKey<FormState>();
  Widget buildForm(InLoginState state) => BlocProvider<LoginFormBloc>(
        create: (context) => LoginFormBloc(context),
        child: Builder(
          builder: (context) {
            // ignore: close_sinks
            final LoginFormBloc formBloc =
                BlocProvider.of<LoginFormBloc>(context);
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
                  SizedBox(
                    height: 16,
                  ),
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
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  state.loading
                      ? Container(
                          alignment: Alignment.center,
                          width: 64,
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          alignment: Alignment.center,
                          width: 64,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_right_alt,
                              size: 32,
                            ),
                            splashColor: Colors.white,
                            color: Colors.black,
                            onPressed: () {
                              formBloc.submit();
                            },
                          ))
                ],
              ),
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (
      BuildContext context,
      LoginState currentState,
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
                Form(key: _formKey, child: buildForm(currentState)),
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
