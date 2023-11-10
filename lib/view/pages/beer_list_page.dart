import 'package:beer_list/context/beer_context.dart';
import 'package:beer_list/server/model/beer_response.dart';
import 'package:beer_list/themes.dart';
import 'package:beer_list/view/widgets/beer_card.dart';
import 'package:flutter/material.dart';

class BeerListPage extends StatelessWidget {
  const BeerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Beer> beerResponse = context.beerContext().likedBeers;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Liked Beers',
          style: TextStyles.bold20,
        ),
      ),
      body: beerResponse.isEmpty
          ? Center(
              child: Text(
              'No liked beers',
              style: TextStyles.italic18,
            ))
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: beerResponse.length,
              itemBuilder: (BuildContext context, int index) {
                return BeerCard(beer: beerResponse[index]);
              },
            ),
    );
  }
}
