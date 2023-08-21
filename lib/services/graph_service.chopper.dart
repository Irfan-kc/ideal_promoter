// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$GraphService extends GraphService {
  _$GraphService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = GraphService;

  @override
  Future<Response<dynamic>> getEarningsGraphData() {
    final Uri $url = Uri.parse('earning/promoter/monthly/all');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getBusinessVolumeGraphData() {
    final Uri $url = Uri.parse('business-volume/promoter/monthly/all');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
