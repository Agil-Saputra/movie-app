// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/widgets/heading.dart';
import 'package:movie_app/widgets/movie_card.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  List films = [];
  String keyword = '';

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
                getSearchedMovies(value);
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
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left:8),
                  child: Visibility(
                    visible: keyword != '',
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                      Text("Hasil Pencarian untuk ", style: TextStyle(fontSize: 16,)),
                      Text("'$keyword' ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ])),
                ),
                SizedBox(
                  width: 500,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: films.length,
                    itemBuilder: (context, index) {
                      final item = films[index] as Map;
                      return Visibility(
                        visible: item['poster_path'] != null,
                        child: SizedBox(width: 360, child: MovieCard(item: item)));
                    },
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Future<void> getSearchedMovies(String query) async {
    final response = await MovieService.getMovies(
        "https://api.themoviedb.org/3/search/movie?query=$query&include_adult=false&language=en-US&page=1");
    if (response != null) {
      setState(() {
        films = response['results'];
      });
      setState(() {
        keyword = query;
      });
    }
  }
}
