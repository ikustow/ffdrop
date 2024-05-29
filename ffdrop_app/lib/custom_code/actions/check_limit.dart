// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dio/dio.dart';

Future<int> checkLimit() async {
  final dio = Dio();
  var result = 0;
  final url = 'https://buildship.run/chekLimit';

  try {
    final response = await dio.get(url);
    result = response.data as int;
  } catch (e) {
    print('Error: $e');
  }
  return result;
}
