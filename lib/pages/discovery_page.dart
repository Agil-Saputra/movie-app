// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:movie_app/pages/search_page.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/widgets/heading.dart';
import 'package:movie_app/widgets/movie_card.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  List films = [];
  List genres = [];
  int genreId = 28;
  String keyword = '';
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllGenres();
    getMoviesByGenres();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeadingTitle(title: "Discovery"),
              Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: TextField(
                  onSubmitted: (value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchPage(prevKeyword: value),
                        ));
                  },
                  decoration: InputDecoration(
                      hintText: "Search Movies, TV Shows, People",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.amberAccent, width: 2.0),
                      ),
                      suffixIcon: Icon(
                        Icons.search_rounded,
                        size: 28,
                      )),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: SizedBox(
                  width: 500,
                  height: 40,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 6,
                    ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: genres.length,
                    itemBuilder: (context, index) {
                      final genre = genres[index] as Map;
                      return OutlinedButton(
                          onPressed: () {
                            setState(() {
                              genreId = genre["id"];
                            });
                            getMoviesByGenres();
                          },
                          child: Text(
                            genre["name"],
                            style: TextStyle(color: Colors.white),
                          ));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: SizedBox(
                  child: Visibility(
                    visible: !isLoading,
                    replacement: Center(
                      child: CircularProgressIndicator(
                        color: PrimaryColor,
                      ),
                    ),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: films.length,
                      itemBuilder: (context, index) {
                        final item = films[index] as Map;
                        return SizedBox(width: 360, child: MovieCard(item: item));
                      },
                    ),
                  ),
                ),
              ),
            ]));
  }

  Future<void> getAllGenres() async {
    final Map? response = await MovieService.getMovies(
        "https://api.themoviedb.org/3/genre/movie/list?language=en");

    if (response != null) {
      setState(() {
        genres = response['genres'];
      });
    }
  }

  Future<void> getMoviesByGenres() async {
    setState(() {
      isLoading = true;
    });
    final Map? response = await MovieService.getMovies(
        "https://api.themoviedb.org/3/discover/movie?with_genres=$genreId");

    if (response != null) {
      setState(() {
        isLoading = false;
      });
      setState(() {
        films = response['results'];
      });
    }
  }
}
