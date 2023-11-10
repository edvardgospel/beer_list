import 'package:beer_list/server/model/beer_response.dart';
import 'package:beer_list/themes.dart';
import 'package:flutter/material.dart';

class BeerDetailPage extends StatelessWidget {
  final Beer beer;
  const BeerDetailPage(this.beer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${beer.name} Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              beer.imageUrl,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    beer.name,
                    style: TextStyles.bold24,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    beer.tagline,
                    style: TextStyles.italic18,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    beer.description,
                    style: TextStyles.bold16,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'ABV: ${beer.abv}',
                    style: TextStyles.bold16,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'IBU: ${beer.ibu}',
                    style: TextStyles.bold16,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Brewers tips: ${beer.brewersTips}',
                    style: TextStyles.bold16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
