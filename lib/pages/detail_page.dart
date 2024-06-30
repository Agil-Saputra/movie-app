// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/widgets/rating_indicator.dart';
import 'package:movie_app/widgets/reviews.dart';
import 'package:movie_app/widgets/youtube_player.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  final int id;

  const DetailPage({
    super.key,
    required this.id,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map detailMovies = {};
  Map video = {};
  List credits = [];
  List recommendations = [];
  List reviews = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getDetailedMovies();
    getCredits();
    getRecommendations();
    getReviews();
    getVideoTrailer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(
          style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll<Color>(Colors.black.withOpacity(0.3)),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Visibility(
        visible: !isLoading,
        replacement: Center(
          child: CircularProgressIndicator(
            color: PrimaryColor,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FadeInImage.assetNetwork(
                image:
                    'https://image.tmdb.org/t/p/w500${detailMovies['poster_path']}',
                placeholder: "assets/loading.png", // your assets image path
                fit: BoxFit.cover,
                width: 500,
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12, right: 12, left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detailMovies['title'] ?? "Loading...",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: 500,
                      height: 40,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          width: 6,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: detailMovies['genres'] != null
                            ? detailMovies['genres'].length
                            : 0,
                        itemBuilder: (context, index) {
                          final genres = detailMovies['genres'][index];
                          return OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "${genres['name']}",
                                style: TextStyle(color: Colors.white),
                              ));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Text(
                          "${detailMovies['release_date'] ?? "Loading..."} • ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          formatDuration(detailMovies['runtime'] ?? 0),
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        OutlinedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll<Color>(Colors.white),
                                iconColor: WidgetStatePropertyAll<Color>(
                                    Colors.black)),
                            onPressed: () {
                               showDialog(
                                context: context, 
                                builder: ((context) {
                                  return Trailer(id : video["key"]);
                                }));
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Watch Trailer",
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(Icons.play_circle),
                              ],
                            )),
                        RatingIndicator(item: detailMovies)
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ReadMoreText(
                      detailMovies['overview'] ?? "Loading...",
                      trimMode: TrimMode.Line,
                      trimLines: 4,
                      trimCollapsedText: 'Read more',
                      trimExpandedText: 'Show less',
                      moreStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      lessStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Cast",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: 500,
                      height: 155,
                      child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                width: 16,
                              ),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: credits.length,
                          itemBuilder: (context, index) {
                            final people = credits[index];
                            return Visibility(
                              visible: people['profile_path'] != null,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                      child: FadeInImage.assetNetwork(
                                        width: 100,
                                        height: 100,
                                        image:
                                            'https://image.tmdb.org/t/p/original/${people['profile_path']}}',
                                        placeholder: "assets/loading.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      people['name'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(people['character']),
                                  ]),
                            );
                          }),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Recommendation",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 24),
                    Visibility(
                      visible: !isLoading,
                      replacement: Center(
                        child: CircularProgressIndicator(
                          color: PrimaryColor,
                        ),
                      ),
                      child: SizedBox(
                        width: 500,
                        height: 300,
                        child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 12,
                                ),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: recommendations.length,
                            itemBuilder: (context, index) {
                              final film = recommendations[index] as Map;
                              return Container(
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPage(
                                                      id: film['id'],
                                                    )));
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: FadeInImage.assetNetwork(
                                          width: 200,
                                          image:
                                              'https://image.tmdb.org/t/p/w200/${film['poster_path']}}',
                                          placeholder: "assets/loading.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Reviews",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 500,
                      child:  ListView.separated(
                         separatorBuilder: (context, index) => SizedBox(
                                  height: 20,
                                ),
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 20),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: reviews.length,
                          itemBuilder: (context, index) {
                            final review = reviews[index] as Map;
                            return Review(review: review);
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getDetailedMovies() async {
    final response = await MovieService.getMovies(
        "https://api.themoviedb.org/3/movie/${widget.id}");
    if (response != null) {
      setState(() {
        detailMovies = response;
      });
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> getCredits() async {
    final response = await MovieService.getMovies(
        "https://api.themoviedb.org/3/movie/${widget.id}/credits");
    if (response != null) {
      setState(() {
        credits = response['cast'];
      });
    }
  }

  Future<void> getRecommendations() async {
    final response = await MovieService.getMovies(
        "https://api.themoviedb.org/3/movie/${widget.id}/recommendations");
    if (response != null) {
      setState(() {
        recommendations = response['results'];
      });
    }
  }

  Future<void> getReviews() async {
    final response = await MovieService.getMovies(
        "https://api.themoviedb.org/3/movie/${widget.id}/reviews");
    if (response != null) {
      setState(() {
        reviews = response['results'];
      });
    }
  }

   Future<void> getVideoTrailer() async {
    final response = await MovieService.getMovies(
        "https://api.themoviedb.org/3/movie/${widget.id}/videos");
      setState(() {
        video = response?['results'][0];
      });
  }

  String formatDuration(int totalMinutes) {
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;
    return '${hours}hr ${minutes}m';
  }
}
