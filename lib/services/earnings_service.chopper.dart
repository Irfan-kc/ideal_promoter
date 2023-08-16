// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earnings_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$EarningsService extends EarningsService {
  _$EarningsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = EarningsService;

  @override
  Future<Response<dynamic>> earningsData({
    String? fromDate,
    String? toDate,
    int? page,
  }) {
    final Uri $url = Uri.parse('earning/promoter/all');
    final Map<String, dynamic> $params = <String, dynamic>{
      'fromDate': fromDate,
      'toDate': toDate,
      'page': page,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
