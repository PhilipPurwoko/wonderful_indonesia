class Attraction {
  Attraction({
    required this.name,
    required this.address,
    required this.description,
    required this.imageUrl,
  });

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      name: json['name'],
      address: json['address'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  String name;
  String address;
  String description;
  String imageUrl;
}
