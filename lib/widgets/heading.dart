import 'package:flutter/material.dart';
import 'package:movie_app/theme.dart';

class HeadingTitle extends StatefulWidget {
  final String title;

  const HeadingTitle({
    super.key,
    required this.title
    });

  @override
  State<HeadingTitle> createState() => _HeadingTitleState();
}

class _HeadingTitleState extends State<HeadingTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.only(left: 8, bottom: 20, top: 16),
              child: RichText(
                text: TextSpan(
                  text: widget.title,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  children: <TextSpan>[
                    TextSpan(
                        text: '.',
                        style: TextStyle(fontSize: 32, color: PrimaryColor)),
                  ],
                ),
              ),
            );
  }
}