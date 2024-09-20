import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Notifications',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: FlutterFlowTheme.of(context).secondary,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineMediumFamily),
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: FutureBuilder<List<TripNotificationDetailsViewRow>>(
          future: FFAppState().fetchDetailedNotifications(
            requestFn: () => TripNotificationDetailsViewTable().queryRows(
              queryFn: (q) => q
                  .eq(
                    'user_id',
                    currentUserUid,
                  )
                  .order('created_at'),
            ),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            List<TripNotificationDetailsViewRow>
                listViewTripNotificationDetailsViewRowList = snapshot.data!;
            return ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: listViewTripNotificationDetailsViewRowList.length,
              separatorBuilder: (_, __) => SizedBox(height: 10.0),
              itemBuilder: (context, listViewIndex) {
                final listViewTripNotificationDetailsViewRow =
                    listViewTripNotificationDetailsViewRowList[listViewIndex];
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (listViewTripNotificationDetailsViewRow.seen ==
                          false) {
                        await TripNotificationsTable().update(
                          data: {
                            'updated_at':
                                supaSerialize<DateTime>(getCurrentTimestamp),
                            'seen': true,
                          },
                          matchingRows: (rows) => rows
                              .eq(
                                'trip_id',
                                listViewTripNotificationDetailsViewRow.tripId,
                              )
                              .eq(
                                'user_id',
                                listViewTripNotificationDetailsViewRow.userId,
                              ),
                        );
                        FFAppState().clearFetchNotificationsCache();
                        FFAppState().clearFetchDetailedNotificationsCache();
                      }
                      if (listViewTripNotificationDetailsViewRow.status !=
                          'started') {
                        context.pushNamed(
                          'TripDetails',
                          queryParameters: {
                            'tripId': serializeParam(
                              listViewTripNotificationDetailsViewRow.tripId,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        context.pushNamed(
                          'TripTracking',
                          queryParameters: {
                            'tripId': serializeParam(
                              listViewTripNotificationDetailsViewRow.tripId,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0.0,
                            color: Color(0xFFE0E3E7),
                            offset: Offset(0.0, 1.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(0.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (listViewTripNotificationDetailsViewRow
                                        .seen ==
                                    false)
                                  Container(
                                    width: 4.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color:
                                          listViewTripNotificationDetailsViewRow
                                                  .seen!
                                              ? Color(0x00000000)
                                              : FlutterFlowTheme.of(context)
                                                  .primary,
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                  ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Driver is near your location',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    dateTimeFormat(
                                        'MMMMEEEEd',
                                        listViewTripNotificationDetailsViewRow
                                            .createdAt!),
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
