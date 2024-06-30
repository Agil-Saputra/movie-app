// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:movie_app/pages/discovery_page.dart';
import 'package:movie_app/pages/myProfile_page.dart';
import 'package:movie_app/services/movie_service.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/widgets/heading.dart';
import 'package:movie_app/widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  final Map userData;
  const HomePage({super.key,
  required this.userData
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List popMoviesLists = [];
  List topMoviesLists = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getPopularMovies();
    getTopMovies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      animationDuration: Duration(milliseconds: 200),
      child: Scaffold(
          bottomNavigationBar: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.black,
              labelColor: Colors.black,
              padding: EdgeInsets.only(bottom: 50, left: 12, right: 12),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), // Creates border
                  color: PrimaryColor),
              tabs: [
                Tab(
                  icon: Icon(Icons.home_rounded),
                ),
                Tab(
                  icon: Icon(Icons.search_rounded),
                ),
                Tab(
                  icon: Icon(Icons.person_2_rounded),
                ),
              ]),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Image.asset(
              "assets/logo.png",
              width: 120,
            ),
            backgroundColor: Color(0xDD000000),
            centerTitle: false,
            toolbarHeight: 64,
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    HeadingTitle(title: "Top Rated"),
                    SizedBox(
                      height: 200,
                      child: Visibility(
                        visible: !isLoading,
                        replacement: Center(
                          child: CircularProgressIndicator(color: PrimaryColor,),
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: topMoviesLists.length,
                          itemBuilder: (context, index) {
                            final item = topMoviesLists[index] as Map;
                            return SizedBox(
                                width: 360, child: MovieCard(item: item));
                          },
                        ),
                      ),
                    ),
                    HeadingTitle(title: "Popular Movies"),
                    Visibility(
                      visible: !isLoading,
                      replacement: Center(
                        child: CircularProgressIndicator(color: PrimaryColor,),
                      ),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: popMoviesLists.length,
                        itemBuilder: (context, index) {
                          final item = popMoviesLists[index] as Map;
                          return MovieCard(item: item);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              DiscoveryPage(),
              MyProfile(userData: widget.userData,),
            ],
          )),
    );
  }

  Future<void> getPopularMovies() async {
    final Map? response = await MovieService.getMovies(
        "https://api.themoviedb.org/3/movie/popular");

    if (response != null) {
      setState(() {
        isLoading = false;
      });
      setState(() {
        popMoviesLists = response['results'];
      });
    }
  }

  Future<void> getTopMovies() async {
    final Map? response = await MovieService.getMovies(
        "https://api.themoviedb.org/3/movie/top_rated");
      setState(() {
        topMoviesLists = response?['results'];
      });
  }
}
