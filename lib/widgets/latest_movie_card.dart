import 'package:flutter/material.dart';

class LatestMovieCard extends StatefulWidget {
  const LatestMovieCard({super.key});

  @override
  State<LatestMovieCard> createState() => _LatestMovieCardState();
}

class _LatestMovieCardState extends State<LatestMovieCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: 200,
                  image: 'https://image.tmdb.org/t/p/w500/z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg}',
                  placeholder: "assets/loading.png", // your assets image path
                  fit: BoxFit.cover,
                ),
          ),
        ],
      ),
    );
  }
}