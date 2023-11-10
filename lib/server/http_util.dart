import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/retry.dart';

dynamic getRequest(
  String path,
  Map<String, String> params,
) async {
  var retryClient = RetryClient(Client());
  try {
    var url = Uri.https('api.punkapi.com', path);
    Map<String, String> headers = {};

    var response = await retryClient.get(url, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  } catch (e) {
    print('---error:${e.toString()}');
  }
  return null;
}
