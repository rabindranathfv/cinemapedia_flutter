import 'package:flutter/material.dart';

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  /// Icon mapped to TMDB genre IDs
  IconData get icon => _genreIcons[id] ?? Icons.movie;

  /// Short description for each genre
  String get description => _genreDescriptions[id] ?? 'Explore $name movies';

  /// Gradient colors per genre for visual flair
  List<Color> get gradientColors =>
      _genreGradients[id] ??
      [Colors.blueGrey.shade700, Colors.blueGrey.shade400];

  static const Map<int, IconData> _genreIcons = {
    28: Icons.local_fire_department, // Action
    12: Icons.explore, // Adventure
    16: Icons.animation, // Animation
    35: Icons.sentiment_very_satisfied, // Comedy
    80: Icons.gavel, // Crime
    99: Icons.videocam, // Documentary
    18: Icons.theater_comedy, // Drama
    10751: Icons.family_restroom, // Family
    14: Icons.auto_awesome, // Fantasy
    36: Icons.menu_book, // History
    27: Icons.nights_stay, // Horror
    10402: Icons.music_note, // Music
    9648: Icons.search, // Mystery
    10749: Icons.favorite, // Romance
    878: Icons.rocket_launch, // Science Fiction
    10770: Icons.tv, // TV Movie
    53: Icons.warning_amber, // Thriller
    10752: Icons.shield, // War
    37: Icons.landscape, // Western
  };

  static const Map<int, String> _genreDescriptions = {
    28: 'Explosive stunts, epic fights and non-stop adrenaline',
    12: 'Journey into the unknown with daring heroes',
    16: 'Colorful worlds brought to life frame by frame',
    35: 'Laugh-out-loud stories to brighten your day',
    80: 'Dark tales of justice, corruption and intrigue',
    99: 'Real stories that inform and inspire',
    18: 'Deep emotions, powerful performances, gripping plots',
    10751: 'Heartwarming stories the whole family can enjoy',
    14: 'Magical realms, mythical creatures and wonder',
    36: 'Relive the defining moments that shaped the world',
    27: 'Spine-chilling scares that keep you up at night',
    10402: 'Feel the rhythm with music-driven narratives',
    9648: 'Unravel secrets and follow the clues',
    10749: 'Love stories that tug at your heartstrings',
    878: 'Explore the cosmos and the future of humanity',
    10770: 'Made-for-TV movies with captivating stories',
    53: 'Edge-of-your-seat suspense and tension',
    10752: 'Courage, sacrifice and battles that changed history',
    37: 'Outlaws, gunslingers and the wild frontier',
  };

  static const Map<int, List<Color>> _genreGradients = {
    28: [Color(0xFFE53935), Color(0xFFFF7043)], // Action - red/orange
    12: [Color(0xFF43A047), Color(0xFF66BB6A)], // Adventure - green
    16: [Color(0xFF7E57C2), Color(0xFFBA68C8)], // Animation - purple
    35: [Color(0xFFFDD835), Color(0xFFFFB300)], // Comedy - yellow
    80: [Color(0xFF37474F), Color(0xFF78909C)], // Crime - dark grey
    99: [Color(0xFF00897B), Color(0xFF4DB6AC)], // Documentary - teal
    18: [Color(0xFF5C6BC0), Color(0xFF7986CB)], // Drama - indigo
    10751: [Color(0xFFEC407A), Color(0xFFF48FB1)], // Family - pink
    14: [Color(0xFF8E24AA), Color(0xFFCE93D8)], // Fantasy - deep purple
    36: [Color(0xFF8D6E63), Color(0xFFBCAAA4)], // History - brown
    27: [Color(0xFF212121), Color(0xFF616161)], // Horror - black/grey
    10402: [Color(0xFFE91E63), Color(0xFFF06292)], // Music - magenta
    9648: [Color(0xFF1565C0), Color(0xFF42A5F5)], // Mystery - blue
    10749: [Color(0xFFD81B60), Color(0xFFF48FB1)], // Romance - rose
    878: [Color(0xFF0277BD), Color(0xFF4FC3F7)], // Sci-Fi - cyan
    10770: [Color(0xFF546E7A), Color(0xFF90A4AE)], // TV Movie - blue grey
    53: [Color(0xFFE65100), Color(0xFFFF8A65)], // Thriller - deep orange
    10752: [Color(0xFF4E342E), Color(0xFF8D6E63)], // War - dark brown
    37: [Color(0xFFFF8F00), Color(0xFFFFCA28)], // Western - amber
  };
}
