

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:device_info/device_info.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils{
  static showToast(String msg){
    Fluttertoast.showToast(msg: msg,
    toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16
    );
  }

  static Future<Map<String,String>>deviceParams()async{
    Map<String,String> params = {};
   // var deviceInfo = DeviceInfoPlugin();
    if(Platform.isIOS){
     // var iosDeviceInfo = await deviceInfo.iosInfo;
      params.addAll({
       // 'deviceId': iosDeviceInfo.identifierForVendor,
        'deviceType':'I',
        'deviceToken':''
      });
    }
    else{
    //  var androidDeviceInfo = await deviceInfo.androidInfo;
      params.addAll({
   //     'deviceId':androidDeviceInfo.androidId,
        'deviceType': 'A',
        'deviceToken':''
      });
    }
    return params;

  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

}