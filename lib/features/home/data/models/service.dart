class ServiceSystem {
  final String title;
  final String description;
  bool? isFavorite;
  bool? isSystem;

  ServiceSystem({required this.title,
    required this.description,
    this.isFavorite,
    this.isSystem,
  });
}