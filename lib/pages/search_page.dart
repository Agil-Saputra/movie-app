import 'package:flutter/material.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/widgets/movie_card.dart';

class SearchPage extends StatefulWidget {
  final String prevKeyword;

  const SearchPage({super.key, required this.prevKeyword});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List films = [];
  String keyword = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getSearchedMovies(widget.prevKeyword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Visibility(
          visible: !isLoading,
          replacement: Center(child: CircularProgressIndicator(color: PrimaryColor,),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Visibility(
                    visible: keyword != '',
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Hasil Pencarian untuk ",
                              style: TextStyle(
                                fontSize: 16,
                              )),
                          Text("'$keyword' ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ])),
              ),
              Visibility(
                visible: films.length > 0,
                replacement: Text("Maaf Film tidak ditemukan"),
                child: SizedBox(
                  width: 500,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: films.length,
                    itemBuilder: (context, index) {
                      final item = films[index] as Map;
                      return Visibility(
                          visible: item['poster_path'] != null,
                          child:
                              SizedBox(width: 360, child: MovieCard(item: item)));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
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
      setState(() {
        isLoading = false;
      });
    }
  }
}
