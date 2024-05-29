// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dio/dio.dart';

Future createJobs(String address) async {
  final dio = Dio();
  print('address: ${address}');
  final url = 'https://buildship.run/createJobs';
  final data = {'address': '${address}'};
  print('data: ${data}');
  try {
    final response = await dio.post(url, data: data);
    print('Response status: ${response}');
  } catch (e) {
    print('Error: $e');
  }
}
