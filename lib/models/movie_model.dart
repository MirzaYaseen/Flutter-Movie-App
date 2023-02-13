class Movie {
  final String name;
  final String imagePath;
  final String videoPath;
  final String category;
  final int year;
  final Duration duration;

  const Movie(
      {required this.name,
      required this.imagePath,
      required this.videoPath,
      required this.category,
      required this.year,
      required this.duration});

  static const List<Movie> movies = [
    Movie(
      name: 'Free Guy',
      imagePath: 'assets/freeguy.jfif',
      videoPath: 'https://youtu.be/X2m-08cOAbc',
      category: 'Thriller',
      year: 2022,
      duration: Duration(hours: 1, minutes: 58),
    ),
    Movie(
      name: 'The Kings Man',
      imagePath: 'assets/kingsman.jpg',
      videoPath: 'assets/videos/kingsman.mp4',
      category: 'Thriller',
      year: 2022,
      duration: Duration(hours: 1, minutes: 58),
    ),
    Movie(
      name: 'Jojo Rabbit',
      imagePath: 'assets/jojo.jpg',
      videoPath: 'assets/videos/jojoRabbit.mp4',
      category: 'Thriller',
      year: 2022,
      duration: Duration(hours: 1, minutes: 58),
    ),
    Movie(
      name: 'Free Guy',
      imagePath: 'assets/freeguy.jfif',
      videoPath: 'assets/videos/freeguytrailer.mp4',
      category: 'Thriller',
      year: 2022,
      duration: Duration(hours: 1, minutes: 58),
    ),
    Movie(
      name: 'The Kings Man',
      imagePath: 'assets/kingsman.jpg',
      videoPath: 'assets/videos/kingsman.mp4',
      category: 'Thriller',
      year: 2022,
      duration: Duration(hours: 1, minutes: 58),
    ),
    Movie(
      name: 'Jojo Rabbit',
      imagePath: 'assets/jojo.jpg',
      videoPath: 'assets/videos/jojoRabbit.mp4',
      category: 'Thriller',
      year: 2022,
      duration: Duration(hours: 1, minutes: 58),
    ),
     Movie(
      name: 'Free Guy',
      imagePath: 'assets/freeguy.jfif',
      videoPath: 'assets/videos/freeguytrailer.mp4',
      category: 'Thriller',
      year: 2022,
      duration: Duration(hours: 1, minutes: 58),
    ),
    Movie(
      name: 'The Kings Man',
      imagePath: 'assets/kingsman.jpg',
      videoPath: 'assets/videos/kingsman.mp4',
      category: 'Thriller',
      year: 2022,
      duration: Duration(hours: 1, minutes: 58),
    ),
    Movie(
      name: 'Jojo Rabbit',
      imagePath: 'assets/jojo.jpg',
      videoPath: 'assets/videos/jojoRabbit.mp4',
      category: 'Thriller',
      year: 2022,
      duration: Duration(hours: 1, minutes: 58),
    ),
     Movie(
      name: 'Free Guy',
      imagePath: 'assets/freeguy.jfif',
      videoPath: 'assets/videos/freeguytrailer.mp4',
      category: 'Thriller',
      year: 2022,
      duration: Duration(hours: 1, minutes: 58),
    ),
    Movie(
      name: 'The Kings Man',
      imagePath: 'assets/kingsman.jpg',
      videoPath: 'assets/videos/kingsman.mp4',
      category: 'Thriller',
      year: 2022,
      duration: Duration(hours: 1, minutes: 58),
    ),
    Movie(
      name: 'Jojo Rabbit',
      imagePath: 'assets/jojo.jpg',
      videoPath: 'assets/videos/jojoRabbit.mp4',
      category: 'Thriller',
      year: 2022,
      duration: Duration(hours: 1, minutes: 58),
    ),
  ];
}
