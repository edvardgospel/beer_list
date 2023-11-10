import 'package:beer_list/server/model/beer_response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BeerContext with ChangeNotifier {
  int currentBeerIndex = 0;
  List<BeerResponse> beers = [];
  List<BeerResponse> likedBeers = [];

  void setCurrentBeerIndex(int value) {
    currentBeerIndex = value;
    notifyListeners();
  }

  void setBeers(List<BeerResponse> value) {
    beers = value;
    notifyListeners();
  }

  void addToLikedBeers(BeerResponse value) {
    likedBeers.add(value);
    notifyListeners();
  }
}

extension BeerContextExtension on BuildContext {
  BeerContext beerContext({listen = true}) => Provider.of<BeerContext>(this, listen: listen);
}
