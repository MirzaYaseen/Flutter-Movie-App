import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;
  const MovieScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ..._buildBackground(context, movie),
          _buildMovieInformation(context),
          Positioned(
            bottom: 50,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(15.0),
                        primary: const Color.fromARGB(255, 140, 216, 243),
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.425, 50),
                      ),
                      onPressed: () {},
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.grey),
                            children: [
                              TextSpan(
                                text: 'Get Ticket',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )
                            ]),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Positioned _buildMovieInformation(BuildContext context) {
    return Positioned(
      top: 250,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              movie.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${movie.year} |${movie.category} | ${movie.duration.inHours}h  ${movie.duration.inMinutes.remainder(60)}m',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'As a collection of historys worst tyrants and criminal masterminds gather to plot a war to wipe out millions, one man must race against time to stop them. Discover the origins of the very first independent intelligence agency in The Kings Man. The Comic Book “The Secret Service” by Mark Millar and Dave Gibbons.',
              maxLines: 8,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(height: 1.75, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBackground(
    context,
    movie,
  ) {
    return [
      Container(
        height: double.infinity,
        color: Color.fromARGB(255, 245, 247, 250),
      ),
      Image.network(
        movie.imagePath,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        fit: BoxFit.cover,
      ),
      const Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Color.fromARGB(255, 244, 244, 247)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.5],
            ),
          ),
        ),
      ),
    ];
  }
}
