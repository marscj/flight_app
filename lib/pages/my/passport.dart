import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/app/app_bloc.dart';
import 'package:saadiyat/pages/app/app_state.dart';
import 'package:saadiyat/widgets/custom_appbar.dart';

class PassportPage extends StatefulWidget {
  static const String routeName = 'passport';

  PassportPage({Key key}) : super(key: key);

  @override
  _PassportPageState createState() => _PassportPageState();
}

class _PassportPageState extends State<PassportPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (_, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: Text('Passprot'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Card(
                child: Column(
              children: [
                ListTile(
                  title: Text('Code:'),
                  subtitle: Text(state?.user?.passport_code ?? ''),
                ),
                Divider(),
                ListTile(
                  title: Text('Type:'),
                  subtitle: Text(state?.user?.possport_type ?? ''),
                ),
                Divider(),
                ListTile(
                  title: Text('No.:'),
                  subtitle: Text(state?.user?.passport_no ?? ''),
                ),
                Divider(),
                ListTile(
                  title: Text('First Name:'),
                  subtitle: Text(state?.user?.first_name ?? ''),
                ),
                Divider(),
                ListTile(
                  title: Text('Last Name:'),
                  subtitle: Text(state?.user?.last_name ?? ''),
                ),
                Divider(),
                ListTile(
                  title: Text('Sex:'),
                  subtitle: Text(state?.user?.passport_sex ?? ''),
                ),
                Divider(),
                ListTile(
                  title: Text('Date of birth:'),
                  subtitle: Text(state?.user?.passport_date_birth ?? ''),
                ),
                Divider(),
                ListTile(
                  title: Text('Place of birth:'),
                  subtitle: Text(state?.user?.passport_place_birth ?? ''),
                ),
                Divider(),
                ListTile(
                  title: Text('Nationality:'),
                  subtitle: Text(state?.user?.passport_nationality ?? ''),
                ),
                Divider(),
                ListTile(
                  title: Text('Issuing authority:'),
                  subtitle: Text(state?.user?.passport_issuing_authority ?? ''),
                ),
                Divider(),
                ListTile(
                  title: Text('Date of issue:'),
                  subtitle: Text(state?.user?.passport_date_issue ?? ''),
                ),
                Divider(),
                ListTile(
                  title: Text('Date of expiry:'),
                  subtitle: Text(state?.user?.passport_date_expiry ?? ''),
                ),
              ],
            )),
          ),
        );
      },
    );
  }
}
