import 'dart:math';
import 'package:beer_list/server/model/beer_response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BeerContext with ChangeNotifier {
  int currentBeerIndex = 0;
  List<Beer> beers = [];
  List<Beer> likedBeers = [];

  void setCurrentBeerIndex(int value) {
    currentBeerIndex = value;
    notifyListeners();
  }

  void setBeers(List<Beer> value) {
    beers = List.from(value)..shuffle(Random());
    notifyListeners();
  }

  void shuffleBeers() {
    beers = List.from(beers)..shuffle(Random());
    notifyListeners();
  }

  void addToLikedBeers(Beer value) {
    likedBeers.add(value);
    notifyListeners();
  }

  void clearSettings() {
    currentBeerIndex = 0;
    likedBeers = [];
    shuffleBeers();
    notifyListeners();
  }
}

extension BeerContextExtension on BuildContext {
  BeerContext beerContext({listen = true}) => Provider.of<BeerContext>(this, listen: listen);
}
