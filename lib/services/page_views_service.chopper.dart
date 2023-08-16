// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_views_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$PageViewService extends PageViewService {
  _$PageViewService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PageViewService;

  @override
  Future<Response<dynamic>> pageViewData({int? page}) {
    final Uri $url = Uri.parse('page-view/promoter/all');
    final Map<String, dynamic> $params = <String, dynamic>{'page': page};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
