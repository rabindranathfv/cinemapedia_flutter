class GenreMovieDB {
  final int id;
  final String name;

  GenreMovieDB({required this.id, required this.name});

  factory GenreMovieDB.fromJson(Map<String, dynamic> json) =>
      GenreMovieDB(id: json['id'], name: json['name'] ?? '');
}
