// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$CategoryService extends CategoryService {
  _$CategoryService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CategoryService;

  @override
  Future<Response<dynamic>> getCategories() {
    final Uri $url = Uri.parse('category/user/all');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
