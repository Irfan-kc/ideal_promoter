// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whats_app_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$WhatsAppService extends WhatsAppService {
  _$WhatsAppService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = WhatsAppService;

  @override
  Future<Response<dynamic>> getItOnWhatsApp({required String id}) {
    final Uri $url = Uri.parse('whatsapp-api/broadcast/product/${id}');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
