import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';

dynamic getRequest(String path) async {
  var retryClient = RetryClient(Client());
  try {
    var url = Uri.https('api.punkapi.com', path);

    var response = await retryClient.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  } catch (e) {
    debugPrint('Error while fetching data: $e');
  }
  return null;
}
