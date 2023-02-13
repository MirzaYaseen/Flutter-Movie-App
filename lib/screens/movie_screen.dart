import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

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
        ],
      ),
    );
  }

  Positioned _buildMovieInformation(BuildContext context) {
    return Positioned(
      top: 150,
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
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
                primary: const Color.fromARGB(255, 140, 216, 243),
                fixedSize: Size(MediaQuery.of(context).size.width * 0.425, 50),
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
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      )
                    ]),
              ),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(5.0),
                primary: Color.fromARGB(255, 44, 55, 59),
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.425,
                  50,
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _MoviePlayer(movie: movie),
                  ),
                );
              },
              child: RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.grey,
                        ),
                    children: [
                      TextSpan(
                        text: 'Watch Trailer',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      )
                    ]),
              ),
            ),
            const SizedBox(height: 100),
            Text(
              'Overview',
              style: const TextStyle(
                color: Color.fromARGB(255, 9, 7, 7),
                fontSize: 22,
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

class _MoviePlayer extends StatefulWidget {
  const _MoviePlayer({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  State<_MoviePlayer> createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<_MoviePlayer> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();

    videoPlayerController = VideoPlayerController.asset(widget.movie.videoPath)
      ..initialize().then((value) {
        setState(() {});
      });

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}
