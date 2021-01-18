import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/pages/app/index.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = 'profile';

  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Account'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text('Avatar'),
                  trailing: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: state?.user?.avatar['thumbnail'],
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          Image.asset('assets/user.png')),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  title: Text('Email'),
                  subtitle: Text(state.user.email),
                ),
                Divider(),
                ListTile(
                  title: Text('Name'),
                  subtitle: Text(state.user.name),
                ),
                Divider(),
                ListTile(
                  title: Text('Department'),
                  subtitle: Text(state.user.department),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    child: Text('Change Password'), onPressed: () {}),
              ],
            ),
          ),
        );
      },
    );
  }
}
