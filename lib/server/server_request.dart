import 'dart:async';
import 'package:beer_list/server/http_util.dart';
import 'package:beer_list/server/model/beer_response.dart';

Future<List<Beer>> fetchBeers() async {
  var jsonResp = await getRequest('/v2/beers');
  return parseBeers(jsonResp);
}

List<Beer> parseBeers(List<dynamic> jsonResponse) {
  return jsonResponse
      .map<Beer>((json) => Beer.fromJson(json as Map<String, dynamic>))
      .toList();
}
