import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

Future<String> getDeviceIdentifier() async {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceId;

  if (Platform.isAndroid) {
    var androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.id;
  } else if (Platform.isIOS) {
    var iosInfo = await deviceInfo.iosInfo;
    deviceId = iosInfo.identifierForVendor!;
  } else {
    deviceId = 'unknown_device';
  }

  return deviceId;
}
