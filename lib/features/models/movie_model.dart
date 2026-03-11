// class MovieModel {
//   final String title;
//   final String subtitle;
//   final double averageRating;
//   final int totalRatings;
//   final List<int> ratingDistribution;
//   final String overview;
//   final List<CastMember> cast;
//   final List<Season> seasons;
//   final List<Review> reviews;
//   final List<Recommendation> recommendations;
//
//   MovieModel({
//     required this.title,
//     required this.subtitle,
//     required this.averageRating,
//     required this.totalRatings,
//     required this.ratingDistribution,
//     required this.overview,
//     required this.cast,
//     required this.seasons,
//     required this.reviews,
//     required this.recommendations,
//   });
// }
//
// class CastMember {
//   final String name;
//   final String character;
//   final String imagePath;
//
//   CastMember({
//     required this.name,
//     required this.character,
//     this.imagePath = 'assets/images/demo_user.jpg',
//   });
// }
//
// class Season {
//   final int seasonNumber;
//   final String year;
//   final int episodeCount;
//   final double rating;
//   final String posterPath;
//
//   Season({
//     required this.seasonNumber,
//     required this.year,
//     required this.episodeCount,
//     required this.rating,
//     this.posterPath = 'assets/images/movie_poster.png',
//   });
// }
//
// class Review {
//   final String name;
//   final String imagePath;
//   final String date;
//   final String reviewText;
//
//   Review({
//     required this.name,
//     required this.imagePath,
//     required this.date,
//     required this.reviewText,
//   });
// }
//
// class Recommendation {
//   final String title;
//   final String releaseDate;
//   final String rating;
//   final String posterPath;
//
//   Recommendation({
//     required this.title,
//     required this.releaseDate,
//     required this.rating,
//     this.posterPath = 'assets/images/movie_poster.png',
//   });
// }


class MovieModel {
  String title;
  String subtitle;
  double averageRating;
  int totalRatings;
  List<int> ratingDistribution;
  String overview;
  List<CastMember> cast;
  List<Season> seasons;
  List<Review> reviews;
  List<Recommendation> recommendations;

  MovieModel({
    required this.title,
    required this.subtitle,
    required this.averageRating,
    required this.totalRatings,
    required this.ratingDistribution,
    required this.overview,
    required this.cast,
    required this.seasons,
    required this.reviews,
    required this.recommendations,
  });
}

class CastMember {
  String name;
  String character;
  String imagePath;

  CastMember({
    required this.name,
    required this.character,
    this.imagePath = 'assets/images/demo_user.jpg',
  });
}

class Season {
  int seasonNumber;
  String year;
  int episodeCount;
  double rating;
  String posterPath;

  Season({
    required this.seasonNumber,
    required this.year,
    required this.episodeCount,
    required this.rating,
    this.posterPath = 'assets/images/movie_poster.png',
  });
}

class Review {
  String name;
  String imagePath;
  String date;
  String reviewText;

  Review({
    required this.name,
    required this.imagePath,
    required this.date,
    required this.reviewText,
  });
}

class Recommendation {
  String title;
  String releaseDate;
  String rating;
  String posterPath;

  Recommendation({
    required this.title,
    required this.releaseDate,
    required this.rating,
    this.posterPath = 'assets/images/movie_poster.png',
  });
}