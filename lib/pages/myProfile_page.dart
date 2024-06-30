import 'package:flutter/material.dart';
import 'package:movie_app/pages/about_page.dart';
import 'package:movie_app/pages/guidelines.dart';
import 'package:movie_app/widgets/heading.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProfile extends StatefulWidget {
  final Map userData;
  const MyProfile({super.key,
  required this.userData});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HeadingTitle(title: "My Profile"),
          SizedBox(
            width: 75,
            height: 75,
            child: CircleAvatar(
              radius: 100,
              child: Text(widget.userData["name"][0].toUpperCase(), 
              style: TextStyle(fontSize: 28),),
            ),
          ),
          SizedBox(
            height: 12,
          ),
              Text(
                      widget.userData["name"].toUpperCase(),
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
              Text(
                      widget.userData["email"],
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(color: Colors.white10,borderRadius: BorderRadius.all(Radius.circular(8))),
              height: 55,
              width: 350,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.settings,
                      size: 26,
                    ),
                    SizedBox(width: 8),
                    Text('Settings'),
                    Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Guideline()));
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.white10,borderRadius: BorderRadius.all(Radius.circular(8))),
              height: 55,
              width: 350,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.shield,
                      size: 26,
                    ),
                    SizedBox(width: 8),
                    Text('Guidelines'),
                    Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                    MaterialPageRoute(builder: (context) => About()));
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.white10,borderRadius: BorderRadius.all(Radius.circular(8))),
              height: 55,
              width: 350,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.question_mark,
                      size: 26,
                    ),
                    SizedBox(width: 8),
                    Text('About Us'),
                    Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () async {
               final Uri url = Uri.parse('https://developer.themoviedb.org/reference/intro/getting-started');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    );
                  } else {
                    throw 'Cannot launch $url';
                  }
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.white10,borderRadius: BorderRadius.all(Radius.circular(8))),
              height: 55,
              width: 350,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.api,
                      size: 26,
                    ),
                    SizedBox(width: 8),
                    Text('Our API'),
                    Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
