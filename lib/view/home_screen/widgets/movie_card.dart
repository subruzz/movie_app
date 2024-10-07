import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/secrets/api_related.dart';
import 'package:movie_app/view/signup/widgets/custom_button.dart';

import '../../../model/movie_model.dart';
import '../../../utils/config/sized_boxes.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});
  final Movies movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  children: [
                    Icon(
                      Icons.arrow_drop_up,
                      size: 30,
                      color: Colors.black,
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: Colors.black,
                    ),
                    MovieCardText(
                      title: 'Votes',
                    ),
                  ],
                ),
                Spacing.width24,
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: '$imgeUrl${movie.posterPath}',
                    width: 70,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Spacing.width16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Spacing.height8,
                      MovieCardText(
                        title: 'Adult: ${movie.adult ? 'Yes' : 'No'}',
                      ),
                      MovieCardText(
                        title: 'Released: ${movie.releaseDate}',
                      ),
                      MovieCardText(
                        title:
                            'Language: ${movie.originalLanguage.toUpperCase()}',
                      ),
                      MovieCardText(
                        title: 'Rating: ${movie.voteAverage.round()}/10',
                      )
                    ],
                  ),
                )
              ],
            ),
            Spacing.height12,
            CustomButton(
              height: 35, // Kept the button height consistent
              buttonText: 'Watch Trailer',
              onPressed: () {},
              buttonColor: Colors.blue,
              textColor: Colors.white,
              width:
                  double.infinity, // Ensures the button stretches horizontally
            ),
          ],
        ),
      ),
    );
  }
}

class MovieCardText extends StatelessWidget {
  const MovieCardText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 12),
      maxLines: 1,
    );
  }
}
