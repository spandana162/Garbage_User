import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _screenName =
          await secureStorage.getString('ff_screenName') ?? _screenName;
    });
    await _safeInitAsync(() async {
      _firebasetoken =
          await secureStorage.getString('ff_firebasetoken') ?? _firebasetoken;
    });
    await _safeInitAsync(() async {
      _Municipality =
          await secureStorage.getString('ff_Municipality') ?? _Municipality;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _screenName = 'home';
  String get screenName => _screenName;
  set screenName(String _value) {
    _screenName = _value;
    secureStorage.setString('ff_screenName', _value);
  }

  void deleteScreenName() {
    secureStorage.delete(key: 'ff_screenName');
  }

  LatLng? _userLocation;
  LatLng? get userLocation => _userLocation;
  set userLocation(LatLng? _value) {
    _userLocation = _value;
  }

  String _firebasetoken = '';
  String get firebasetoken => _firebasetoken;
  set firebasetoken(String _value) {
    _firebasetoken = _value;
    secureStorage.setString('ff_firebasetoken', _value);
  }

  void deleteFirebasetoken() {
    secureStorage.delete(key: 'ff_firebasetoken');
  }

  String _Municipality = '';
  String get Municipality => _Municipality;
  set Municipality(String _value) {
    _Municipality = _value;
    secureStorage.setString('ff_Municipality', _value);
  }

  void deleteMunicipality() {
    secureStorage.delete(key: 'ff_Municipality');
  }

  final _fetchUserDetailsManager = FutureRequestManager<List<UsersRow>>();
  Future<List<UsersRow>> fetchUserDetails({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsersRow>> Function() requestFn,
  }) =>
      _fetchUserDetailsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFetchUserDetailsCache() => _fetchUserDetailsManager.clear();
  void clearFetchUserDetailsCacheKey(String? uniqueKey) =>
      _fetchUserDetailsManager.clearRequest(uniqueKey);

  final _fetchNotificationsManager =
      FutureRequestManager<List<TripNotificationsRow>>();
  Future<List<TripNotificationsRow>> fetchNotifications({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<TripNotificationsRow>> Function() requestFn,
  }) =>
      _fetchNotificationsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFetchNotificationsCache() => _fetchNotificationsManager.clear();
  void clearFetchNotificationsCacheKey(String? uniqueKey) =>
      _fetchNotificationsManager.clearRequest(uniqueKey);

  final _fetchDetailedNotificationsManager =
      FutureRequestManager<List<TripNotificationDetailsViewRow>>();
  Future<List<TripNotificationDetailsViewRow>> fetchDetailedNotifications({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<TripNotificationDetailsViewRow>> Function() requestFn,
  }) =>
      _fetchDetailedNotificationsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFetchDetailedNotificationsCache() =>
      _fetchDetailedNotificationsManager.clear();
  void clearFetchDetailedNotificationsCacheKey(String? uniqueKey) =>
      _fetchDetailedNotificationsManager.clearRequest(uniqueKey);
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
