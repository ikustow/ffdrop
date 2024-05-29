// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dio/dio.dart';

Future checkUser(String address) async {
  final dio = Dio();

  final url = 'https://buildship.run/checkUser';
  final queryParams = {'address': '${address}'};

  try {
    final response = await dio.get(url, queryParameters: queryParams);
    print('Response status: ${response.statusCode}');
    print('Response data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
