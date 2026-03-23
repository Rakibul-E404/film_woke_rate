// ─────────────────────────────────────────────────────────────────────────────
//  lib/models/movie_item.dart
// ─────────────────────────────────────────────────────────────────────────────

class MovieItem {
  final String title;
  final String meta;     // e.g. "Movie • 2018 • 2hr 30min"
  final double rating;
  final String image;

  const MovieItem({
    required this.title,
    required this.meta,
    required this.rating,
    required this.image,
  });
}

// Sample data shared across tabs
const List<MovieItem> demoMovies = [
  MovieItem(
    title: 'Spider-Man: Across the Spider-Verse',
    meta: 'Movie • 2018 • 2hr 30min',
    rating: 8.5,
    image: 'assets/images/movie_poster2.png',
  ),
  MovieItem(
    title: 'Spider-Man: Across the Spider-Verse',
    meta: 'Movie • 2018 • 2hr 30min',
    rating: 8.5,
    image: 'assets/images/movie_poster2.png',
  ),
  MovieItem(
    title: 'Spider-Man: Across the Spider-Verse',
    meta: 'Movie • 2018 • 2hr 30min',
    rating: 8.5,
    image: 'assets/images/movie_poster2.png',
  ),
  MovieItem(
    title: 'Spider-Man: Across the Spider-Verse',
    meta: 'Movie • 2018 • 2hr 30min',
    rating: 8.5,
    image: 'assets/images/movie_poster2.png',
  ),
];