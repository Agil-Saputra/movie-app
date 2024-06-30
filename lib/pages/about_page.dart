import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About Us",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Let's talk about us",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 8,
              ),
              Text("MovieList is a community built movie and TV database. Every piece of data has been added by our amazing community dating back to 2008. MovieList's strong international focus and breadth of data is largely unmatched and something we're incredibly proud of. Put simply, we live and breathe community and that's precisely what makes us different."),
              SizedBox(
                height: 32,
              ),
               Text(
                "Our Stats",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(
                height: 16,
              ),
               Text(
                "945,266 Movies",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: PrimaryColor),
              ),
              SizedBox(
                height: 8,
              ),
               Text(
                "175,169 TV Shows",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: PrimaryColor),
              ),
              SizedBox(
                height: 8,
              ),
               Text(
                "292,048 TV Seasons",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: PrimaryColor),
              ),
              SizedBox(
                height: 8,
              ),
               Text(
                "3,493,001 People",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: PrimaryColor),
              ),
              SizedBox(
                height: 8,
              ),
               Text(
                "527,430 Edits Last Week",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: PrimaryColor),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
