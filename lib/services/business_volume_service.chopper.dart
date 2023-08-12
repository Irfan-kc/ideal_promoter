// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_volume_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$BusinessVolumeService extends BusinessVolumeService {
  _$BusinessVolumeService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = BusinessVolumeService;

  @override
  Future<Response<dynamic>> getBusinessVolume() {
    final Uri $url = Uri.parse('business-volume/promoter/all');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
