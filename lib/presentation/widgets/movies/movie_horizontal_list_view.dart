import 'package:cinemapedia_flutter/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_flutter/domain/entities/movie.dart';

class MovieHorizontalListView extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListView(
      {super.key,
      required this.movies,
      this.title,
      this.subtitle,
      this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    print(' RENDERIZANDO WIDGED $movies $title $subtitle');
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
        height: 350,
        child: Column(
          children: [
            if (title != null || subtitle != null)
              _Title(
                title: title,
                subtitle: subtitle,
              ),
            Expanded(
                child: ListView.builder(
                    itemCount: movies.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return _Slide(movie: movies[index]);
                    }))
          ],
        ));
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Title({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          const Spacer(),
          if (subtitle != null)
            FilledButton(
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                onPressed: () {},
                child: Text(
                  subtitle!,
                  style: titleStyle,
                ))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Padding(
                        padding: EdgeInsets.all(1),
                        child: Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 2,
                        )));
                  }

                  return FadeIn(child: child);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 150,
            child: Text(movie.title, maxLines: 2, style: textStyle.titleSmall),
          ),
          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(Icons.star_rate_outlined, color: Colors.yellow.shade800),
                const SizedBox(
                  width: 3,
                ),
                Text('${movie.voteAverage}',
                    style: textStyle.bodyMedium!
                        .copyWith(color: Colors.yellow.shade800)),
                const Spacer(),
                Text(HumanFormats.number(movie.popularity),
                    style: textStyle.bodyMedium)
              ],
            ),
          )
        ],
      ),
    );
  }
}
