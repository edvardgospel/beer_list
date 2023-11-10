import 'package:beer_list/server/model/beer_response.dart';
import 'package:beer_list/services/navigator.dart';
import 'package:beer_list/view/pages/beer_detail_page.dart';
import 'package:flutter/material.dart';

class BeerCard extends StatelessWidget {
  final Beer beer;

  const BeerCard({
    Key? key,
    required this.beer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navTo(BeerDetailPage(beer), context),
      child: Card(
        margin: const EdgeInsets.all(8),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Image.network(
                beer.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      beer.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      beer.tagline,
                      style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
