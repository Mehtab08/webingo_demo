class Stay {
  final String id;
  final String title;
  final String location;
  final String image;
  final double rating;
  final int reviewsCount;
  final int guests;
  final int bedrooms;
  final int beds;
  final int bathrooms;
  final double originalPrice;
  final double discountedPrice;
  final double totalPrice;
  bool isFavorite;

  Stay({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
    required this.rating,
    required this.reviewsCount,
    required this.guests,
    required this.bedrooms,
    required this.beds,
    required this.bathrooms,
    required this.originalPrice,
    required this.discountedPrice,
    required this.totalPrice,
    required this.isFavorite,
  });

  factory Stay.fromJson(Map<String, dynamic> json, String id) {
    return Stay(
      id: id ?? '',
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      image: json['image'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      reviewsCount: json['reviewsCount'] ?? 0,
      guests: json['guests'] ?? 0,
      bedrooms: json['bedrooms'] ?? 0,
      beds: json['beds'] ?? 0,
      bathrooms: json['bathrooms'] ?? 0,
      originalPrice: (json['originalPrice'] ?? 0).toDouble(),
      discountedPrice: (json['discountedPrice'] ?? 0).toDouble(),
      totalPrice: (json['totalPrice'] ?? 0).toDouble(),
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'image': image,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'guests': guests,
      'bedrooms': bedrooms,
      'beds': beds,
      'bathrooms': bathrooms,
      'originalPrice': originalPrice,
      'discountedPrice': discountedPrice,
      'totalPrice': totalPrice,
      'isFavorite': isFavorite,
    };
  }
}
