import '../database.dart';

class TripDetailsViewTable extends SupabaseTable<TripDetailsViewRow> {
  @override
  String get tableName => 'trip_details_view';

  @override
  TripDetailsViewRow createRow(Map<String, dynamic> data) =>
      TripDetailsViewRow(data);
}

class TripDetailsViewRow extends SupabaseDataRow {
  TripDetailsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TripDetailsViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get driverId => getField<String>('driver_id');
  set driverId(String? value) => setField<String>('driver_id', value);

  String? get requestId => getField<String>('request_id');
  set requestId(String? value) => setField<String>('request_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get scheduledAt => getField<DateTime>('scheduled_at');
  set scheduledAt(DateTime? value) => setField<DateTime>('scheduled_at', value);

  DateTime? get startedAt => getField<DateTime>('started_at');
  set startedAt(DateTime? value) => setField<DateTime>('started_at', value);

  DateTime? get completedAt => getField<DateTime>('completed_at');
  set completedAt(DateTime? value) => setField<DateTime>('completed_at', value);

  dynamic? get driverLocation => getField<dynamic>('driver_location');
  set driverLocation(dynamic? value) =>
      setField<dynamic>('driver_location', value);

  String? get driverName => getField<String>('driver_name');
  set driverName(String? value) => setField<String>('driver_name', value);
}