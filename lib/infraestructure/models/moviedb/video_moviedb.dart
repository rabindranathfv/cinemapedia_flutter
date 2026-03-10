class VideoMovieDB {
  final String id;
  final String iso6391;
  final String iso31661;
  final String key;
  final String name;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String publishedAt;

  VideoMovieDB({
    required this.id,
    required this.iso6391,
    required this.iso31661,
    required this.key,
    required this.name,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
  });

  factory VideoMovieDB.fromJson(Map<String, dynamic> json) => VideoMovieDB(
    id: json['id'] ?? '',
    iso6391: json['iso_639_1'] ?? '',
    iso31661: json['iso_3166_1'] ?? '',
    key: json['key'] ?? '',
    name: json['name'] ?? '',
    site: json['site'] ?? '',
    size: json['size'] ?? 0,
    type: json['type'] ?? '',
    official: json['official'] ?? false,
    publishedAt: json['published_at'] ?? '',
  );
}
