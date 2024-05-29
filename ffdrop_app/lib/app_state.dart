import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _master = prefs.getString('ff_master') ?? _master;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  dynamic _tonConnector;
  dynamic get tonConnector => _tonConnector;
  set tonConnector(dynamic _value) {
    _tonConnector = _value;
  }

  String _tonLink = '';
  String get tonLink => _tonLink;
  set tonLink(String _value) {
    _tonLink = _value;
  }

  bool _tonConnected = false;
  bool get tonConnected => _tonConnected;
  set tonConnected(bool _value) {
    _tonConnected = _value;
  }

  String _address = '';
  String get address => _address;
  set address(String _value) {
    _address = _value;
  }

  String _nftJobStatus = 'init';
  String get nftJobStatus => _nftJobStatus;
  set nftJobStatus(String _value) {
    _nftJobStatus = _value;
  }

  String _jettonJobsStatus = 'init';
  String get jettonJobsStatus => _jettonJobsStatus;
  set jettonJobsStatus(String _value) {
    _jettonJobsStatus = _value;
  }

  String _master = '';
  String get master => _master;
  set master(String _value) {
    _master = _value;
    prefs.setString('ff_master', _value);
  }

  int _limit = 1;
  int get limit => _limit;
  set limit(int _value) {
    _limit = _value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
