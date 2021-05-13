import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'ar_Ar.dart';
import 'en_US.dart';
import 'hi_IND.dart';


class LocailzationService extends Translations{
  static final locale=Locale('en','US');
  static final fallBackLocale=Locale('en','US');

  static final langs=['English','Hindi','Arabic'];
  static final locales=[
    Locale('en','US'),
    Locale('hi','IND'),
    Locale('ar','Ar'),

  ];

  @override
  Map<String,Map<String,String>> get keys =>{
    'en_US':enUS,
    'hi_IND':hiIN,
    'ar_Ar':arAE,
  };

  void changeLocale(String lang){
    final locale=getLocaleFromLanguage(lang);
    final box=GetStorage();
    box.write('lng',lang);
    Get.updateLocale(locale);
  }


  Locale getLocaleFromLanguage(String lang){
    for(int i=0;i<langs.length;i++){
      if(lang==langs[i]) return locales[i];
    }
    return Get.locale;
  }


  Locale getCurrentLocale(){
    final box=GetStorage();
    Locale defaultLocale;
    if(box.read('lng')!=null){
      final locale=getLocaleFromLanguage(box.read('lng'));
      defaultLocale=locale;
    }
    else{
      defaultLocale=Locale('en','US');
    }
    return defaultLocale;
  }

  String getCurrentLang(){
    final box=GetStorage();
    return box.read('lng')!=null?box.read('lng'):'English';
  }
}