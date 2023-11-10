import 'dart:async';
import 'dart:convert';
import 'package:beer_list/server/http_util.dart';
import 'package:beer_list/server/model/beer_response.dart';

Future<List<BeerResponse>> fetchBeers() async {
  var jsonResp = await getRequest(
    '/v2/beers',
    {},
  );
  return parseBeers(jsonResp);
}

List<BeerResponse> parseBeers(List<dynamic> jsonResponse) {
  return jsonResponse
      .map<BeerResponse>((json) => BeerResponse.fromJson(json as Map<String, dynamic>))
      .toList();
}
