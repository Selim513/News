// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:hive/hive.dart';

class appstoorage {
  static String NAME = "NAME";
  static String IMAGE = "IMAGE";
  static String Upload = "Upload";
  static cachedData(String key, dynamic value) {
    var box = Hive.box("user");
    box.put(key, value);
  }

  static Future<dynamic> getcahcedData(String key) async {
    var box = Hive.box("user");
    return await box.get(key);
  }
}
