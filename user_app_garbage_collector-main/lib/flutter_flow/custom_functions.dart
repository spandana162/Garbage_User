import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String fetchTrashTypeCode(
  String searchValue,
  List<ReferenceDataRow> valuesList,
) {
  for (var jsonObj in valuesList) {
    if (jsonObj.label == searchValue) return jsonObj.value;
  }
  return searchValue;
}

String? getStatus(String? input) {
  return input!.toLowerCase();
}

dynamic convertLocationToJSON(LatLng? location) {
  // function to convert LatLang to json
  if (location == null) return null;
  return {
    'lat': location.latitude,
    'long': location.longitude,
  };
}

LatLng? covertJSONtoLocation(dynamic location) {
  // function to convert locatio json to LatLang
  if (location != null && location['lat'] != null && location['long'] != null) {
    return LatLng(location['lat'], location['long']);
  } else {
    return null;
  }
}
