import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Trailer extends StatefulWidget {
  final String id;
  const Trailer({super.key, required this.id});

  @override
  State<Trailer> createState() => _YoutubePlayerState();
}

class _YoutubePlayerState extends State<Trailer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (context, player) {
          return Column(
            children: [
              SizedBox(height: 150),
              player,
              //some other widgets
            ],
          );
        });
  }
}
