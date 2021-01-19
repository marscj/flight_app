import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saadiyat/pages/app/index.dart';
import 'package:auto_route/auto_route.dart';
import 'package:saadiyat/router/router.gr.dart';
import 'package:image_cropper/image_cropper.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = 'profile';

  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (_, state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text('Account'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                ListTile(
                  title: Text('Avatar:'),
                  trailing: state?.user?.avatar != null &&
                          state?.user?.avatar['thumbnail'] != null
                      ? CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: state?.user?.avatar['thumbnail'] ?? '',
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Image.asset('assets/user.png'))
                      : Image.asset('assets/user.png'),
                  onTap: () {
                    _scaffoldKey.currentState.showBottomSheet<void>(
                      (_) {
                        return Container(
                          height: 200,
                          color: Colors.white,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: <Widget>[
                                FlatButton(
                                  child: Text('Camera'),
                                  onPressed: () async {
                                    await ImagePicker()
                                        .getImage(source: ImageSource.camera)
                                        .then((file) {
                                      if (file != null) {
                                        return ImageCropper.cropImage(
                                            sourcePath: file.path,
                                            maxHeight: 400,
                                            maxWidth: 400,
                                            aspectRatio: CropAspectRatio(
                                                ratioX: 1.0, ratioY: 1.0),
                                            androidUiSettings:
                                                AndroidUiSettings(
                                                    toolbarTitle: 'Cropper',
                                                    toolbarColor:
                                                        Colors.deepOrange,
                                                    toolbarWidgetColor:
                                                        Colors.white,
                                                    initAspectRatio:
                                                        CropAspectRatioPreset
                                                            .original,
                                                    lockAspectRatio: false),
                                            iosUiSettings: IOSUiSettings(
                                              minimumAspectRatio: 1.0,
                                            )).then((value) {
                                          if (value != null) {
                                            Navigator.pop(context);
                                            BlocProvider.of<AppBloc>(context)
                                                .add(AppChangeAvatarEvent(
                                                    File(file.path)));
                                          }
                                        });
                                      }
                                      return null;
                                    });
                                  },
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                FlatButton(
                                  child: Text('Gallery'),
                                  onPressed: () async {
                                    await ImagePicker()
                                        .getImage(source: ImageSource.gallery)
                                        .then((file) {
                                      if (file != null) {
                                        return ImageCropper.cropImage(
                                            sourcePath: file.path,
                                            maxHeight: 400,
                                            maxWidth: 400,
                                            aspectRatio: CropAspectRatio(
                                                ratioX: 1.0, ratioY: 1.0),
                                            androidUiSettings:
                                                AndroidUiSettings(
                                                    toolbarTitle: 'Cropper',
                                                    toolbarColor:
                                                        Colors.deepOrange,
                                                    toolbarWidgetColor:
                                                        Colors.white,
                                                    initAspectRatio:
                                                        CropAspectRatioPreset
                                                            .original,
                                                    lockAspectRatio: false),
                                            iosUiSettings: IOSUiSettings(
                                              minimumAspectRatio: 1.0,
                                            )).then((value) {
                                          if (value != null) {
                                            Navigator.pop(context);
                                            BlocProvider.of<AppBloc>(context)
                                                .add(AppChangeAvatarEvent(
                                                    File(file.path)));
                                          }
                                        });
                                      }
                                      return null;
                                    });
                                  },
                                ),
                                Divider(
                                  height: 20,
                                  thickness: 6,
                                ),
                                FlatButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('Email:'),
                  subtitle: Text(state?.user?.email ?? ''),
                ),
                Divider(),
                ListTile(
                  title: Text('Name:'),
                  subtitle: Text(state?.user?.name ?? ''),
                ),
                Divider(),
                ListTile(
                  title: Text('Department:'),
                  subtitle: Text(state?.user?.department ?? ''),
                ),
                Divider(),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    child: Text('Change Password'),
                    onPressed: () {
                      context.router.push(ChangePasswordRoute());
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
