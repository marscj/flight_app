import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_state.dart';

import 'change_password_form_bloc.dart';

class ChangePasswordPage extends StatefulWidget {
  static const String routeName = 'change_password';

  ChangePasswordPage({Key key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangePasswordFormBloc>(
        create: (_) => ChangePasswordFormBloc(_),
        child: Builder(
          builder: (context) {
            // ignore: close_sinks
            ChangePasswordFormBloc formBloc =
                BlocProvider.of<ChangePasswordFormBloc>(context);
            return FormBlocListener<ChangePasswordFormBloc, String, String>(
                onFailure: (context, state) {},
                onSuccess: (context, state) {},
                onSubmitting: (context, state) {},
                child: BlocBuilder<AppBloc, AppState>(
                  builder: (_, state) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text('Change Password'),
                      ),
                      body: SingleChildScrollView(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            TextFieldBlocBuilder(
                                textFieldBloc: formBloc.new_password1,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    labelText: 'New Password1',
                                    errorMaxLines: 6,
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    prefixIcon: const Icon(Icons.lock))),
                            SizedBox(
                              height: 16,
                            ),
                            TextFieldBlocBuilder(
                              textFieldBloc: formBloc.new_password2,
                              textInputAction: TextInputAction.done,
                              suffixButton: SuffixButton.obscureText,
                              decoration: InputDecoration(
                                  labelText: 'New Password2',
                                  errorMaxLines: 6,
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                  prefixIcon: const Icon(Icons.lock)),
                              onSubmitted: (value) {
                                formBloc.submit();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ));
          },
        ));
  }
}
