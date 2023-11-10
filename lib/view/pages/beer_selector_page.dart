import 'package:beer_list/context/beer_context.dart';
import 'package:beer_list/server/model/beer_response.dart';
import 'package:beer_list/services/navigator.dart';
import 'package:beer_list/themes.dart';
import 'package:beer_list/view/pages/beer_list_page.dart';
import 'package:beer_list/view/widgets/image_view.dart';
import 'package:flutter/material.dart';

class BeerSelectorPage extends StatelessWidget {
  const BeerSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Beer> beers = context.beerContext().beers;
    int currentBeerIndex = context.beerContext().currentBeerIndex;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Select your preference",
          style: TextStyles.bold20,
        ),
      ),
      body: beers.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageView(beers[currentBeerIndex].imageUrl),
                  Text(
                    beers[currentBeerIndex].name,
                    style: TextStyles.bold24,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    beers[currentBeerIndex].tagline,
                    style: TextStyles.italic18,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.beerContext(listen: false).setCurrentBeerIndex(currentBeerIndex + 1);
                          if (currentBeerIndex == 9) {
                            navTo(const BeerListPage(), context, onPop: () {
                              context.beerContext(listen: false).clearSettings();
                            });
                          }
                        },
                        style: ButtonStyles.dislikeButton,
                        child: Text(
                          'Dislike',
                          style: TextStyles.bold16,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.beerContext(listen: false).addToLikedBeers(beers[currentBeerIndex]);
                          context.beerContext(listen: false).setCurrentBeerIndex(currentBeerIndex + 1);
                          if (currentBeerIndex == 9) {
                            navTo(const BeerListPage(), context, onPop: () {
                              context.beerContext(listen: false).clearSettings();
                            });
                          }
                        },
                        style: ButtonStyles.likeButton,
                        child: Text(
                          'Like',
                          style: TextStyles.bold16,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
