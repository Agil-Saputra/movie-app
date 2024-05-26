// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/widgets/bottom_bar.dart';
import 'package:movie_app/widgets/heading.dart';
import 'package:movie_app/widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List moviesLists = [];
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllMovies();
    getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          width: 120,
        ),
        backgroundColor: Color(0xDD000000),
        centerTitle: false,
        toolbarHeight: 64,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           HeadingTitle(title: "Latest"),
           HeadingTitle(title: "Trending"),
           
           HeadingTitle(title: "Movies"),
            Visibility(
              visible: !isLoading,
              replacement: Center(
                child: CircularProgressIndicator(),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: moviesLists.length,
                itemBuilder: (context, index) {
                  final item = moviesLists[index] as Map;
                  return MovieCard(item: item);
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  Future<void> getGenres() async {
    const url = "https://api.themoviedb.org/3/genre/movie/list";
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ODZmOThhZGRmNDI2ZTY2NDZhYmVjOTIyZWE0YzEyYSIsInN1YiI6IjY1ZGZmZWJhMmQ1MzFhMDE2MmJlZWQ0MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Olu0l33GvUVewdfwns7vtojGDyF6ksXL_pP2hjvRAZ8',
    });

    print(response.body);
    print(response.statusCode);
  }

  Future<void> getAllMovies() async {
    const url =
        "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc";
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader:
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ODZmOThhZGRmNDI2ZTY2NDZhYmVjOTIyZWE0YzEyYSIsInN1YiI6IjY1ZGZmZWJhMmQ1MzFhMDE2MmJlZWQ0MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Olu0l33GvUVewdfwns7vtojGDyF6ksXL_pP2hjvRAZ8',
    });
    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      setState(() {
        moviesLists = responseJson['results'];
      });
    }
    ;
  }
}
