import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:saadiyat/update/update/update_parser.dart';
import 'package:saadiyat/update/update/update_prompter.dart';
import 'package:saadiyat/update/utils/common.dart';

import '../utils/http.dart';

/// 版本更新管理
class UpdateManager {
  ///全局初始化
  static init(
      {String baseUrl, int timeout = 5000, Map<String, dynamic> headers}) {
    HttpUtils.init(baseUrl: baseUrl, timeout: timeout, headers: headers);
  }

  static void checkUpdate(BuildContext context, String url) {
    HttpUtils.get(url, {'type': Platform.isAndroid ? 'Android' : 'Ios'})
        .then((response) {
      UpdateParser.parseJson(response['result']).then((value) => {
            if (value != null && value.hasUpdate)
              UpdatePrompter(
                  updateEntity: value,
                  onInstall: (String filePath) {
                    CommonUtils.installAPP(filePath);
                  })?.show(context)
          });
    }).catchError((onError) {
      // ToastUtils.error(onError);
    });
  }
}

typedef InstallCallback = Function(String filePath);
