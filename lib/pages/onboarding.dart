import 'package:flutter/material.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/theme.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/get-started.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 48, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/logo.png",
                width: 150,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Start your Journey",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                  "Get ready to Dive into a Cinematic Universe: 200+ Movies & TV Movies Await! With over 200 movies and TV movies at your fingertips, there's something for you!."),
              SizedBox(
                height: 12,
              ),
              OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(PrimaryColor),
                      minimumSize: WidgetStatePropertyAll(Size.fromHeight(40))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    "Let's Get Started",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
