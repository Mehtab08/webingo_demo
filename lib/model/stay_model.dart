class Stay {
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
}

List<Stay> stayList = [
  Stay(
    title: "Tiny home in Rælingen",
    location: "Rælingen",
    image: "images/tiny_home.jpg",
    rating: 4.96,
    reviewsCount: 217,
    guests: 4,
    bedrooms: 2,
    beds: 2,
    bathrooms: 1,
    originalPrice: 117,
    discountedPrice: 91,
    totalPrice: 273,
    isFavorite: false,
  ),
  Stay(
    title: "Apartment in Lillestrøm",
    location: "Lillestrøm",
    image: "images/Lillestrom.jpg",
    rating: 4.95,
    reviewsCount: 200,
    guests: 4,
    bedrooms: 2,
    beds: 2,
    bathrooms: 2,
    originalPrice: 120,
    discountedPrice: 99,
    totalPrice: 280,
    isFavorite: false,
  ),
];

