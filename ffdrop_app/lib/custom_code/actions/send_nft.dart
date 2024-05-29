// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dio/dio.dart';

Future sendNft(
  String address,
  String nftAddress,
) async {
  final dio = Dio();

  final url = 'https://buildship.run/action';
  final data = {
    'new_owner_address': '${address}',
    'to_addr': '${nftAddress}',
    'type': 'send_nft'
  };

  try {
    final response = await dio.post(url, data: data);
    final responseData = response.data;
    print('Response status: ${response.statusCode}');
    print('Response data: ${responseData}');
  } catch (e) {
    print('Error: $e');
  }
}
