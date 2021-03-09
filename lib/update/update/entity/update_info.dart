import 'dart:convert';

/// 0:无版本更新
const int NO_NEW_VERSION = 0;

/// 1:有版本更新，不需要强制升级
const int HAVE_NEW_VERSION = 1;

/// 2:有版本更新，需要强制升级
const int HAVE_NEW_VERSION_FORCED_UPLOAD = 2;

///
/// 默认网络请求返回的结果格式
///
class UpdateInfo {
  ///请求错误信息
  final String msg;

  ///更新的状态
  final int updateStatus;

  ///最新版本号[根据版本号来判别是否需要升级]
  final int versionCode;

  ///最新APP版本的名称[用于展示的版本名]
  final String versionName;

  ///APP更新时间
  final String uploadTime;

  ///APP变更的内容
  final String modifyContent;

  ///下载地址
  final String downloadUrl;

  ///Apk MD5值
  final String apkMd5;

  ///Apk大小【单位：KB】
  final int apkSize;

  UpdateInfo(
      {this.msg,
      this.updateStatus,
      this.versionCode,
      this.versionName,
      this.uploadTime,
      this.modifyContent,
      this.downloadUrl,
      this.apkMd5,
      this.apkSize});

  static UpdateInfo fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UpdateInfo(
        msg: '',
        updateStatus: 2,
        versionCode: map['code'] != null ? int.parse(map['code']) : 0,
        versionName: map['version'],
        // uploadTime: map['UploadTime'],
        modifyContent: '',
        downloadUrl: map['file'] ?? map['redirect'],
        apkMd5: '',
        apkSize: 40960);
  }

  static UpdateInfo fromJson(Map<String, dynamic> source) => fromMap(source);

  @override
  String toString() {
    return 'UpdateInfo Msg: $msg, UpdateStatus: $updateStatus, VersionCode: $versionCode, VersionName: $versionName, UploadTime: $uploadTime, ModifyContent: $modifyContent, DownloadUrl: $downloadUrl, ApkMd5: $apkMd5, ApkSize: $apkSize';
  }
}
