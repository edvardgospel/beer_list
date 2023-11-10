class BeerResponse {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final double abv;
  final double ibu;
  final String imageUrl;
  final String brewersTips;

  BeerResponse({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.abv,
    required this.ibu,
    required this.imageUrl,
    required this.brewersTips,
  });

  factory BeerResponse.fromJson(Map<String, dynamic> json) {
    return BeerResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      tagline: json['tagline'] as String,
      description: json['description'] as String,
      abv: (json['abv'] as num).toDouble(),
      ibu: (json['ibu'] as num?)?.toDouble() ?? 0.0,
      imageUrl: json['image_url'] as String,
      brewersTips: json['brewers_tips'] as String,
    );
  }
}
