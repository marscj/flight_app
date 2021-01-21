import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_event.dart';
import 'package:saadiyat/pages/app/app_state.dart';
import 'package:saadiyat/router/router.gr.dart';

import 'login_bloc.dart';
import 'login_form_bloc.dart';
import 'login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key, this.onLoginResult}) : super(key: key);

  final void Function(bool isLoggedIn) onLoginResult;

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  Widget buildForm(LoginState state) => BlocProvider<LoginFormBloc>(
        create: (context) => LoginFormBloc(context),
        child: Builder(
          builder: (context) {
            // ignore: close_sinks
            final LoginFormBloc formBloc =
                BlocProvider.of<LoginFormBloc>(context);
            return FormBlocListener<LoginFormBloc, String, String>(
              onFailure: (context, state) {},
              onSuccess: (context, state) {
                // if (widget?.onLoginResult != null) {
                //   widget?.onLoginResult(true);
                // } else {
                //   context.router.removeUntilRoot();
                //   context.router.replace(BasementRoute());
                // }
              },
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
      return BlocListener<AppBloc, AppState>(
          listener: (_, state) {
            if (state.event is ErrorEvent) {
              Scaffold.of(_).showSnackBar(
                  SnackBar(content: Text(state.event.errorMessage)));
            } else if (state.event is PushRouteEvent) {
              _.router.removeUntilRoot();
              _.router.replace(state.event.pageRouteInfo);
            }
          },
          child: Stack(
            children: [
              SizedBox.expand(
                child: Image.asset(
                  'assets/bg.png',
                  fit: BoxFit.fill,
                ),
              ),
              ListView(
                padding: const EdgeInsets.all(32),
                children: [
                  SizedBox.fromSize(
                    size:
                        Size.fromHeight(MediaQuery.of(context).size.height / 4),
                    child:
                        Image.asset('assets/logo.png', fit: BoxFit.fitHeight),
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
          ));
    });
  }
}
