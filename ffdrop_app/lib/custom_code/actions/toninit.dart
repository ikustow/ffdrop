// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:js';

import 'package:darttonconnect/ton_connect.dart';
import 'package:darttonconnect/models/wallet_app.dart';

Future<void> toninit() async {
  final connector = TonConnect(
      'https://gist.githubusercontent.com/ikustow/cb642b537e3ea0fab51527a60a8a895a/raw/b78a6d3a27fd4ab15d902e907d293b0944280221/gistfile1.txt');
  final List<WalletApp> wallets = await connector.getWallets();

  var generatedUrl = await connector.connect(wallets.first);

  FFAppState().tonLink = generatedUrl.toString();
  print(generatedUrl.toString());

  FFAppState().tonConnector = connector;

  void statusChanged(dynamic walletInfo) {
    FFAppState().tonConnected = connector.connected;
    FFAppState().address = connector.wallet!.account!.address;
  }

  connector.onStatusChange(statusChanged);
}
