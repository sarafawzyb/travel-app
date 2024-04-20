import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyLocaleController extends GetxController{

  // Locale intiallang = sharepref!.getString("lang") == "ar"? Locale("ar"): Locale("en");
  
  void changeLang(String codelang){
    Locale locale = Locale(codelang);
    // sharepref!.setString("lang",codelang);
    Get.updateLocale(locale);
  }
}