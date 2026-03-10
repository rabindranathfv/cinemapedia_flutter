class Video {
  final String id;
  final String name;
  final String key;
  final String site;
  final String type;
  final bool official;
  final String publishedAt;

  Video({
    required this.id,
    required this.name,
    required this.key,
    required this.site,
    required this.type,
    required this.official,
    required this.publishedAt,
  });

  String get youtubeThumbUrl => 'https://img.youtube.com/vi/$key/hqdefault.jpg';

  String get youtubeUrl => 'https://www.youtube.com/watch?v=$key';

  bool get isFromYoutube => site.toLowerCase() == 'youtube';

  bool get isTrailer => type == 'Trailer';
  bool get isTeaser => type == 'Teaser';
  bool get isClip => type == 'Clip';
}
