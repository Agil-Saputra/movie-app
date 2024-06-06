import 'package:flutter/material.dart';
import 'package:movie_app/pages/detail_page.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/widgets/rating_indicator.dart';

class MovieCard extends StatefulWidget {
  final Map item;

  const MovieCard({
    super.key,
    required this.item,
  });

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {


  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return GestureDetector(
      onTap: () {
        final movie = widget.item;
        Navigator.push(context, MaterialPageRoute(builder : (context) => DetailPage(id: movie['id'],)));
      },
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child:
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: FadeInImage.assetNetwork(
                  width: 120,
                  image: 'https://image.tmdb.org/t/p/w200${item['poster_path']}',
                  placeholder: "assets/loading.png", // your assets image path
                  fit: BoxFit.cover,
                ),
              )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(item['title'], textAlign: TextAlign.left, style: title1),
              Text(
                item['overview'],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              RatingIndicator(item: item)
            ],
          ))
        ]),
      )),
    );
  }
}
