import 'package:cowlarfluttertask/models/movie_model.dart';
import 'package:cowlarfluttertask/screens/movie_screen.dart';
import 'package:cowlarfluttertask/widgets/movie_list_item.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Movie> movies = Movie.movies;

    return Scaffold(
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 49, 29, 53),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
          child: GNav(
            gap: 10,
            backgroundColor: Color.fromARGB(255, 49, 29, 53),
            color: Colors.white,
            activeColor: Colors.white,
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.dashboard,
                text: "Dashboard",
              ),
              GButton(
                icon: Icons.play_circle_fill_outlined,
                text: "Watch",
              ),
              GButton(
                icon: Icons.library_add,
                text: "MediaLibrary",
              ),
              GButton(
                icon: Icons.more,
                text: "More",
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: _CustomClipper(),
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 132, 191, 244),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 150.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleLarge,
                  children: [
                    TextSpan(
                        text: 'Watch',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              for (final movie in movies)
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieScreen(movie: movie),
                      ),
                    );
                  },
                  child: MovieListItem(
                    imageUrl: movie.imagePath,
                    name: movie.name,
                    information:
                        '${movie.year} | ${movie.category} | ${movie.duration.inHours}h ${movie.duration.inMinutes.remainder(60)}m',
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();

    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
